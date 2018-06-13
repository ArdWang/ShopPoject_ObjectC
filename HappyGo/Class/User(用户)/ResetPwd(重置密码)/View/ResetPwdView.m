//
//  ResetPwdView.m
//  HappyGo
//
//  Created by rnd on 2018/5/17.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ResetPwdView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation ResetPwdView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

//初始化
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
    
    UIView *pwdView = [[UIView alloc] init];
    [mainView addSubview:pwdView];
    
    [pwdView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.top.equalTo(mainView).offset(0);
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
    self.mConfirmTF.secureTextEntry = YES;
    self.mPwdTF.placeholder = @"请输入密码（6-20位字母或数字）";
    [pwdView addSubview:self.mPwdTF];
    
    [self.mPwdTF makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(pwdImg).offset(40);
        make.centerY.equalTo(pwdView);
        make.right.equalTo(pwdView).offset(-20);
        make.height.equalTo(@40);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    [mainView addSubview:lineView];
    
    [lineView makeConstraints:^(MASConstraintMaker *make){
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
    
    //确认密码按钮
    UIButton *mConfirmBt = [[UIButton alloc] init];
    UIColor *color = [[CommonUtil sharedManager]  stringToColor:@"#03a9f4"];
    mConfirmBt.backgroundColor = color;
    mConfirmBt.layer.cornerRadius = 10;
    [mConfirmBt setTitle:@"确认" forState:UIControlStateNormal];
    [self addSubview:mConfirmBt];
    
    [mConfirmBt makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(mainView).offset(134);
        make.height.equalTo(@50);
    }];
    
    [mConfirmBt addTarget:self action:@selector(onConfirmClick) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)onConfirmClick{
    if(self.delegate){
        [self.delegate onConfirmClick];
    }
}

@end
