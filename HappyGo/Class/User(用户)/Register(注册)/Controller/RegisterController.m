//
//  RegisterController.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()<RegisterViewDelegate,RegisterModelDelegate>

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

-(void)initView{
    [self registerViewd];
    [self registerModeld];
    self.registerView.frame = self.view.bounds;
    [self.view addSubview:self.registerView];
    self.registerView.delegate = self;
    self.registerModel.delegate = self;
    
}

-(RegisterView*)registerViewd{
    if(self.registerView==nil){
        self.registerView = [[RegisterView alloc] init];
    }
    return self.registerView;
}

-(RegisterModel*)registerModeld{
    if(self.registerModel==nil){
        self.registerModel = [[RegisterModel alloc] init];
    }
    return self.registerModel;
}

//代理
-(void)onSmsClick{
    //此处可以先调接口，成功后再调此方法
    [[SmsButton sharedSmsBHandle] startTimer];
}

-(void)onRegisterClick{
    if([self isNUllEmpty:self.registerView.mPhoneTF]&&[self isNUllEmpty:self.registerView.mSmsTF]&&[self isNUllEmpty:self.registerView.mPwdTF]&&[self isNUllEmpty:self.registerView.mConfirmTF]){
        if([self.registerView.mPwdTF.text isEqualToString:self.registerView.mConfirmTF.text]){
            self.progress = [[MHProgress alloc]
                             initWithType:MHPopViewTypeWrapContentWithTips
                             failedBlock:^(){
                                  [self.registerModel regUser:self.registerView.mPhoneTF.text passWord:self.registerView.mSmsTF.text verifyCode:self.registerView.mPwdTF.text];
                             }];
            [self.progress showLoadingView];
        }else{
            self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
            [self.progress showTips:@"两次输入的密码不一致" intInterval:2];
        }
       
    }
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

- (void)regUserSuccess:(NSString*) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
    
    UIViewController *target = nil;
    for (UIViewController * controller in self.navigationController.viewControllers) { //遍历
        if ([controller isKindOfClass:[LoginController class]]) { //这里判断是否为你想要跳转的页面
            target = controller;
        }
    }
    if (target) {
        [self.navigationController popToViewController:target animated:YES]; //跳转
    }
}

-(void)regUserFail:(NSString *) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
}


@end
