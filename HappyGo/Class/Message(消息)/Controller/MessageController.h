//
//  MessageController.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MessageView.h"
#import "Message.h"
#import "MessageModel.h"
#import "MessageCell.h"
#import "MJRefresh.h"
#import "AppConfig.h"
#import "CommonUtil.h"


@interface MessageController : BaseViewController

@property(nonatomic,strong) MessageView *msgView;

@property(nonatomic,strong) MessageModel *msgModel;

@property(nonatomic,strong) NSUserDefaults *userDefaults;

@property(nonatomic,strong) NSMutableArray *msgList;

@property(assign,nonatomic) int pageSize;

@property(nonatomic,strong) NSString *userid;


@end
