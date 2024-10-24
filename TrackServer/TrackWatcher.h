//
//  TrackWatcher.h
//  TrackServer
//
//  Created by Chris Cormack on 24/02/2019.
//  Copyright © 2019 Chris Cormack. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrackWatcher : NSObject

- (void)waitAndProcess;

@end

NS_ASSUME_NONNULL_END
