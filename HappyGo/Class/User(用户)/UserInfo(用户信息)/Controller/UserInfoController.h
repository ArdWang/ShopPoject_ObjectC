//
//  UserInfoController.h
//  HappyGo
//
//  Created by rnd on 2018/5/18.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoView.h"
#import "CommonUtil.h"
#import "BaseViewController.h"
#import "UserInfoModel.h"
#import "MHProgress.h"
#import "CommonUserDefaults.h"
#import "UIImageView+WebCache.h"
#import "MeController.h"
#import <QiniuSDK.h>

@interface UserInfoController : BaseViewController

@property(strong,nonatomic) UserInfoView *userInfoView;

@property(strong,nonatomic) UserInfoModel *userInfoModel;

@property(strong,nonatomic) NSString *filePath;

@property(strong,nonatomic) NSString *userToken;

@property(strong,nonatomic) MHProgress *progress;

@property(strong,nonatomic) NSUserDefaults *userDefaults;

//获取当前的时间
@property(strong,nonatomic) NSDate *currentDate;

@property(strong,nonatomic) NSDateFormatter  *dateformatter; //时间格式化

@end
