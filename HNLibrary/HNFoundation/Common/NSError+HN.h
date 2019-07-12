//
//  NSError+HN.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/24/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (HN)

+ (NSError *)errorWithCode:(NSUInteger)code msg:(NSString *)message;

/* 错误信息 */
- (NSString *)msg;

@end

NS_ASSUME_NONNULL_END
