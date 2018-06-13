//
//  ResetPwdController.h
//  HappyGo
//
//  Created by rnd on 2018/5/17.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResetPwdView.h"
#import "ResetPwdModel.h"
#import "MHProgress.h"
#import "LoginController.h"


@interface ResetPwdController : BaseViewController

@property(strong,nonatomic) ResetPwdView *resetPwdView;

@property(strong,nonatomic) ResetPwdModel *resetPwdModel;

//获取手机号码
@property(strong,nonatomic) NSString *phone;

@property(strong,nonatomic) MHProgress *progress;

@end
