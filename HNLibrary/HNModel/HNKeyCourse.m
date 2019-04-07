//
//  HNKeyCourse.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyCourse.h"

@implementation HNKeyCourse

//网络请求回来的数据更新到模型
- (void)setWithResponse:(id)response
{
    if([response isKindOfClass:[NSDictionary class]])
    {
        self.thumbImageUrl = [response stringForKey:@"thumbnail"];
        self.name = [response stringForKey:@"name"];
        self.org_name = [response stringForKey:@"org_name"];
    }
}

@end
