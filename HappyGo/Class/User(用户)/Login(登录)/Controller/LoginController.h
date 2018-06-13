//
//  LoginController.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LoginView.h"
#import "LoginModel.h"
#import "UserData.h"
#import "CommonUserDefaults.h"
#import "MeController.h"
#import "MHProgress.h"
#import "RegisterController.h"
#import "ForgetPwdController.h"

@interface LoginController : BaseViewController

@property(strong,nonatomic) LoginView *loginView;

@property(strong,nonatomic) LoginModel *loginModel;

@property(strong,nonatomic) MHProgress *progress;

@end
