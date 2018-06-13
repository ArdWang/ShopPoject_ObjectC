//
//  RegisterView.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmsButton.h"
#import "CommonUtil.h"

//设置代理方法
@protocol RegisterViewDelegate <NSObject>

-(void)onSmsClick;

-(void)onRegisterClick;

@end

@interface RegisterView : UIView

//设置代理
@property (nonatomic, weak) id<RegisterViewDelegate> delegate;

@property(nonatomic,strong) UITextField *mPhoneTF;

@property(nonatomic,strong) UITextField *mSmsTF;

@property(nonatomic,strong) UITextField *mPwdTF;

@property(nonatomic,strong) UITextField *mConfirmTF;

@property(nonatomic,strong) UIButton *mSmsBtn;

@end
