//
//  HNHttpRequestManager.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/24/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNHttpRequestManager.h"
#import "AFNetworking.h"

@interface HNHttpRequestManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager* manager;

@end

@implementation HNHttpRequestManager

+ (instancetype)sharedInstance
{
    static HNHttpRequestManager *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[HNHttpRequestManager alloc] init];
    });
    
    return object;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        const int kNetworkTimeOutInterval = 60;
        
        AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
        self.manager = manager;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/json", @"application/json", nil];
        manager.requestSerializer.timeoutInterval = kNetworkTimeOutInterval;
    }
    return self;
}

- (void)sendRequest:(HNHttpRequest *)request callback:(HNResultCallback)callback
{
    AFHTTPRequestOperationManager* manager = self.manager;
    
    [request.headerDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
    
    if([request.method compare:@"POST" options:NSCaseInsensitiveSearch] == NSOrderedSame)
    {
        [manager POST:request.url parameters:request.paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            request.response = responseObject;
            
            callback(nil);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            request.response = operation.responseObject;
            
            NSError *err = [NSError errorWithCode:8 msg:@"请求失败"];
            callback(err);
        }];
    }
    else if([request.method compare:@"GET" options:NSCaseInsensitiveSearch] == NSOrderedSame)
    {
        [manager GET:request.url parameters:request.paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            request.response = responseObject;
            
            callback(nil);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            request.response = operation.responseObject;
            
            NSError *err = [NSError errorWithCode:8 msg:@"请求失败"];
            callback(err);
        }];
    }
    else
    {
        NSError *err = [NSError errorWithCode:9 msg:@"Method不支持"];
        callback(err);
    }
}

@end
