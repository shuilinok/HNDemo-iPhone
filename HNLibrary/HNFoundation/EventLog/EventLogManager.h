//
//  EventLogManager.h
//  Mic
//
//  Created by matelin on 2019/7/4.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import <Foundation/Foundation.h>

//无痕埋点管理器
@interface EventLogManager : NSObject

+ (instancetype)sharedInstance;

//开始监视事件并上报
- (void)start;

@end

