//
//  Person.h
//  HNDemo-iPhone
//
//  Created by shuilin on 4/11/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic, copy) NSString *name;

- (void)print;

@end

NS_ASSUME_NONNULL_END
