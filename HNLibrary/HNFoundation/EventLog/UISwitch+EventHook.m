//
//  UISwitch+EventHook.m
//
//  Created by matelin on 2019/7/5.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import "UISwitch+EventHook.h"
#import "EventPathHelper.h"
#import <objc/runtime.h>

@implementation UISwitch (EventHook)

+ (void)load{
    
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleSelector:@selector(sendAction:to:forEvent:) toSelector:@selector(custom_sendAction:to:forEvent:) cls:[self class]];
        
    });
}

+ (void)swizzleSelector:(SEL)originSelector toSelector:(SEL)customSelector cls:(Class)cls {
    
    Method originMethod = class_getInstanceMethod(cls, originSelector);
    Method customMethod = class_getInstanceMethod(cls, customSelector);
    
    BOOL didAddMethod = class_addMethod(cls, originSelector, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls, customSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
        
    } else {
        method_exchangeImplementations(originMethod, customMethod);
    }
}

- (void)custom_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    //计算控件路径
    NSString *path = [EventPathHelper getResonderPath:self];
    
    NSLog(@"位置：%@，类型：%ld，处理者：%@", path, (long)3, NSStringFromClass([self class]));
    
    //调用原始的方法
    [self custom_sendAction:action to:target forEvent:event];
}

@end
