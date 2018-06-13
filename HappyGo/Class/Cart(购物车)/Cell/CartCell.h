//
//  CartCell.h
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATChooseCountView.h"

@protocol CartCellDelegate <NSObject>

-(void)onCheckClick:(UIButton *)sender;

@end

@interface CartCell : UITableViewCell

@property(nonatomic,assign) id<CartCellDelegate> delegate;

@property(strong,nonatomic) UIButton *checkBox;

@property(strong,nonatomic) UIImageView *cartImage;

@property(strong,nonatomic) UILabel *cartTitleLb;

@property(strong,nonatomic) UILabel *cartSkuLb;

@property(strong,nonatomic) UILabel *cartSkuPriceLb;

@property(strong,nonatomic) UILabel *cartNumberLb;

@property (nonatomic, strong) ATChooseCountView *chooseCountView;

@end
