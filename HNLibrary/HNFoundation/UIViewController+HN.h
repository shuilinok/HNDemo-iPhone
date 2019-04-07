//
//  UIViewController+HN.h
//  HNDemo-iPhone
//
//  Created by shuilin on 4/6/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HN)

//展示alertview，传回点击的按钮序号
- (void)showAlert:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles completion:(void(^)(int buttonIndex))completion;

@end

NS_ASSUME_NONNULL_END
