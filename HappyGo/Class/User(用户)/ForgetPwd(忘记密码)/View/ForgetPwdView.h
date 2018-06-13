//
//  ForgetPwdView.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmsButton.h"

//设置代理方法
@protocol ForgetPwdViewDelegate <NSObject>

-(void)onNextClick;

-(void)onSmsClick;

@end

@interface ForgetPwdView : UIView

//设置代理
@property (nonatomic, weak) id<ForgetPwdViewDelegate> delegate;

@property(strong,nonatomic) UITextField *mPhoneTF;

@property(strong,nonatomic) UITextField *mSmsTF;

@property(nonatomic,strong) UIButton *mSmsBtn;


@end
