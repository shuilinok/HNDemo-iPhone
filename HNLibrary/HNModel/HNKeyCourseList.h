//
//  HNKeyCourseList.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HNKeyCourse.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNKeyCourseList : NSObject

@property (strong, nonatomic) NSString *key;

@property (assign, nonatomic) NSUInteger limit;

@property (readonly, strong, nonatomic) NSMutableArray *courses;

- (void)load:(HNResultCallback)callback;

- (void)loadMore:(HNResultCallback)callback;

//网络请求回来的数据更新到模型
- (void)setWithResponse:(id)response;

- (void)appendWithResponse:(id)response;

@end

NS_ASSUME_NONNULL_END
