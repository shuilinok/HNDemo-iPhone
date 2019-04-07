//
//  HNHttpRequest.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/23/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNHttpRequest.h"
#import "HNHttpRequestManager.h"

@implementation HNHttpRequest

- (void)send:(HNResultCallback)callback
{
    [[HNHttpRequestManager sharedInstance] sendRequest:self callback:^(NSError *error) {
       
        callback(error);
    }];
}

@end
