//
//  BaseViewController.h
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"

@interface BaseViewController : UIViewController

@property (nonatomic , copy) NSString *titleName;

@property (nonatomic,strong) CommonUtil *commonUtil;

- (void)customContentView;

- (void)customNavigationLeftItem;

- (void)customNavigationRightItem;

@end
