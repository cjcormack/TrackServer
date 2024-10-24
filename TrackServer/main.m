//
//  main.m
//  TrackServer
//
//  Created by Chris Cormack on 24/02/2019.
//  Copyright © 2019 Chris Cormack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackWatcher.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[[TrackWatcher alloc] init] waitAndProcess];
    }
    return 0;
}
