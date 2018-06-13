//
//  HomeController.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"
#import "BaseViewController.h"
#import "HomeView.h"
#import "AppConfig.h"
#import "SGAdvertScrollView.h"
#import "UIImageView+WebCache.h"
#import "HomeCell.h"
#import "GLCell.h"



@interface HomeController : BaseViewController

@property(nonatomic,strong) HomeView *homeView;

//主要的scrollview
@property(strong,nonatomic)UIScrollView *mainScrollView;

@property(strong,nonatomic) NSArray *homeList;

@property(strong,nonatomic) NSArray *glList;

@end
