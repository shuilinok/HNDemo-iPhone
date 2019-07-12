//
//  EventPathHelper.m
//  Mic
//
//  Created by matelin on 2019/7/4.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import "EventPathHelper.h"

@implementation EventPathHelper

//获取控件路径
+ (NSString *)getResonderPath:(UIResponder *)responder {
    
    NSMutableString *path = [[NSMutableString alloc] init];
    
    UIResponder *current = responder;
    while (current) {
        
        //获取响应者的名称
        NSString *name = NSStringFromClass([current class]);
        if(name) {
            [path appendString:name];   //类名
            [path appendString:@"-"];
            NSUInteger index = [self getResonderDeep:current];
            [path appendFormat:@"%lu",index];   //深度
        }
        
        //搜索到window即可
        if(![current isKindOfClass:[UIWindow class]]) {
            [path appendString:@"<"];
        } else {
            break;
        }
        
        //上一层
        current = current.nextResponder;
    }
    
    return path;
}


//获取控件深度
+ (NSUInteger)getResonderDeep:(UIResponder *)responder {
    
    //继承自UIResponder的类有UIView, UIViewController, UIApplication, AppDelegate
    //这里只考虑前两个
    
    if([responder isKindOfClass:[UIView class]]) {
        
        UIView *view = (UIView *)responder;
        
        //找出同类控件
        NSMutableArray *sames = [[NSMutableArray alloc] init];
        NSArray *brothers = view.superview.subviews;
        for(id brother in brothers) {
            if([brother isMemberOfClass:[view class]]) {
                [sames addObject:brother];
            }
        }
        
        //获取在同类兄弟视图中的序号
        NSUInteger index = [sames indexOfObject:view];
        
        //没有父控件
        if(index == NSNotFound) {
            index = 0;
        }
        
        return index;
        
    } else if([responder isKindOfClass:[UIViewController class]]) {
        
        UIViewController *controller = (UIViewController *)responder;
        
        //找出同类控件
        NSMutableArray *sames = [[NSMutableArray alloc] init];
        NSArray *brothers = controller.parentViewController.childViewControllers;
        for(id brother in brothers) {
            if([brother isMemberOfClass:[controller class]]) {
                [sames addObject:brother];
            }
        }
        
        //获取在同类兄弟控制器中的序号
        NSUInteger index = [sames indexOfObject:controller];
        
        //没有父控件
        if(index == NSNotFound) {
            index = 0;
        }
        
        return index;
    }
    
    return 0;
}

@end
