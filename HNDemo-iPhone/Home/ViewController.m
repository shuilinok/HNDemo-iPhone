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
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImageWebPCoder/SDWebImageWebPCoder.h>
#import <SDWebImage/SDImageCoderHelper.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *keyField;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (assign, nonatomic) NSUInteger count;

@property (weak, nonatomic) IBOutlet UIButton *button;

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
    self.count = 0;
    
    SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
    [[SDImageCodersManager sharedManager] addCoder:webPCoder];
    
    UIImage *image = [UIImage imageNamed:@"abc"];
    //NSString *url = [[NSBundle mainBundle] pathForResource:@"bird@2x" ofType:@"png"];
    //NSData *data = [NSData dataWithContentsOfFile:url];
    //UIImage *image = [UIImage imageWithContentsOfFile:url];
    NSLog(@"scale : %f screen : %f",image.scale,[UIScreen mainScreen].scale);
    
    self.imageView.image = image;
    
   
    
    
    //PNG
//    NSString *dstPath = [[[HNFileManager sharedInstance] documentPath] stringByAppendingPathComponent:@"/local_images/Images.xcassets"];
//
//    NSArray *paths = [[HNFileManager sharedInstance] allFilePath:dstPath];
//
//    if(paths) {
//        NSMutableArray *objects = [[NSMutableArray alloc] initWithArray:[[paths reverseObjectEnumerator] allObjects]];
//        [self showPngImages:objects callback:^{
//            NSLog(@"完成 : %ld",self.count);
//        }];
//    }
    
    //WebP
//    NSString *dstPath = [[[HNFileManager sharedInstance] documentPath] stringByAppendingPathComponent:@"/local_images/Webp"];
//    NSArray *paths = [[HNFileManager sharedInstance] allFilePath:dstPath];
//
//    if(paths) {
//        NSMutableArray *objects = [[NSMutableArray alloc] initWithArray:[[paths reverseObjectEnumerator] allObjects]];
//        [self showWebpImages:objects callback:^{
//            NSLog(@"完成 : %ld",self.count);
//        }];
//    }
    
    
    //WebP缩放
//    NSString *dstPath = [[[HNFileManager sharedInstance] documentPath] stringByAppendingPathComponent:@"/local_images/Webp"];
//    NSArray *paths = [[HNFileManager sharedInstance] allFilePath:dstPath];
//
//    if(paths) {
//        NSMutableArray *objects = [[NSMutableArray alloc] initWithArray:[[paths reverseObjectEnumerator] allObjects]];
//        [self showScaleWebpImages:objects callback:^{
//            NSLog(@"完成 : %ld",self.count);
//        }];
//    }
}

/*
 name = @"my_2unpaid_icon@3x";
 //UIImage *image = [self tj_UIImage_imageNamed:name];
 
 
 
 float   fixelW = CGImageGetWidth(image.CGImage);
 float   fixelH = CGImageGetHeight(image.CGImage);
 
 NSLog(@"w : %lf * h : %lf",fixelW,fixelH);
 
 return image;
 */

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testReg {
    
    // 需要验证的字符串
    NSString *mobilePhone = @"UIView-0<UIView-0<MicNewHomeHorizonCell-6<UICollectionView-0<UIView-0<MicNewHomeViewController-0<UIScrollView-0<JXCategoryListContainerView-0<UIView-0<MicRootViewController-0<UIViewControllerWrapperView-0<UINavigationTransitionView-0<UILayoutContainerView-0<SwipeNavigationController-0<UIViewControllerWrapperView-0<UITransitionView-0<UILayoutContainerView-0<BaseTabBarController-0<UIWindow-0";
    // 编写正则表达式，验证mobilePhone是否为手机号码
    NSString *regex = @".*MicNewHomeHorizonCell-.+<UICollectionView-0<UIView-0<MicNewHomeViewController-0<UIScrollView-0<JXCategoryListContainerView-0<UIView-0<MicRootViewController-0<UIViewControllerWrapperView-0<UINavigationTransitionView-0<UILayoutContainerView-0<SwipeNavigationController-0<UIViewControllerWrapperView-0<UITransitionView-0<UILayoutContainerView-0<BaseTabBarController-0<UIWindow-0";
    // 创建谓词对象并设定条件表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    // 字符串判断，然后BOOL值
    BOOL result = [predicate evaluateWithObject:mobilePhone];
    NSLog(@"result : %@",result ? @"匹配" : @"不匹配");
    
    Class cls = NSClassFromString(@"MicUserInfo");
    NSString *userId = [cls valueForKeyPath:@"shareInstance.userId"];
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
                                
                                [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
                                
                                UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                                UIGraphicsEndImageContext();
                                
   return scaledImage;
                                
}


- (void)showPngImages:(NSMutableArray *)paths callback:(HNCallback)callback {
    
    NSString *path = [paths lastObject];
    
    if(path) {
        
        if([path containsString:@"@3x"]) {
            
            NSData *data = [NSData dataWithContentsOfFile:path];
            UIImage *image = [UIImage imageWithData:data];
            self.imageView.image = image;
            self.count++;
            //下一个
            [paths removeObject:path];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
                [self showPngImages:paths callback:^{
                    callback();
                }];
            });
        } else {    //跳过
            
            [paths removeObject:path];
            [self showPngImages:paths callback:^{
                callback();
            }];
        }
        
    } else {
        callback();
    }
    
}

- (void)showWebpImages:(NSMutableArray *)paths callback:(HNCallback)callback {
    
    NSString *path = [paths lastObject];
    
    if(path) {
        SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
        //解码
        NSData *data = [NSData dataWithContentsOfFile:path];
        UIImage *image = [webPCoder decodedImageWithData:data options:nil];
        self.imageView.image = image;
        self.count++;
        //下一个
        [paths removeObject:path];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            [self showWebpImages:paths callback:^{
                callback();
            }];
        });
        
        
    } else {
        callback();
    }
    
}

- (void)showScaleWebpImages:(NSMutableArray *)paths callback:(HNCallback)callback {
    
    NSString *path = [paths lastObject];
    
    if(path) {
        SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
        //解码
        NSData *data = [NSData dataWithContentsOfFile:path];
        UIImage *image = [webPCoder decodedImageWithData:data options:nil];
        
//        CGFloat fixelW = CGImageGetWidth(image.CGImage);
//
//        CGFloat fixelH = CGImageGetHeight(image.CGImage);
//
//        NSLog(@"w : %lf * h : %lf",fixelW,fixelH);
        
        //缩放
        image = [self scaleImage:image toScale:0.6667];
    
//             fixelW = CGImageGetWidth(image.CGImage);
//
//             fixelH = CGImageGetHeight(image.CGImage);
//
//            NSLog(@"w : %lf * h : %lf",fixelW,fixelH);
        
        self.imageView.image = image;
        self.count++;
        //下一个
        [paths removeObject:path];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            [self showScaleWebpImages:paths callback:^{
                callback();
            }];
        });
        
        
    } else {
        callback();
    }
    
}



- (IBAction)searchClicked:(id)sender
{
    NSString *documentPath = [[HNFileManager sharedInstance] documentPath];
    NSLog(@"document path : %@",documentPath);
    
    UIImage *image = [UIImage imageNamed:@"test1"];
    
    [self.button setBackgroundImage:image forState:UIControlStateNormal];
    
    self.imageView.image = image;
    
//    HNImageCoder *fileEncoder = [[HNImageCoder alloc] init];
//    NSString *srcPath = [[[HNFileManager sharedInstance] documentPath] stringByAppendingPathComponent:@"/local_images/Images.xcassets"];
//    NSString *dstPath = [[[HNFileManager sharedInstance] documentPath] stringByAppendingPathComponent:@"/local_images/Webp"];
//    [fileEncoder encodeDir:srcPath toWebP:dstPath callback:^(NSError *error) {
//
//    }];
    

    
    
    
//    CFAbsoluteTime time1 = CFAbsoluteTimeGetCurrent();
//
//    SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
//    NSString *url = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"webp"];
//    NSData *data = [NSData dataWithContentsOfFile:url];
//    //UIImage *image = [UIImage imageWithData:data];
//
//
//    //SDWebImageContext *context = @{SDWebImageContextImageScaleFactor:@(0.3)};
//    //SDImageCoderOptions *options = @{SDImageCoderDecodeScaleFactor : @(0.2)};
//
//    //解码
//    UIImage *image = [webPCoder decodedImageWithData:data options:nil];
//
//    //缩放
//    image = [self scaleImage:image toScale:0.3];
//
//    self.imageView.image = image;
//
//        CGFloat fixelW = CGImageGetWidth(image.CGImage);
//
//        CGFloat fixelH = CGImageGetHeight(image.CGImage);
//
//        NSLog(@"w : %lf * h : %lf",fixelW,fixelH);
//
//    return;
//
    /* //编码
    SDImageWebPCoder *webPCoder = [SDImageWebPCoder sharedCoder];
    SDImageCoderOptions *options = @{SDImageCoderEncodeCompressionQuality : @(0.3)
                                     };

    NSString *url = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:url];
    UIImage *image = [UIImage imageWithData:data];
    NSData *webpData = [webPCoder encodedDataWithImage:image format:SDImageFormatWebP options:options];

    NSString *directory = NSHomeDirectory();
    //directory = [directory stringByAppendingString:@"/"];
    NSString *filePath = [directory stringByAppendingPathComponent:@"/i_mages/webp/test1.webp"];
    //NSURL *url = [NSURL URLWithString:filePath];
    NSString *dirPath = [filePath stringByDeletingLastPathComponent];
    [[HNFileManager sharedInstance] generateDirectory:dirPath];
    [webpData writeToFile:filePath atomically:YES];

    NSLog(@"file path : %@", filePath);
*/
//    //验证尺寸
//    options = nil;//@{SDImageCoderDecodeScaleFactor : @(0.2)};
//
//    UIImage *webpImage = [webPCoder decodedImageWithData:data options:options];
//    CGFloat fixelW = CGImageGetWidth(webpImage.CGImage);
//
//    CGFloat fixelH = CGImageGetHeight(webpImage.CGImage);
//
//    NSLog(@"w : %lf * h : %lf",fixelW,fixelH);
//
//    UIImage *image = [UIImage imageNamed:@"test1.png"];
//    self.imageView.image = image;
//
//    CFAbsoluteTime time2 = CFAbsoluteTimeGetCurrent();
//    CFAbsoluteTime interval = time2 - time1;
//    NSLog(@"本地 webp 图片加载时间 : %lf", interval);
  
    

//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://img-g.taojiji.com/gl/public/201907/a8/cd/aa/5e/a8cdaa5ed51dcf6823ef388c1cd7442c.jpg?x-oss-process=image/format,webp"]];
//
    return;
    
    
    static int i = 11;   //0 2,   3 5,  6 8,  9 11
    
    NSString *host = @"http://localhost";
    
    //200 * 200
    if(i == 0) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/cat.jpg",host]]];
    }
    if(i == 1) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/cat.png",host]]];
    }
    if(i == 2) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/cat.webp",host]]];
    }
    
    //500 * 313
    if(i == 3) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/horse.jpg",host]]];
    }
    if(i == 4) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/horse.png",host]]];
    }
    if(i == 5) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/horse.webp",host]]];
    }
    
    //1080 * 683
    if(i == 6) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/panda.jpg",host]]];
    }
    if(i == 7) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/panda.png",host]]];
    }
    if(i == 8) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/panda.webp",host]]];
    }
    
    //2034 * 1526
    if(i == 9) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/dolphin.jpg",host]]];
    }
    if(i == 10) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/dolphin.png",host]]];
    }
    if(i == 11) {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/buyer@3x.webp",host]]];
    }
    
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
