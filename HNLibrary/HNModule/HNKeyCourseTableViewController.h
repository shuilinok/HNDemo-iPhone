//
//  HNKeyCourseTableViewController.h
//  HNDemo-iPhone
//
//  Created by shuilin on 3/23/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HNKeyCourseList.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNKeyCourseTableViewController : UITableViewController

@property (strong, nonatomic) HNKeyCourseList *list;

+ (instancetype)create;

@end

NS_ASSUME_NONNULL_END
