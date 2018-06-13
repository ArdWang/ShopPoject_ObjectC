//
//  CartView.m
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CartView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation CartView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

-(void)initView{
    //创建TableView
    self.cartTbView = [[UITableView alloc] init];
    [self addSubview:self.cartTbView];
    
    //布局
    [self.cartTbView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(-99);
    }];
    
    //绘制底部
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
    [bottomView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.height.equalTo(@50);
        make.bottom.equalTo(self).offset(-49);
    }];
    
    self.checkBox = [[UIButton alloc] init];
    self.checkImageView = [[UIImageView alloc] init];
    self.checkImageView.image =[UIImage imageNamed:@"box_no"];
    [self.checkBox addSubview:self.checkImageView];
    [bottomView addSubview:self.checkBox];
    
    [self.checkImageView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.checkBox).offset(0);
        make.left.equalTo(self.checkBox).offset(0);
        make.right.equalTo(self.checkBox).offset(0);
        make.bottom.equalTo(self.checkBox).offset(0);
    }];
    
    [self.checkBox makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(bottomView);
        make.left.equalTo(bottomView).offset(10);
        make.width.offset(@25);
        make.height.offset(@25);
    }];
    
    //标题显示
    UILabel *allLb = [[UILabel alloc] init];
    allLb.textColor = [UIColor grayColor];
    allLb.font = [UIFont fontWithName:@"Helvetica" size:16];
    allLb.text =@"全选";
    [bottomView addSubview:allLb];
    
    [allLb makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(bottomView);
        make.left.equalTo(self.checkBox).offset(35);
        make.height.equalTo(@25);
    }];
    
    self.countPriceLb = [[UILabel alloc] init];
    self.countPriceLb.textColor = [UIColor redColor];
    self.countPriceLb.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.countPriceLb.text =@"合计 ¥0.00";
    [bottomView addSubview:self.countPriceLb];
    
    [self.countPriceLb makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(allLb).offset(60);
        make.centerY.equalTo(bottomView);
        make.height.equalTo(@25);
    }];
    
    self.goPay = [[UIButton alloc] init];
    self.goPay.backgroundColor = [UIColor redColor];
    [self.goPay setTitle:@"去结算" forState:UIControlStateNormal];
    [self.goPay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomView addSubview:self.goPay];
    
    [self.goPay makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(bottomView).offset(0);
        make.height.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.width.equalTo(@100);
    }];
    
}


@end
