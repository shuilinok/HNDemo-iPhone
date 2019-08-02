//
//  UIImage+HN.m
//  HNDemo-iPhone
//
//  Created by matelin on 2019/8/1.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "UIImage+HN.h"
#import <objc/runtime.h>
#import <SDWebImageWebPCoder/SDWebImageWebPCoder.h>

@implementation UIImage (HN)

//hook
+ (void)hn_beginHook {
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleSelector:@selector(imageNamed:) toSelector:@selector(hn_UIImage_imageNamed:) cls:object_getClass([self class])];
        
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


+ (UIImage *)hn_UIImage_imageNamed:(NSString *)name {
    
    name = [name stringByDeletingPathExtension];
    if(name.length == 0) {
        return nil;
    }
    
    SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
    SDImageAPNGCoder *pngCoder = [SDImageAPNGCoder sharedCoder];
    @autoreleasepool {
        NSString *url = [[NSBundle mainBundle] pathForResource:name ofType:@"webp"];
        NSData *data = [NSData dataWithContentsOfFile:url];
        UIImage *image = [webPCoder decodedImageWithData:data options:nil];
//        
//        data = [pngCoder encodedDataWithImage:image format:SDImageFormatPNG options:nil];
//        image = [UIImage imageWithData:data];
        
//        CGFloat fixelW = CGImageGetWidth(image.CGImage);
//
//        CGFloat fixelH = CGImageGetHeight(image.CGImage);
//
//        NSLog(@"w : %lf * h : %lf",fixelW,fixelH);
        
        return image;
    }
}

@end
