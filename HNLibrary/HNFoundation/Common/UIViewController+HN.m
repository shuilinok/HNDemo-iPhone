//
//  UIViewController+HN.m
//  HNDemo-iPhone
//
//  Created by shuilin on 4/6/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "UIViewController+HN.h"

@implementation UIViewController (HN)

- (void)showAlert:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles completion:(void(^)(int buttonIndex))completion
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
}

@end
