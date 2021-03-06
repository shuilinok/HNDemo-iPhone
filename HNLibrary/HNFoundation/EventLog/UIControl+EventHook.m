//
//  UIControl+MicEventHook.m
//
//
//  Created by matelin on 2019/7/5.
//  Copyright © 2019 . All rights reserved.
//

#import "UIControl+EventHook.h"
#import "EventPathHelper.h"
#import <objc/runtime.h>

@implementation UIControl (EventHook)


+ (void)load{

    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [self swizzleSelector:@selector(touchesEnded:withEvent:) toSelector:@selector(custom_touchesEnded:withEvent:) cls:[self class]];

    });
}

+ (void)swizzleSelector:(SEL)originSelector toSelector:(SEL)customSelector cls:(Class)cls {

    Method originMethod = class_getInstanceMethod(cls, originSelector);
    Method customMethod = class_getInstanceMethod(cls, customSelector);

    //如果本类没有实现originSelector，则生成一个originSelector并指向customMethod
    BOOL didAddMethod = class_addMethod(cls, originSelector, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));

    if (didAddMethod) {
        
        //customSelector指向originMethod
        class_replaceMethod(cls, customSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));

    } else {
        
        //直接交换
        method_exchangeImplementations(originMethod, customMethod);
    }
}


- (void)custom_touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {

    for(UITouch *touch in touches) {
        UIView *view = touch.view;

        //计算控件路径
        NSString *path = [EventPathHelper getResonderPath:view];

        //NSLog(@"位置：%@，类型：%ld，处理者：%@", path, (long)touch.phase, NSStringFromClass([self class]));
    }

    //调用原始的方法
    [self custom_touchesEnded:touches withEvent:event];
}

@end
