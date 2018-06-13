//
//  RegisterController.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"
#import "SmsButton.h"
#import "RegisterModel.h"
#import "MHProgress.h"
#import "LoginController.h"


@interface RegisterController : BaseViewController


@property(strong,nonatomic) RegisterView *registerView;

@property(strong,nonatomic) RegisterModel *registerModel;

@property(strong,nonatomic) MHProgress *progress;

@end
