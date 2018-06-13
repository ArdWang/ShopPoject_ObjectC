//
//  CartController.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CartView.h"
#import "CartModel.h"
#import "CartCell.h"
#import "Cart.h"
#import "UIImageView+WebCache.h"

@interface CartController : BaseViewController

@property(strong,nonatomic) CartView *cartView;

@property(strong,nonatomic) CartModel *cartModel;

@property(strong,nonatomic) NSMutableArray *cartList;

@property(strong,nonatomic) NSString *userid;

@property(nonatomic,strong) NSUserDefaults *userDefaults;

@property(nonatomic,assign) BOOL selectOk;


@end
