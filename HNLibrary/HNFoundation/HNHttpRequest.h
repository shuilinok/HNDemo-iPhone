//
//  HNHttpRequest.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/23/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HNCallback.h"
#import "NSError+HN.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNHttpRequest : NSObject

@property (strong, nonatomic) NSString *url;

@property (strong, nonatomic) NSString *method;//"POST,"GET"...

@property (strong, nonatomic) NSDictionary *headerDict;

@property (strong, nonatomic) NSDictionary *paramDict;

@property (strong, nonatomic) id response;

- (void)send:(HNResultCallback)callback;

@end

NS_ASSUME_NONNULL_END
