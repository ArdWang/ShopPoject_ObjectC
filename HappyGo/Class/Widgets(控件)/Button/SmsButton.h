//
//  SmsButton.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CommonUtil.h"

@interface SmsButton : UIView

@property(strong,nonatomic) CommonUtil *commonUtil;

//验证码按钮单例封装
+ (instancetype)sharedSmsBHandle;

- (UIButton *)title:(NSString *)title;

- (void)startTimer;

@end
