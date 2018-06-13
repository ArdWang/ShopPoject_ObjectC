//
//  ForgetPwdController.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForgetPwdView.h"
#import "SmsButton.h"
#import "ForgetPwdModel.h"
#import "MHProgress.h"
#import "ResetPwdController.h"

@interface ForgetPwdController : BaseViewController

@property(strong,nonatomic) ForgetPwdView *forgetPwdView;

@property(strong,nonatomic) ForgetPwdModel *forgetPwdModel;

@property(strong,nonatomic) MHProgress *progress;

@end
