//
//  ForgetPwdView.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ForgetPwdView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation ForgetPwdView

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
    
    UIView *smsView = [[UIView alloc] init];
    [mainView addSubview:smsView];
    
    [smsView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(mainView).offset(52);
        make.height.equalTo(@50);
    }];
    
    UIImageView *smsImg = [[UIImageView alloc] init];
    smsImg.image = [UIImage imageNamed:@"code"];
    [smsView addSubview:smsImg];
    
    [smsImg makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(smsView).offset(10);
        make.centerY.equalTo(smsView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    self.mSmsTF = [[UITextField alloc] init];
    self.mSmsTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.mSmsTF.borderStyle = UITextBorderStyleNone;
    self.mSmsTF.placeholder = @"请输入你的验证码";
    [smsView addSubview:self.mSmsTF];
    
    [self.mSmsTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(smsImg).offset(40);
        make.centerY.equalTo(smsView);
        make.right.equalTo(smsView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIButton *mNextBt = [[UIButton alloc] init];
    UIColor *color = [[CommonUtil sharedManager]  stringToColor:@"#03a9f4"];
    mNextBt.backgroundColor = color;
    mNextBt.layer.cornerRadius = 10;
    [mNextBt setTitle:@"下一步" forState:UIControlStateNormal];
    [self addSubview:mNextBt];
    
    [mNextBt makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(mainView).offset(134);
        make.height.equalTo(@50);
    }];
    
     [self.mSmsBtn addTarget:self action:@selector(onSmsClick) forControlEvents:UIControlEventTouchUpInside];
    
    [mNextBt addTarget:self action:@selector(onNextClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onSmsClick{
    if(self.delegate){
        [self.delegate onSmsClick];
    }
}


-(void)onNextClick{
    if(self.delegate){
        [self.delegate onNextClick];
    }
}

@end
