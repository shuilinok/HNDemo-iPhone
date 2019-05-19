//
//  HNDemoLocalImp.h
//  HNDemo-iPhone
//
//  Created by shuilin on 5/15/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HNCallback.h"
#import "NSError+HN.h"

NS_ASSUME_NONNULL_BEGIN

//本地接口实现
@interface HNDemoLocalImp : NSObject

+ (instancetype)sharedImp;

//保存搜索关键字
- (void)saveCourseSearchKey:(NSString *)key callback:(HNResultCallback)callback;

@end

NS_ASSUME_NONNULL_END
