//
//  SetController.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "SetController.h"

@interface SetController ()<SetViewDelegate>

@end

@implementation SetController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#EAEAEA"];
    [self initView];
}

-(void)initView{
    [self getSetView];
    self.setView.delegate = self;
    self.setView.frame = self.view.bounds;
    [self.view addSubview:self.setView];
}

-(SetView *)getSetView{
    if(self.setView==nil){
        self.setView=[[SetView alloc] init];
    }
    return self.setView;
}

- (void)customContentView{
    UIColor *commonBlue = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
}

- (void)customNavigationLeftItem{
    NSString *back = @"返回";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:back style:UIBarButtonItemStylePlain target:nil action:nil];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = item;
}


//代理
-(void)onLoginOutClick{
    //存储用户的数据
    [[CommonUserDefaults sharedManager] saveUserData:nil];
    UIViewController *target = nil;
    for (UIViewController * controller in self.navigationController.viewControllers) { //遍历
        if ([controller isKindOfClass:[MeController class]]) { //这里判断是否为你想要跳转的页面
            target = controller;
        }
    }
    if (target) {
        [self.navigationController popToViewController:target animated:YES]; //跳转
    }
}


@end
