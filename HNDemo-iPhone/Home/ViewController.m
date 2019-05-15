//
//  ViewController.m
//  HNDemo-iPhone
//
//  Created by shuilin on 3/22/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#import "ViewController.h"
#import "HNKeyCourseListViewController.h"
#import "Person.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *keyField;

@end

@implementation ViewController

+ (instancetype)create
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [board instantiateViewControllerWithIdentifier:@"ViewController"];
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Class cls = [Person class];
    
    void *obj = &cls;
    
    [(__bridge id)obj print];
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
