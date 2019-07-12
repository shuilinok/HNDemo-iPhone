//
//  MainBlockLogger.h
//  Mic
//
//  Created by matelin on 2019/7/9.
//  Copyright © 2019. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//主线程卡顿记录器
@interface MainBlockLogger : NSObject

+ (instancetype)sharedInstance;

//开始记录
- (void)start;

@end

NS_ASSUME_NONNULL_END
