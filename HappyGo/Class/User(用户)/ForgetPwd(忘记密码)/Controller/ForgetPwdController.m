//
//  ForgetPwdController.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ForgetPwdController.h"

@interface ForgetPwdController ()<ForgetPwdViewDelegate,ForgetPwdModelDelegate>

@end

@implementation ForgetPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

-(void)initView{
    [self forgetPwdViewd];
    [self forgetPwdModeld];
    self.forgetPwdView.frame = self.view.bounds;
    [self.view addSubview:self.forgetPwdView];
    self.forgetPwdView.delegate = self;
    self.forgetPwdModel.delegate = self;
}

-(ForgetPwdView*)forgetPwdViewd{
    if(self.forgetPwdView==nil){
        self.forgetPwdView = [[ForgetPwdView alloc] init];
    }
    return self.forgetPwdView;
}

-(ForgetPwdModel*)forgetPwdModeld{
    if(self.forgetPwdModel==nil){
        self.forgetPwdModel = [[ForgetPwdModel alloc] init];
    }
    return self.forgetPwdModel;
}

-(void)onSmsClick{
    //此处可以先调接口，成功后再调此方法
    [[SmsButton sharedSmsBHandle] startTimer];
}

//代理
-(void)onNextClick{
    if([self isNUllEmpty:self.forgetPwdView.mPhoneTF]&&[self isNUllEmpty:self.forgetPwdView.mSmsTF]){
        self.progress = [[MHProgress alloc]
                         initWithType:MHPopViewTypeWrapContentWithTips
                         failedBlock:^(){
                              [self.forgetPwdModel forgetPwd:self.forgetPwdView.mPhoneTF.text verifyCode:self.forgetPwdView.mSmsTF.text];
                         }];
        [self.progress showLoadingView];
       
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

//成功的时候
- (void)forgetPwdSuccess:(NSString*) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
    
    //进入下一个界面
    //并传递参数到下一个界面
    ResetPwdController *reset = [[ResetPwdController alloc] init];
    reset.title = @"重置密码";
    reset.phone = self.forgetPwdView.mPhoneTF.text;
    [self.navigationController pushViewController:reset animated:YES];
    
}

-(void)forgetPwdFail:(NSString *) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
}


@end
