//
//  HNFileManager.m
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/30.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNFileManager.h"

@implementation HNFileManager

+ (instancetype)sharedInstance {
    static HNFileManager *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[HNFileManager alloc] init];
        
    });
    
    return object;
}

//确保目标目录存在
- (NSError *)generateDirectory:(NSString *)path {
    
    if(path == nil) {
        return [NSError errorWithCode:1 msg:@"参数为空"];
    }
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    BOOL isDir;
    BOOL exists = [fileMgr fileExistsAtPath:path isDirectory:&isDir];
    
    //创建本地存放目录
    if (!exists || !isDir) {
        NSError *error = nil;
        [fileMgr createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        return error;
    }
    
    return [NSError errorWithCode:noErr msg:@"目录已经存在"];
}

//遍历目录下的所有文件(递归子目录)
- (NSArray *)allFilePath:(NSString *)directory {
    
    NSMutableArray *paths = [[NSMutableArray alloc] init];
    if(directory == nil) {
        return paths;
    }
    
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    
    //NSError* error = nil;
    NSArray* items = [fileMgr subpathsAtPath:directory];//返回的是相对路径,包括子目录,递归
    for(NSString *item in items) {
        //改成绝对路径
        NSString *path = [directory stringByAppendingPathComponent:item];
      
        BOOL isDir;
        [fileMgr fileExistsAtPath:path isDirectory:&isDir];
        if(!isDir) {    //只取文件路径
            [paths addObject:path];//绝对路径
        } else {    //子目录

        }
        
    }
    
    return paths;
}

//遍历目录下的所有文件(递归子文件夹),返回相对路径
- (NSArray *)allFileRelativePath:(NSString *)directory {
    
    NSMutableArray *paths = [[NSMutableArray alloc] init];
    if(directory == nil) {
        return paths;
    }
    
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    
    //NSError* error = nil;
    NSArray* items = [fileMgr subpathsAtPath:directory];//返回的是相对路径,包括子目录,递归
    for(NSString *item in items) {
        //绝对路径
        NSString *path = [directory stringByAppendingPathComponent:item];
        
        BOOL isDir;
        [fileMgr fileExistsAtPath:path isDirectory:&isDir];
        if(!isDir) {    //只取文件路径
            [paths addObject:item];//相对路径
        } else {    //子目录
            
        }
        
    }
    
    return paths;
}

//获取沙箱Document路径
- (NSString *)documentPath {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docPath = [paths objectAtIndex:0];
    
    return docPath;
}
@end
