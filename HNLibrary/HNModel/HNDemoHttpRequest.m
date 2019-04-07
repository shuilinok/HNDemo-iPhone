//
//  HNDemoHttpRequest.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNDemoHttpRequest.h"

@implementation HNDemoHttpRequest

+ (instancetype)basicRequest
{
    HNDemoHttpRequest *request = [[HNDemoHttpRequest alloc] init];
    request.headerDict = [self basicHeaderDict];
    
    return request;
}

+ (NSMutableDictionary *)basicHeaderDict
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    return dict;
}

@end
