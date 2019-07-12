//
//  EventLogManager.m
//  Mic
//
//  Created by matelin on 2019/7/4.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import "EventLogManager.h"

@interface EventLogManager ()

@end

@implementation EventLogManager

+ (instancetype)sharedInstance {
    static EventLogManager *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[EventLogManager alloc] init];
        
    });
    
    return object;
}

//开始监视事件并上报
- (void)start
{
    // 需要验证的字符串
    NSString *mobilePhone = @"UIView-0<UIView-0<MicNewHomeHorizonCell-6<UICollectionView-0<UIView-0<MicNewHomeViewController-0<UIScrollView-0<JXCategoryListContainerView-0<UIView-0<MicRootViewController-0<UIViewControllerWrapperView-0<UINavigationTransitionView-0<UILayoutContainerView-0<SwipeNavigationController-0<UIViewControllerWrapperView-0<UITransitionView-0<UILayoutContainerView-0<BaseTabBarController-0<UIWindow-0";
    // 编写正则表达式，验证mobilePhone是否为手机号码
    NSString *regex = @".*MicNewHomeHorizonCell-.+<UICollectionView-0<UIView-0<MicNewHomeViewController-0<UIScrollView-0<JXCategoryListContainerView-0<UIView-0<MicRootViewController-0<UIViewControllerWrapperView-0<UINavigationTransitionView-0<UILayoutContainerView-0<SwipeNavigationController-0<UIViewControllerWrapperView-0<UITransitionView-0<UILayoutContainerView-0<BaseTabBarController-0<UIWindow-0";
    // 创建谓词对象并设定条件表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    // 字符串判断，然后BOOL值
    BOOL result = [predicate evaluateWithObject:mobilePhone];
    NSLog(@"result : %@",result ? @"匹配" : @"不匹配");
    
    Class cls = NSClassFromString(@"MicUserInfo");
    NSString *userId = [cls valueForKeyPath:@"shareInstance.userId"];
}

@end
