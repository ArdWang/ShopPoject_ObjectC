//
//  LoginView.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "LoginView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation LoginView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

//添加布局
-(void)initView{
    _commonUtil = [[CommonUtil alloc] init];
    UIView *mainView = [[UIView alloc] init];
    mainView.layer.cornerRadius = 8;
    mainView.layer.borderWidth = 1;
    mainView.layer.masksToBounds = YES;
    mainView.layer.borderColor = [[UIColor colorWithWhite:0.5 alpha:0.8] CGColor];
    [self addSubview:mainView];
    
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(94);
        make.height.equalTo(@102);
    }];
    
    
    UIView *phoneView = [[UIView alloc] init];
    [mainView addSubview:phoneView];
    
    [phoneView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(mainView).offset(0);
        make.height.equalTo(@50);
    }];
    
    UIImageView *phoneImg = [[UIImageView alloc] init];
    phoneImg.image = [UIImage imageNamed:@"user"];
    [phoneView addSubview:phoneImg];
    
    [phoneImg makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(phoneView).offset(10);
        make.centerY.equalTo(phoneView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    self.mPhoneTF = [[UITextField alloc] init];
    self.mPhoneTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.mPhoneTF.borderStyle = UITextBorderStyleNone;
    self.mPhoneTF.placeholder = @"请输入你的手机号码";
    [phoneView addSubview:self.mPhoneTF];
    
    [self.mPhoneTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(phoneImg).offset(40);
        make.centerY.equalTo(phoneView);
        make.right.equalTo(phoneView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    [mainView addSubview:lineView];
    
    [lineView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(phoneView).offset(51);
        make.height.equalTo(@1);
    }];
    
    UIView *pwdView = [[UIView alloc] init];
    [mainView addSubview:pwdView];
    
    [pwdView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(mainView).offset(52);
        make.height.equalTo(@50);
    }];
    
    UIImageView *pwdImg = [[UIImageView alloc] init];
    pwdImg.image = [UIImage imageNamed:@"pwd"];
    [pwdView addSubview:pwdImg];
    
    [pwdImg makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(pwdView).offset(10);
        make.centerY.equalTo(pwdView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    self.mPwdTF = [[UITextField alloc] init];
    self.mPwdTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.mPwdTF.borderStyle = UITextBorderStyleNone;
    self.mPwdTF.secureTextEntry = YES;
    self.mPwdTF.placeholder = @"请输入你的密码";
    [pwdView addSubview:self.mPwdTF];
    
    [self.mPwdTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(pwdImg).offset(40);
        make.centerY.equalTo(pwdView);
        make.right.equalTo(pwdView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIButton *mLoginBt = [[UIButton alloc] init];
    mLoginBt.backgroundColor = [_commonUtil stringToColor:@"#03a9f4"];
    mLoginBt.layer.cornerRadius = 10;
    [mLoginBt setTitle:@"登录" forState:UIControlStateNormal];
    [self addSubview:mLoginBt];
    
    [mLoginBt makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(mainView).offset(130);
        make.height.equalTo(@50);
    }];
    
    [mLoginBt addTarget:self action:@selector(onLoginClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *mForgetBt = [[UIButton alloc] init];
    mForgetBt.backgroundColor = [UIColor whiteColor];
    [mForgetBt setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [mForgetBt setTitleColor:[_commonUtil stringToColor:@"#555555"] forState:UIControlStateNormal];
    [self addSubview:mForgetBt];
    
    [mForgetBt makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(mLoginBt).offset(60);
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(100);
        make.height.equalTo(@50);
    }];
    
    [mForgetBt addTarget:self action:@selector(onForgetClick) forControlEvents:UIControlEventTouchUpInside];
    
}

//登录
-(void)onLoginClick{
    if(self.delegate){
        [self.delegate onLoginClick];
    }
}

//忘记密码
-(void)onForgetClick{
    if(self.delegate){
        [self.delegate onForgetClick];
    }
}

@end

/*
 -(LoginView *)loginViewd{
 if(self.loginView==nil){
 self.loginView=[[LoginView alloc] init];
 }
 return self.loginView;
 }
 
 */
