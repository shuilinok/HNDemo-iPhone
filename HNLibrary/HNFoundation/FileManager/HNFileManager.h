//
//  HNFileManager.h
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/30.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HNFileManager : NSObject

+ (instancetype)sharedInstance;

//确保目标目录存在,若已经存在则返回错误码noErr
- (NSError *)generateDirectory:(NSString *)path;

//遍历目录下的所有文件(递归子文件夹),返回绝对路径
- (NSArray *)allFilePath:(NSString *)directory;

//遍历目录下的所有文件(递归子文件夹),返回相对路径
- (NSArray *)allFileRelativePath:(NSString *)directory;

//获取沙箱Document路径
- (NSString *)documentPath;

@end

NS_ASSUME_NONNULL_END
