//
//  TrackWatcher.m
//  TrackServer
//
//  Created by Chris Cormack on 24/02/2019.
//  Copyright © 2019 Chris Cormack. All rights reserved.
//

#import "TrackWatcher.h"
#import <GRPCClient/GRPCCall+Tests.h>
#import <TrackNotify.pbrpc.h>
#import <RxLibrary/GRXWriter+Immediate.h>
#import <RxLibrary/GRXWriter+Transformations.h>

// Based on https://github.com/kirtan-shah/nowplaying-cli/blob/main/src/nowplaying.mm
typedef void (*MRMediaRemoteGetNowPlayingInfoFunction)(dispatch_queue_t queue, void (^handler)(NSDictionary* information));
typedef void (*MRMediaRemoteGetNowPlayingApplicationIsPlayingFunction)(dispatch_queue_t queue, void (^handler)(Boolean information));
typedef void (*MRMediaRemoteRegisterForNowPlayingNotificationsFunction)(dispatch_queue_t queue);

static NSString * const kHostAddress = @"127.0.0.1:50051";

@implementation TrackWatcher {

@private
    TRKTrackNotify *_service;
    NSDictionary *_latestState;
    MRMediaRemoteGetNowPlayingInfoFunction _MRMediaRemoteGetNowPlayingInfo;
    MRMediaRemoteGetNowPlayingApplicationIsPlayingFunction _MRMediaRemoteGetNowPlayingApplicationIsPlaying;
    MRMediaRemoteRegisterForNowPlayingNotificationsFunction _MRMediaRemoteRegisterForNowPlayingNotifications;
}

- (id) init {
    self = [super init];
    if (!self) return nil;
    
    [GRPCCall useInsecureConnectionsForHost:kHostAddress];
    
    _service = [[TRKTrackNotify alloc] initWithHost:kHostAddress];
    
    CFURLRef ref = (__bridge CFURLRef) [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/MediaRemote.framework"];
    CFBundleRef bundle = CFBundleCreate(kCFAllocatorDefault, ref);
    
    _MRMediaRemoteGetNowPlayingInfo = (MRMediaRemoteGetNowPlayingInfoFunction) CFBundleGetFunctionPointerForName(bundle, CFSTR("MRMediaRemoteGetNowPlayingInfo"));
    _MRMediaRemoteGetNowPlayingApplicationIsPlaying = (MRMediaRemoteGetNowPlayingApplicationIsPlayingFunction) CFBundleGetFunctionPointerForName(bundle, CFSTR("MRMediaRemoteGetNowPlayingApplicationIsPlaying"));
    _MRMediaRemoteRegisterForNowPlayingNotifications = (MRMediaRemoteRegisterForNowPlayingNotificationsFunction) CFBundleGetFunctionPointerForName(bundle, CFSTR("MRMediaRemoteRegisterForNowPlayingNotifications"));
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTrackInfo) name:@"kMRMediaRemoteNowPlayingInfoDidChangeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTrackInfo) name:@"kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification" object:nil];
    _MRMediaRemoteRegisterForNowPlayingNotifications(dispatch_get_main_queue());_latestState = nil;
    
    return self;
}

- (void) attemptConnection {
    TrackWatcher * __weak weakSelf = self;
    
    [_service playerStateNotifierWithRequest:[[GPBEmpty alloc] init] eventHandler:^(BOOL done, TRKTrackState * _Nullable response, NSError * _Nullable error) {
        if (done) {
            if (error != nil) {
                NSLog(@"%@", error);
                NSLog(@"Connection down due to error, attempting reconnect in 2s");
                [NSThread sleepForTimeInterval:2.0f];
            } else {
                NSLog(@"Connection lost, attempting reconnect in 500ms");
                [NSThread sleepForTimeInterval:.5f];
            }
            [weakSelf attemptConnection];
            
            return;
        }
        if (error != nil) {
            NSLog(@"error: %@", error);
        } else if (response != nil) {
            switch (response.playerState) {
                case TRKPlayerState_Handshake:
                    NSLog(@"Received handshake.");
                    [weakSelf sendTrackState];
                    break;
                case TRKPlayerState_Ping:
                    NSLog(@"Ping");
                    break;
                case TRKPlayerState_Playing:
                    [weakSelf play];
                    break;
                case TRKPlayerState_Paused:
                    [weakSelf pause];
                    break;
                default:
                    NSLog(@"Encountered unrecognised player state (%d)", response.playerState);
            }
        }
        
    }];
}

- (void) waitAndProcess {
    [self attemptConnection];
    [self updateTrackInfo];
    CFRunLoopRun();
}

- (void) updateTrackInfo {
    NSMutableDictionary *newState = [[NSMutableDictionary alloc] init];
    
    dispatch_group_t aGroup = dispatch_group_create();
    dispatch_group_enter(aGroup);
    _MRMediaRemoteGetNowPlayingInfo(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(NSDictionary* information) {
        NSString *artist = [information objectForKey:@"kMRMediaRemoteNowPlayingInfoArtist"];
        NSString *title = [information objectForKey:@"kMRMediaRemoteNowPlayingInfoTitle"];
        
        [newState setValue:artist forKey:@"Artist"];
        [newState setValue:title forKey:@"Name"];
        
        dispatch_group_leave(aGroup);
    });
    dispatch_group_enter(aGroup);
    _MRMediaRemoteGetNowPlayingApplicationIsPlaying(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(Boolean isPlaying) {
        [newState setValue:(isPlaying ? @"Playing" : @"Paused") forKey:@"Player State"];
        
        dispatch_group_leave(aGroup);
    });
    dispatch_group_wait(aGroup, DISPATCH_TIME_FOREVER);
    
    _latestState = newState;

    [self sendTrackState];
}

- (void) play {
    NSLog(@"Triggering play");
//    if ([_iTunes isRunning] && [_iTunes playerState] != iTunesEPlSPlaying)
//    {
//        [_iTunes playpause];
//    }
}

- (void) pause {
    NSLog(@"Triggering pause");
//    if ([_iTunes isRunning] && [_iTunes playerState] == iTunesEPlSPlaying)
//    {
//        [_iTunes playpause];
//    }
}

- (void) sendTrackState {
    TRKTrackDetails *trackDetails = [TRKTrackDetails message];
    
    if (_latestState != nil) {
        trackDetails.artist = [_latestState objectForKey:@"Artist"];
        trackDetails.title = [_latestState objectForKey:@"Name"];
        NSString *playerState = [_latestState objectForKey:@"Player State"];
        if ([playerState isEqualToString:@"Playing"]) {
            trackDetails.playerState = TRKPlayerState_Playing;
        } else if ([playerState isEqualToString:@"Paused"]) {
            trackDetails.playerState = TRKPlayerState_Paused;
        } else {
            NSLog(@"Unknown player state: %@", playerState);
            trackDetails.playerState = TRKPlayerState_Paused;
        }
    } else {
        trackDetails.artist = @"";
        trackDetails.title = @"";
        trackDetails.playerState = TRKPlayerState_Paused;
    }
    
    if (_service == nil) {
        NSLog(@"Track status: %@", trackDetails);
        return;
    }
    
    [_service notifyCurrentTrackWithRequest:trackDetails handler:^(GPBEmpty * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error sending track details");
            NSLog(@"%@", error);
        } else {
            NSLog(@"Sent current track state: %@", trackDetails);
        }
    }];
}

@end
