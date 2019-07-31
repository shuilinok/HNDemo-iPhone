//
//  HNImageCoder.m
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/30.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNImageCoder.h"
#import "HNFileManager.h"
//#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImageWebPCoder/SDWebImageWebPCoder.h>

@interface HNImageCoder () {
    dispatch_queue_t queue;
}

@end

@implementation HNImageCoder


- (instancetype)init {
    self = [super init];
    if(self) {
        //串行队列
        queue = dispatch_queue_create("com.taojiji.HNImageCoder", NULL);
        
    }
    
    return self;
}


//编码目录下的所有图片为WebP,存储到指定目录,异步
- (void)encodeDir:(NSString *)srcDir toWebP:(NSString *)dstDir callback:(HNResultCallback)callback {
    
    dispatch_async(queue, ^{
        
        if(srcDir.length == 0 || dstDir.length == 0) {
            callback(nil);
        }
        
        SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
        
        //相对路径
        NSArray *paths = [[HNFileManager sharedInstance] allFileRelativePath:srcDir];
        NSUInteger count = 0;
        for(NSString *path in paths) {
            @autoreleasepool {
                
                //根据后缀名判断文件格式是否为图片
                NSString *extenstion = [path pathExtension];
                NSString *name = [path lastPathComponent];
                BOOL allow = extenstion && ([extenstion compare:@"png" options:NSCaseInsensitiveSearch] == NSOrderedSame || [extenstion compare:@"jpg" options:NSCaseInsensitiveSearch] == NSOrderedSame) && [name containsString:@"@3x"];
                if(!allow) {
                    continue;
                }
                
                NSString *srcPath = [srcDir stringByAppendingPathComponent:path];
 
                NSData *data = [NSData dataWithContentsOfFile:srcPath];
                if(data) {
                    UIImage *image = [UIImage imageWithData:data];
                    if(image) {
                        NSData *webpData = [webPCoder encodedDataWithImage:image format:SDImageFormatWebP options:nil];
                        
                        //生成目标路径
                        NSString *dstPath = [dstDir stringByAppendingPathComponent:path];
                        dstPath = [dstPath stringByDeletingPathExtension];
                        dstPath = [dstPath stringByAppendingPathExtension:@"webp"];
                        NSString *dstDirectory = [dstPath stringByDeletingLastPathComponent];
                        
                        //先建立目录
                        [[HNFileManager sharedInstance] generateDirectory:dstDirectory];
                        
                        //保存
                        [webpData writeToFile:dstPath atomically:YES];
                        count++;
                        NSLog(@"写入 %ld 个文件", count);
                    }
                }
            }
            
        }
        
        NSLog(@"目标目录:%@" , dstDir);
        
        callback(nil);
    });
    
}


@end
