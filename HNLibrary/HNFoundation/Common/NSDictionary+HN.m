//
//  NSDictionary+HN.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "NSDictionary+HN.h"

@implementation NSDictionary (HN)

- (NSString *)stringForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        return value;
    }
    
    return nil;
}

- (NSNumber *)boolNumberForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        NSNumber *number = [NSNumber numberWithBool:[value boolValue]];
        
        return number;
    }
    
    return nil;
}

- (NSNumber *)intForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        NSNumber *number = [NSNumber numberWithInteger:[value integerValue]];
        
        return number;
    }
    
    return nil;
}

- (NSNumber *)doubleForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if(object)
    {
        NSString *value = [NSString stringWithFormat:@"%@",object];
        NSNumber *number = [NSNumber numberWithDouble:[value doubleValue]];
        
        return number;
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)key
{
    if(key.length == 0)
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if([object isKindOfClass:[NSArray class]])
    {
        return object;
    }
    
    return nil;
}

@end
