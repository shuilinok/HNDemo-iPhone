//
//  HNDemoLocalImp.m
//  HNDemo-iPhone
//
//  Created by shuilin on 5/15/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNDemoLocalImp.h"

@implementation HNDemoLocalImp

+ (instancetype)sharedImp
{
    static HNDemoLocalImp *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[HNDemoLocalImp alloc] init];
    });
    
    return object;
}

@end
