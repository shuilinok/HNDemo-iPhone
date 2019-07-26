//
//  MainLoopMonitor.m
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/17.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "MainLoopMonitor.h"

@interface MainLoopMonitor () {
    CFRunLoopObserverRef observer;
}

@end

@implementation MainLoopMonitor

+ (instancetype)sharedInstance {
    static MainLoopMonitor *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[MainLoopMonitor alloc] init];
    });
    
    return object;
}

- (void)start{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //CFRunLoopRef runloop = CFRunLoopGetCurrent();
        CFRunLoopRef runloop = CFRunLoopGetMain();
        
        CFRunLoopObserverContext context = {0, (__bridge void*)self, NULL, NULL, NULL};
        
        
        observer = CFRunLoopObserverCreate(CFAllocatorGetDefault(),
                                                kCFRunLoopAllActivities,
                                                true,
                                                0,
                                                HNRunloopObserverCallBack, &context);
        CFRunLoopAddObserver(runloop, observer, kCFRunLoopCommonModes);
        //CFRelease(observer);
    });
}

static void HNRunloopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    
    MainLoopMonitor *object = (__bridge MainLoopMonitor*)info;
    
    switch (activity) {
        case kCFRunLoopBeforeWaiting: {
            //NSLog(@"空闲...");
        }
            break;
        case kCFRunLoopAfterWaiting: {
            //NSLog(@"忙碌...");
        }
            break;
        default: break;
    }
}

@end
