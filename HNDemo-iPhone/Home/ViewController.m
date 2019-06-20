//
//  ViewController.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/22/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "ViewController.h"
#import "HNKeyCourseListViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *keyField;

@end

@implementation ViewController
/*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        //原有方法
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        //替换原有方法的新方法
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        //先尝试給源SEL添加IMP，这里是为了避免源SEL没有实现IMP的情况（这种情况是原方法继承自父类，而本身并没有实现）
        BOOL didAddMethod = class_addMethod(class,originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {//添加成功：说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP
            class_replaceMethod(class,swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {//添加失败：说明源SEL已经有IMP，直接将两个SEL的IMP交换即可
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
*/

+ (instancetype)create
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [board instantiateViewControllerWithIdentifier:@"ViewController"];
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchClicked:(id)sender
{
    NSString *key = self.keyField.text;
    if(key.length == 0)
    {
        return;
    }

    [self searchKey:key];
}

- (void)searchKey:(NSString *)key
{
    HNKeyCourseList *list = [[HNKeyCourseList alloc] init];
    list.key = key;
    list.offset = 0;
    list.limit = 8;
    
    [self.view showLoading:YES];
    [list load:^(NSError *error) {
       
        [self.view showLoading:NO];
        
        if(error.code == 0)
        {
            HNKeyCourseListViewController *vc = [HNKeyCourseListViewController create];
            vc.list = list;
            
            [self.navigationController pushViewController:vc animated:YES];
        }
        else
        {
            [self showAlert:@"错误提示" message:error.msg buttonTitles:@[@"确定"] completion:^(int buttonIndex) {
                
            }];
        }
    }];
}

@end
