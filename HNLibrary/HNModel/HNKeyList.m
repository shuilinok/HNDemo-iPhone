//
//  HNKeyList.m
//  HNDemo-iPhone
//
//  Created by shuilin on 5/13/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyList.h"

@interface HNKeyList ()

@property (strong, nonatomic) NSMutableArray *keys;

@end

@implementation HNKeyList

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        self.keys = [[NSMutableArray alloc] init];
    }
    
    return self;
}

//查
- (void)load:(HNResultCallback)callback
{
    
}

//增
- (void)add:(NSString *)key callback:(HNResultCallback)callback
{
    
}

//删
- (void)removeAtIndex:(NSUInteger)index callback:(HNResultCallback)callback
{
    
}

//清
- (void)removeAll:(HNResultCallback)callback
{
    
}

@end
