//
//  NSString+HN.m
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/31.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "NSString+HN.h"

@implementation NSString (HN)

//截取字符串
- (NSString *)hn_remainString:(NSString *)subString {
    if(subString.length == 0) {
        return self;
    }
    
    NSRange range = [self rangeOfString:subString];
    if(range.location != NSNotFound) {
        NSString *remain = [self substringWithRange:range];
        
        return remain;
    }
    
    return self;
}
@end
