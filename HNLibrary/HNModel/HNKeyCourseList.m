//
//  HNKeyCourseList.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyCourseList.h"
#import "HNDemoHttpRequest.h"

@interface HNKeyCourseList ()

@property (assign, nonatomic) NSUInteger offset;

@property (strong, nonatomic) NSMutableArray *courses;

@end


@implementation HNKeyCourseList

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.offset = 0;
        self.limit = 10; //默认
        self.courses = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (HNDemoHttpRequest *)createLoadRequest
{
    HNDemoHttpRequest *request = [HNDemoHttpRequest basicRequest];
    request.url = kCourseSearchUrl;
    request.method = @"GET";
    
    NSString *keyword = self.key ? : @"";
    NSString *type = @"all";
    NSString *limit = [NSString stringWithFormat:@"%lu",(unsigned long)self.limit];
    NSString *offset = [NSString stringWithFormat:@"%lu",(unsigned long)self.offset];
    NSString *courseId = @"";
    
    NSDictionary *paramDict = [NSDictionary dictionaryWithObjectsAndKeys:
                               keyword, @"keyword",
                               type, @"type",
                               courseId, @"course_id",
                               offset, @"offset",
                               limit, @"limit",
                               @"0,1",@"course_type",
                               nil];
    request.paramDict = paramDict;
    
    return request;
}

- (void)load:(HNResultCallback)callback
{
    self.offset = 0;
    
    HNDemoHttpRequest *request = [self createLoadRequest];
    
    [request send:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [self setWithResponse:request.response];
            
            self.offset += self.limit;
        }
        
        callback(error);
    }];
}

- (void)loadMore:(HNResultCallback)callback
{
    HNDemoHttpRequest *request = [self createLoadRequest];
    
    [request send:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [self appendWithResponse:request.response];
            
            self.offset += self.limit;
        }
        
        callback(error);
    }];
}

//网络请求回来的数据更新到模型
- (void)setWithResponse:(id)response
{
    [self.courses removeAllObjects];
    
    [self appendWithResponse:response];
}

- (void)appendWithResponse:(id)response
{
    if([response isKindOfClass:[NSDictionary class]])
    {
        NSArray *arr = [response arrayForKey:@"courses"];
        for(NSDictionary *dict in arr)
        {
            HNKeyCourse *course = [[HNKeyCourse alloc] init];
            [course setWithResponse:dict];
            
            [self.courses addObject:course];
        }
    }
}

@end
