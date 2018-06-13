//
//  MeController.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MeView.h"
#import "LoginController.h"
#import "CommonUserDefaults.h"
#import "UIImageView+WebCache.h"
#import "UserInfoController.h"
#import "SetController.h"


@interface MeController : BaseViewController

@property(strong,nonatomic) MeView *meView;

@property(strong,nonatomic) NSUserDefaults *userDefaults;

@end
