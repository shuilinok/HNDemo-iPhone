//
//  UIImageView+HN.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/31/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "UIImageView+HN.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (HN)

- (void)setImageWithUrl:(NSString *)url
{
    NSURL *URL = [NSURL URLWithString:url];
    [self sd_setImageWithURL:URL placeholderImage:nil];
}

@end
