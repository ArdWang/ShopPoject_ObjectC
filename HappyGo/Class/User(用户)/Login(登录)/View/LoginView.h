//
//  LoginView.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"

//设置代理方法
@protocol LoginViewDelegate <NSObject>

-(void)onLoginClick;

-(void)onForgetClick;

@end

@interface LoginView : UIView

//设置代理
@property (nonatomic, weak) id<LoginViewDelegate> delegate;

@property(strong,nonatomic) UITextField *mPhoneTF;

@property(strong,nonatomic) UITextField *mPwdTF;

@property(strong,nonatomic) CommonUtil *commonUtil;

@end
