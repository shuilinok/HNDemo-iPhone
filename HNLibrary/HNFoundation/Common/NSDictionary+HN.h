//
//  NSDictionary+HN.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/26/19.
//  Copyright © 2019 shuilin. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (HN)

- (NSString *)stringForKey:(NSString *)key;

- (NSNumber *)boolNumberForKey:(NSString *)key;

- (NSNumber *)intForKey:(NSString *)key;

- (NSNumber *)doubleForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
