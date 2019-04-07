//
//  HNCallback.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/24/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

typedef void (^HNCallback) (void);

typedef void (^HNResultCallback) (NSError* error);

typedef void (^HNDataResultCallback) (id data,NSError* error);

void mainCallback(HNCallback callback);

void mainResultCallback(HNResultCallback callback, NSError *error);

void mainDataResultCallback(HNDataResultCallback callback, id data, NSError *error);

//NS_ASSUME_NONNULL_END
