//
//  HNKeyCourseList.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyCourseList.h"
#import "HNDemoServerImp.h"

@interface HNKeyCourseList ()

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

- (void)load:(HNResultCallback)callback
{
    self.offset = 0;
    
    [[HNDemoServerImp sharedImp] searchKeyCourses:self.key offset:self.offset limit:self.limit callback:^(id data, NSError *error) {
        
        if(error.code == noErr)
        {
            [self setWithResponse:data];
            
            self.offset += self.limit;
        }
        
        callback(error);
    }];
}

- (void)loadMore:(HNResultCallback)callback
{
    [[HNDemoServerImp sharedImp] searchKeyCourses:self.key offset:self.offset limit:self.limit callback:^(id data, NSError *error) {
        
        if(error.code == noErr)
        {
            [self appendWithResponse:data];
            
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
