//
//  BaseViewController.m
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _commonUtil = [[CommonUtil alloc] init];
    
    [self customContentView];
    [self customNavigationLeftItem];
    [self customNavigationRightItem];
}

- (void)customContentView{
    UIColor *commonBlue = [self.commonUtil stringToColor:@"#03a9f4"];
    //[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    //[self.navigationController.navigationBar setBarTintColor:commonBlue];
    
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           };
    } else {
    #if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        textAttributes = @{
                           UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor : [UIColor whiteColor],
                           UITextAttributeTextShadowColor : [UIColor clearColor],
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
                           };
        #endif
    }
    [navigationBarAppearance setBarTintColor:commonBlue];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
}

- (void)customNavigationLeftItem{
    NSString *back = @"返回";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:back style:UIBarButtonItemStylePlain target:nil action:nil];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = item;
}

-(void)customNavigationRightItem{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
    



@end
