//
//  MainLoopMonitor.h
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/17.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainLoopMonitor : NSObject

+ (instancetype)sharedInstance;

//开始监视
- (void)start;

@end

NS_ASSUME_NONNULL_END
