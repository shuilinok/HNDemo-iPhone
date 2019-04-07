//
//  UIView+HN.m
//  HNDemo-iPhone
//
//  Created by shuilin on 4/6/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "UIView+HN.h"
#import "MBProgressHUD.h"

@implementation UIView (HN)

- (void)showLoading:(BOOL)loading
{
    if(loading)
    {
        [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    else
    {
        [MBProgressHUD hideHUDForView:self animated:YES];
    }
}

@end
