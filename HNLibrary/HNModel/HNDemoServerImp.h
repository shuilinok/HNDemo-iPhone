//
//  HNDemoServerImp.h
//  HNDemo-iPhone
//
//  Created by shuilin on 5/15/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>


//服务端接口实现
@interface HNDemoServerImp : NSObject

+ (instancetype)sharedImp;

//根据关键字搜索课程
- (void)searchKeyCourses:(NSString *)key offset:(NSInteger)offset limit:(NSUInteger)limit callback:(HNDataResultCallback)callback;

@end

