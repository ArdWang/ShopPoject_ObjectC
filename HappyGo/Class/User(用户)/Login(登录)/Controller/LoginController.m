//
//  LoginController.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()<LoginViewDelegate,LoginModelDelegate>

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

-(void)initView{
    [self loginViewd];
    [self loginModeld];
    self.loginView.frame = self.view.bounds;
    [self.view addSubview:self.loginView];
    self.loginView.delegate = self;
    self.loginModel.delegate = self;
    
}

- (void)customContentView{
    UIColor *commonBlue = [self.commonUtil stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
}

- (void)customNavigationLeftItem{
    NSString *back = @"返回";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:back style:UIBarButtonItemStylePlain target:nil action:nil];
    item.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = item;
}

-(LoginView *)loginViewd{
    if(self.loginView==nil){
        self.loginView=[[LoginView alloc] init];
    }
    return self.loginView;
}

-(LoginModel*)loginModeld{
    if(self.loginModel==nil){
        self.loginModel = [[LoginModel alloc] init];
    }
    return self.loginModel;
}

//重写右边的按钮
-(void)customNavigationRightItem{
    UIBarButtonItem *resigter = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(regOnClick)];
    resigter.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = resigter;
}

//注册界面按钮
-(void)regOnClick{
    RegisterController *regist = [[RegisterController alloc] init];
    NSString *registtitle = @"注册";
    regist.title = registtitle;
    [self.navigationController pushViewController:regist animated:YES];
}

//代理执行模块
-(void)onLoginClick{
    if([self isNUllEmpty:self.loginView.mPhoneTF]&&[self isNUllEmpty:self.loginView.mPwdTF]){
        self.progress = [[MHProgress alloc]
                     initWithType:MHPopViewTypeWrapContentWithTips
                     failedBlock:^(){
                         [self.loginModel getUser:self.loginView.mPhoneTF.text getPwd:self.loginView.mPwdTF.text];
                     }];
        [self.progress showLoadingView];
    }
}

//忘记密码界面按钮
-(void)onForgetClick{
    ForgetPwdController *forget = [[ForgetPwdController alloc] init];
    forget.title = @"找回密码";
    [self.navigationController pushViewController:forget animated:YES];
}

//model数据返回的结果处理
- (void)getUserSuccess:(UserData *) data{
    [self.progress closeLoadingView];
    //存储用户的数据
    [[CommonUserDefaults sharedManager] saveUserData:data];
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

//model失败的数据返回
-(void)getUserFail:(NSString *) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
}

//提示用户输入不能为空
-(Boolean)isNUllEmpty:(UITextField *) textField{
    if(textField.text.length==0){
        self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
        [self.progress showTips:@"请仔细检查输入不能为空" intInterval:2];
        return false;
    }
    return true;
}


@end
