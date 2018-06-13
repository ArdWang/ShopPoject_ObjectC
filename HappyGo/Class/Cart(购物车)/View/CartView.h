//
//  CartView.h
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartView : UIView

@property(strong,nonatomic) UITableView *cartTbView;

@property(strong,nonatomic) UIButton *checkBox;

@property(strong,nonatomic) UIImageView *checkImageView;

@property(strong,nonatomic) UILabel *countPriceLb;
//清除
@property(strong,nonatomic) UIButton *goPay;
//结算
@property(strong,nonatomic) UIButton *goDelete;

@end
