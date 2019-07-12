//
//  UIGestureRecognizer+EventHook.m
//  Mic
//
//  Created by matelin on 2019/7/5.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import "UIGestureRecognizer+EventHook.h"

@implementation UIGestureRecognizer (MicEventHook)

- (void)custom_touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    
    //NSLog(@"容错处理");
    [self touchesEnded:touches withEvent:event];
}

@end
