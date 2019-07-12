//
//  UISwitch+EventHook.h
//
//  Created by matelin on 2019/7/5.
//  Copyright © 2019 闪电降价. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//截获开关控件的事件，这个用touchesEnded:withEvent:截获不行
@interface UISwitch (EventHook)

@end

NS_ASSUME_NONNULL_END
