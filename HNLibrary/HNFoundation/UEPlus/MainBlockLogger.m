//
//  MainBlockLogger.m
//  Mic
//
//  Created by matelin on 2019/7/9.
//  Copyright © 2019 . All rights reserved.
//

#import "MainBlockLogger.h"
#import <QuartzCore/CADisplayLink.h>
#include <signal.h>
#include <pthread.h>
#import <execinfo.h>
#import "LXDBacktraceLogger.h"


@interface MainBlockLogger () {
    dispatch_queue_t queue; //监视流畅度的线程
    dispatch_queue_t log_queue;//写日志线程
    dispatch_semaphore_t semaphore; //信号量等待时间
}

@property(strong, nonatomic) CADisplayLink *displayLink;
@property(assign, nonatomic) NSUInteger count;  //卡顿次数
@end

@implementation MainBlockLogger

+ (instancetype)sharedInstance {
    static MainBlockLogger *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[MainBlockLogger alloc] init];
    });
    
    return object;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        //串行队列
        queue = dispatch_queue_create("com.taojiji.TJFluencyLogManager", NULL);
        log_queue = dispatch_queue_create("com.taojiji.TJFluencyLogManager.log", NULL);
        
        //创建一个信号量，注意是0
        semaphore = dispatch_semaphore_create(0);
        
        self.count = 0;
    }
    
    return self;
}

- (void)start {
    
    dispatch_async(queue, ^{
        
        CADisplayLink * displayLink = [CADisplayLink displayLinkWithTarget: self selector: @selector(screenRenderCallback)];
        
        self.displayLink = displayLink;
        
        //添加到runloop
        [self.displayLink addToRunLoop: [NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
        
        //运行时间足够长
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, CGFLOAT_MAX, NO);
    });
}

//界面每刷新一帧，回调一次
- (void)screenRenderCallback {
    
    //定义一个变量测试界面是否卡顿
    __block BOOL busy = YES;
    dispatch_async(dispatch_get_main_queue(), ^{
        busy = NO;
    });
    
    //等待一小段时间，看上面主线程代码是否执行，没执行视为卡顿
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 30 * NSEC_PER_MSEC) );  //毫秒
    
    //视为卡顿
    if(busy) {
        
        NSString *text = [LXDBacktraceLogger lxd_backtraceOfMainThread];
        
        dispatch_async(log_queue, ^{
            
            self.count++;
            
            //写入日志
            NSLog(@"有点卡：%lu\n%@", (unsigned long)self.count, text);
        });
   
    } else {
        //NSLog(@"不卡");
    }
}

@end

