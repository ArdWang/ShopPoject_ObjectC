//
//  ResetPwdController.m
//  HappyGo
//
//  Created by rnd on 2018/5/17.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ResetPwdController.h"

@interface ResetPwdController ()<ResetPwdViewDelegate,ResetPwdModelDelegate>

@end

@implementation ResetPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

-(void)initView{
    [self resetPwdViewd];
    [self resetPwdModeld];
    self.resetPwdView.frame = self.view.bounds;
    [self.view addSubview:self.resetPwdView];
    self.resetPwdView.delegate = self;
    self.resetPwdModel.delegate = self;
}

-(ResetPwdView*)resetPwdViewd{
    if(self.resetPwdView==nil){
        self.resetPwdView = [[ResetPwdView alloc] init];
    }
    return self.resetPwdView;
}

-(ResetPwdModel*)resetPwdModeld{
    if(self.resetPwdModel==nil){
        self.resetPwdModel = [[ResetPwdModel alloc] init];
    }
    return self.resetPwdModel;
}

//代理
-(void)onConfirmClick{
    if([self isNUllEmpty:self.resetPwdView.mPwdTF]&&[self isNUllEmpty:self.resetPwdView.mConfirmTF]){
            if([self.resetPwdView.mPwdTF.text isEqualToString:self.resetPwdView.mConfirmTF.text]){
            self.progress = [[MHProgress alloc]
                             initWithType:MHPopViewTypeWrapContentWithTips
                             failedBlock:^(){
                                 [self.resetPwdModel resetPwd:self.phone passWord:self.resetPwdView.mPwdTF.text];
                             }];
                [self.progress showLoadingView];
            }else{
                self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
                [self.progress showTips:@"输入的2次密码不一致" intInterval:2];
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

- (void)resetPwdSuccess:(NSString*) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
    
    //界面跳转
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

-(void)resetPwdFail:(NSString *) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
}

@end
