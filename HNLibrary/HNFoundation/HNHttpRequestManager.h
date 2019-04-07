//
//  HNHttpRequestManager.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/24/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HNHttpRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNHttpRequestManager : NSObject

+ (instancetype)sharedInstance;

- (void)sendRequest:(HNHttpRequest *)request callback:(HNResultCallback)callback;

@end

NS_ASSUME_NONNULL_END
