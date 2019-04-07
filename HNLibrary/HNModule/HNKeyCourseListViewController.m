//
//  HNKeyCourseListViewController.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/23/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyCourseListViewController.h"
#import "HNKeyCourseTableViewController.h"

@interface HNKeyCourseListViewController ()

@property (strong, nonatomic) HNKeyCourseTableViewController *tableViewController;

@end
 
@implementation HNKeyCourseListViewController

+ (instancetype)create
{
    HNKeyCourseListViewController *vc = [[HNKeyCourseListViewController alloc] init];
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HNKeyCourseTableViewController *vc = [HNKeyCourseTableViewController create];
    self.tableViewController = vc;
    vc.list = self.list;
    
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableViewController.view.frame = self.view.bounds;
}

@end
