//
//  HNKeyList.h
//  HNDemo-iPhone
//
//  Created by shuilin on 5/13/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//搜索历史关键字列表
@interface HNKeyList : NSObject

@property (readonly, strong, nonatomic) NSMutableArray *keys;

//查
- (void)load:(HNResultCallback)callback;

//增
- (void)add:(NSString *)key callback:(HNResultCallback)callback;

//删
- (void)removeAtIndex:(NSUInteger)index callback:(HNResultCallback)callback;

//清
- (void)removeAll:(HNResultCallback)callback;

@end

NS_ASSUME_NONNULL_END
