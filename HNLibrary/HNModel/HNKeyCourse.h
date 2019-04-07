//
//  HNKeyCourse.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNKeyCourse : NSObject

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *thumbImageUrl;

@property (strong, nonatomic) NSString *org_name;

//网络请求回来的数据更新到模型
- (void)setWithResponse:(id)response;

@end

NS_ASSUME_NONNULL_END
