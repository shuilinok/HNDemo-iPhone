//
//  EventPathHelper.h
//  Mic
//
//  Created by matelin on 2019/7/4.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import <UIKit/UIKit.h>

//工具类，操作事件路径

@interface EventPathHelper : NSObject

//获取控件路径
+ (NSString *)getResonderPath:(UIResponder *)responder;

//获取控件深度
+ (NSUInteger)getResonderDeep:(UIResponder *)responder;

@end

