//
//  RegisterView.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "RegisterView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation RegisterView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

-(void)initView{
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
        make.height.equalTo(@204);
    }];
    
    //获取验证码
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
        make.right.equalTo(phoneView).offset(-90);
        make.height.equalTo(@40);
    }];
    
    self.mSmsBtn = [[SmsButton sharedSmsBHandle] title:@"发送短信"];
    [phoneView addSubview:self.mSmsBtn];
    
    [self.mSmsBtn makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(phoneView).offset(-10);
        make.centerY.equalTo(phoneView);
        make.width.equalTo(@90);
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
    
    [self.mSmsBtn addTarget:self action:@selector(onSmsClick) forControlEvents:UIControlEventTouchUpInside];
    
    //验证码
    UIView *codeView = [[UIView alloc] init];
    [mainView addSubview:codeView];
    
    [codeView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(phoneView).offset(52);
        make.height.equalTo(@50);
    }];
    
    UIImageView *codeImg = [[UIImageView alloc] init];
    codeImg.image = [UIImage imageNamed:@"code"];
    [codeView addSubview:codeImg];
    
    [codeImg makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(codeView).offset(10);
        make.centerY.equalTo(codeView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    self.mSmsTF = [[UITextField alloc] init];
    self.mSmsTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.mSmsTF.borderStyle = UITextBorderStyleNone;
    self.mSmsTF.placeholder = @"请输入短信验证码";
    [codeView addSubview:self.mSmsTF];
    
    [self.mSmsTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(codeImg).offset(40);
        make.centerY.equalTo(codeView);
        make.right.equalTo(codeView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = [UIColor grayColor];
    [mainView addSubview:lineView1];
    
    [lineView1 makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(codeView).offset(51);
        make.height.equalTo(@1);
    }];
    
    //密码
    UIView *pwdView = [[UIView alloc] init];
    [mainView addSubview:pwdView];
    
    [pwdView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(codeView).offset(52);
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
    self.mPwdTF.placeholder = @"请输入密码（6-20位字母或数字）";
    [pwdView addSubview:self.mPwdTF];
    
    [self.mPwdTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(pwdImg).offset(40);
        make.centerY.equalTo(pwdView);
        make.right.equalTo(pwdView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor grayColor];
    [mainView addSubview:lineView2];
    
    [lineView2 makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(pwdView).offset(51);
        make.height.equalTo(@1);
    }];
    
    //确认密码
    UIView *confirmView = [[UIView alloc] init];
    [mainView addSubview:confirmView];
    
    [confirmView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(pwdView).offset(52);
        make.height.equalTo(@50);
    }];
    
    UIImageView *confirmImg = [[UIImageView alloc] init];
    confirmImg.image = [UIImage imageNamed:@"pwd"];
    [confirmView addSubview:confirmImg];
    
    [confirmImg makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(confirmView).offset(10);
        make.centerY.equalTo(confirmView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    self.mConfirmTF = [[UITextField alloc] init];
    self.mConfirmTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.mConfirmTF.borderStyle = UITextBorderStyleNone;
    self.mConfirmTF.secureTextEntry = YES;
    self.mConfirmTF.placeholder = @"请再次输入密码";
    [confirmView addSubview:self.mConfirmTF];
    
    [self.mConfirmTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(confirmImg).offset(40);
        make.centerY.equalTo(confirmView);
        make.right.equalTo(confirmView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIButton *mRegisterBt = [[UIButton alloc] init];
    UIColor *color = [[CommonUtil sharedManager]  stringToColor:@"#03a9f4"];
    mRegisterBt.backgroundColor = color;
    mRegisterBt.layer.cornerRadius = 10;
    [mRegisterBt setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:mRegisterBt];
    
    [mRegisterBt makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(mainView).offset(234);
        make.height.equalTo(@50);
    }];
    
    [mRegisterBt addTarget:self action:@selector(onRegisterClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onSmsClick{
    if(self.delegate){
        [self.delegate onSmsClick];
    }
}

-(void)onRegisterClick{
    if(self.delegate){
        [self.delegate onRegisterClick];
    }
}

@end
