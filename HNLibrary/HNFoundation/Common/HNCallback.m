//
//  HNCallback.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/24/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNCallback.h"


void mainCallback(HNCallback callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback();
        }
    });
}

void mainResultCallback(HNResultCallback callback, NSError *error)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback(error);
        }
    });
}

void mainDataResultCallback(HNDataResultCallback callback, id data, NSError *error)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback(data,error);
        }
    });
}
