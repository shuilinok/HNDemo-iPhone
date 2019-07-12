//
//  NSError+HN.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/24/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "NSError+HN.h"

#define kErrorMessage     @"ErrorMessage"


@implementation NSError (HN)

+ (NSError *)errorWithCode:(NSUInteger)code msg:(NSString *)message
{
    NSDictionary *userInfo = @{
                               kErrorMessage:message ? : @""
                               };
    
    NSError *error = [NSError errorWithDomain:@"com.HNFoundation.iOS" code:code userInfo:userInfo];
    
    return error;
}

/* 错误信息 */
- (NSString *)msg
{
    return [self.userInfo objectForKey:kErrorMessage];
}

@end
