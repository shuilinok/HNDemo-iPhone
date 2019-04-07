//
//  HNKeyCourseTableViewController.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/23/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "HNKeyCourseTableViewController.h"
#import "HNKeyCourseCell.h"

@interface HNKeyCourseTableViewController ()

@end

@implementation HNKeyCourseTableViewController

+ (instancetype)create
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"HNKeyCourseListBD" bundle:nil];
    HNKeyCourseTableViewController *vc = [board instantiateViewControllerWithIdentifier:@"HNKeyCourseTableViewController"];
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.list.courses count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HNKeyCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HNKeyCourseCell" forIndexPath:indexPath];
    
    HNKeyCourse *course = [self.list.courses objectAtIndex:indexPath.row];
    cell.course = course;
    
    return cell;
}


@end
