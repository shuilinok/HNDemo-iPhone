//
//  HNDemoServerImp.m
//  HNDemo-iPhone
//
//  Created by shuilin on 5/15/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNDemoServerImp.h"
#import "HNHttpRequestManager.h"
#import "HNDemoURL.h"

@implementation HNDemoServerImp

+ (instancetype)sharedImp
{
    static HNDemoServerImp *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[HNDemoServerImp alloc] init];
    });
    
    return object;
}

- (NSMutableDictionary *)basicHeaderDict
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    return dict;
}

//根据关键字搜索课程
- (void)searchKeyCourses:(NSString *)key offset:(NSInteger)offset limit:(NSUInteger)limit callback:(HNDataResultCallback)callback
{
    HNHttpRequest *request = [[HNHttpRequest alloc] init];
    request.headerDict = [self basicHeaderDict];
    
    request.url = kCourseSearchUrl;
    request.method = @"GET";
    
    NSString *keyword = key ? : @"";
    NSString *type = @"all";
    NSString *limitValue = [NSString stringWithFormat:@"%lu",(unsigned long)limit];
    NSString *offsetValue = [NSString stringWithFormat:@"%lu",(unsigned long)offset];
    NSString *courseId = @"";
    
    NSDictionary *paramDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               keyword, @"keyword",
                               type, @"type",
                               courseId, @"course_id",
                               offsetValue, @"offset",
                               limitValue, @"limit",
                               @"0,1",@"course_type",
                               nil];
    request.paramDict = paramDict;
    
    [[HNHttpRequestManager sharedInstance] sendRequest:request callback:^(NSError *error) {
        
        callback(request.response, error);
    }];
}

@end
