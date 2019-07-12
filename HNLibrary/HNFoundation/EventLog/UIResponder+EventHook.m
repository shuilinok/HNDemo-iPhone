//
//  UIResponder+EventHook.m
//
//  Created by matelin on 2019/7/4.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import "UIResponder+EventHook.h"

@implementation UIResponder (EventHook)

- (void)custom_touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    
    //NSLog(@"容错处理");
    [self touchesEnded:touches withEvent:event];
}

@end
