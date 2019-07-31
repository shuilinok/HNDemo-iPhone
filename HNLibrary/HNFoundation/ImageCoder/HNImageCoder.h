//
//  HNImageCoder.h
//  HNDemo-iPhone
//
//  Created by matelin on 2019/7/30.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HNCallback.h"

NS_ASSUME_NONNULL_BEGIN

//图片编解码器
@interface HNImageCoder : NSObject

//编码目录下的所有图片为WebP,存储到指定目录,异步
- (void)encodeDir:(NSString *)srcDir toWebP:(NSString *)dstDir callback:(HNResultCallback)callback;

@end

NS_ASSUME_NONNULL_END
