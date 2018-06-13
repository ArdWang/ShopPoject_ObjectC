//
//  TabBarController.h
//  HappyGo
//
//  Created by rnd on 2018/5/4.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeController.h"
#import "CategoryController.h"
#import "MessageController.h"
#import "CartController.h"
#import "MeController.h"
#import "GoodsListController.h"

@interface TabBarController : UITabBarController

@property(strong,nonatomic) HomeController *home;

@property(strong,nonatomic) CategoryController *cate;

@property(strong,nonatomic) MessageController *message;

@property(strong,nonatomic) CartController *cart;

@property(strong,nonatomic) MeController *me;

@property(strong,nonatomic) GoodsListController *gla;

@end

