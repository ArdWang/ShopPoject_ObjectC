//
//  MeView.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MeView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation MeView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
        [self initEvent];
    }
    return self;
}

//添加布局 Me界面的设计
-(void)initView{
    //顶部view
    UIView *topView = [[UIView alloc] init];
    UIImageView *topImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
    [topView addSubview:topImgView];
    [self addSubview:topView];
    
    [topImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(topView).offset(0);
        make.left.equalTo(topView).offset(0);
        make.top.equalTo(topView).offset(0);
        make.bottom.equalTo(topView).offset(0);
    }];
    
    [topView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.height.equalTo(@170);
    }];
    
    //个人头像
    UIButton *personView = [[UIButton alloc] init];
    [topView addSubview:personView];
    
    [personView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(topView).offset(20);
        make.centerY.equalTo(topView);
        make.width.equalTo(@180);
        make.height.equalTo(@80);
    }];
    
    self.userImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_user"]];
    self.userImgView.clipsToBounds = YES;
    self.userImgView.layer.cornerRadius = 35;
    [personView addSubview:self.userImgView];
    
    [self.userImgView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(personView).offset(0);
        make.centerY.equalTo(personView);
        make.width.equalTo(@70);
        make.height.equalTo(@70);
    }];
    
    self.userLabel = [[UILabel alloc] init];
    self.userLabel.textColor = [UIColor whiteColor];
    self.userLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    self.userLabel.text = @"注册/登录";
    [personView addSubview:self.userLabel];
    
    [self.userLabel makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(personView).offset(80);
        make.centerY.equalTo(personView);
        make.right.equalTo(personView).offset(-10);
        make.height.equalTo(@50);
    }];
    
    //中间的View
    UIView *middleView = [[UIView alloc] init];
    middleView.backgroundColor = [UIColor whiteColor];
    [self addSubview:middleView];
    
    [middleView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.top.equalTo(topView).offset(170);
        make.height.equalTo(@80);
    }];
    
    //添加按钮
    self.mPayBtn = [[UIButton alloc] init];
    [middleView addSubview:self.mPayBtn];
    
    UIImageView *payView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pay"]];
    [self.mPayBtn addSubview:payView];
    
    [payView makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mPayBtn);
        make.top.equalTo(self.mPayBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    UILabel *payLabel = [[UILabel alloc] init];
    payLabel.textColor = [UIColor grayColor];
    payLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    payLabel.textAlignment = NSTextAlignmentCenter;
    payLabel.text = @"待付款";
    [self.mPayBtn addSubview:payLabel];
    
    [payLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(payView).offset(30);
        make.left.equalTo(self.mPayBtn).offset(0);
        make.right.equalTo(self.mPayBtn).offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.mPayBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(middleView).offset(0);
        make.left.equalTo(middleView).offset(0);
        make.width.equalTo(middleView).multipliedBy(0.25);
        make.height.equalTo(@80);
    }];
    
    //获取屏幕的宽度
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    int a = (int)width/4;
    
    //添加按钮
    self.mRecBtn = [[UIButton alloc] init];
    [middleView addSubview:self.mRecBtn];
    
    UIImageView *recView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"confirm"]];
    [self.mRecBtn addSubview:recView];
    
    [recView makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mRecBtn);
        make.top.equalTo(self.mRecBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    UILabel *recLabel = [[UILabel alloc] init];
    recLabel.textColor = [UIColor grayColor];
    recLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    recLabel.textAlignment = NSTextAlignmentCenter;
    recLabel.text = @"待收货";
    [self.mRecBtn addSubview:recLabel];
    
    [recLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(recView).offset(30);
        make.left.equalTo(self.mRecBtn).offset(0);
        make.right.equalTo(self.mRecBtn).offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.mRecBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(middleView).offset(0);
        make.width.equalTo(middleView).multipliedBy(0.25);
        make.left.equalTo(self.mPayBtn).offset(a);
        make.height.equalTo(@80);
    }];
    
    //已完成按钮
    self.mCpeBtn = [[UIButton alloc] init];
    [middleView addSubview:self.mCpeBtn];
    
    UIImageView *cpeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"complete"]];
    [self.mCpeBtn addSubview:cpeView];
    
    [cpeView makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mCpeBtn);
        make.top.equalTo(self.mCpeBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    UILabel *cpeLabel = [[UILabel alloc] init];
    cpeLabel.textColor = [UIColor grayColor];
    cpeLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    cpeLabel.textAlignment = NSTextAlignmentCenter;
    cpeLabel.text = @"已完成";
    [self.mCpeBtn addSubview:cpeLabel];
    
    [cpeLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(cpeView).offset(30);
        make.left.equalTo(self.mCpeBtn).offset(0);
        make.right.equalTo(self.mCpeBtn).offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.mCpeBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(middleView).offset(0);
        make.left.equalTo(self.mRecBtn).offset(a);
        make.width.equalTo(middleView).multipliedBy(0.25);
        make.height.equalTo(@80);
    }];
    
    //全部订单按钮
    self.mOrdBtn = [[UIButton alloc] init];
    [middleView addSubview:self.mOrdBtn];
    
    UIImageView *ordView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order"]];
    [self.mOrdBtn addSubview:ordView];
    
    [ordView makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mOrdBtn);
        make.top.equalTo(self.mOrdBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    UILabel *ordLabel = [[UILabel alloc] init];
    ordLabel.textColor = [UIColor grayColor];
    ordLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    ordLabel.textAlignment = NSTextAlignmentCenter;
    ordLabel.text = @"我的订单";
    [self.mOrdBtn addSubview:ordLabel];
    
    [ordLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(ordView).offset(30);
        make.left.equalTo(self.mOrdBtn).offset(0);
        make.right.equalTo(self.mOrdBtn).offset(0);
        make.height.equalTo(@30);
    }];
    
    [self.mOrdBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(middleView).offset(0);
        make.left.equalTo(self.mCpeBtn).offset(a);
        make.width.equalTo(middleView).multipliedBy(0.25);
        make.height.equalTo(@80);
    }];
    
    //底部的View
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
    [bottomView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.top.equalTo(middleView).offset(100);
        make.height.equalTo(@170);
    }];
    
    //收获管理
    self.mGoodsBtn = [[UIButton alloc] init];
    self.mGoodsBtn.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.mGoodsBtn];
    
    [self.mGoodsBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(bottomView).offset(0);
        make.left.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面左边图片
    UIImageView *goodsImg = [[UIImageView alloc] init];
    goodsImg.image = [UIImage imageNamed:@"address"];
    [self.mGoodsBtn addSubview:goodsImg];
    
    [goodsImg makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mGoodsBtn.centerY);
        make.left.equalTo(self.mGoodsBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    //按钮里面的文字
    UILabel *goodslabel = [[UILabel alloc] init];
    goodslabel.textColor = [UIColor blackColor];
    goodslabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    goodslabel.text =@"收货管理";
    [self.mGoodsBtn addSubview:goodslabel];
    
    [goodslabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mGoodsBtn.centerY);
        make.left.equalTo(self.mGoodsBtn).offset(50);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg1 = [[UIImageView alloc] init];
    rightImg1.image = [UIImage imageNamed:@"right"];
    [self.mGoodsBtn addSubview:rightImg1];
    
    [rightImg1 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mGoodsBtn.centerY);
        make.right.equalTo(self.mGoodsBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //添加view
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [bottomView addSubview:view1];
    [view1 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mGoodsBtn).offset(56);
        make.left.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //
    //收获管理
    self.mShareBtn = [[UIButton alloc] init];
    self.mShareBtn.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.mShareBtn];
    
    [self.mShareBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view1).offset(2);
        make.left.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面左边图片
    UIImageView *shareImg = [[UIImageView alloc] init];
    shareImg.image = [UIImage imageNamed:@"share"];
    [self.mShareBtn addSubview:shareImg];
    
    [shareImg makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mShareBtn.centerY);
        make.left.equalTo(self.mShareBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    //按钮里面的文字
    UILabel *sharelabel = [[UILabel alloc] init];
    sharelabel.textColor = [UIColor blackColor];
    sharelabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    sharelabel.text =@"分享";
    [self.mShareBtn addSubview:sharelabel];
    
    [sharelabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mShareBtn.centerY);
        make.left.equalTo(self.mShareBtn).offset(50);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg2 = [[UIImageView alloc] init];
    rightImg2.image = [UIImage imageNamed:@"right"];
    [self.mShareBtn addSubview:rightImg2];
    
    [rightImg2 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mShareBtn.centerY);
        make.right.equalTo(self.mShareBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //添加view
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [bottomView addSubview:view2];
    [view2 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mShareBtn).offset(56);
        make.left.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //设置管理
    self.mSetBtn = [[UIButton alloc] init];
    self.mSetBtn.backgroundColor = [UIColor whiteColor];
    [bottomView addSubview:self.mSetBtn];
    
    [self.mSetBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view2).offset(2);
        make.left.equalTo(bottomView).offset(0);
        make.right.equalTo(bottomView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面左边图片
    UIImageView *setImg = [[UIImageView alloc] init];
    setImg.image = [UIImage imageNamed:@"setting"];
    [self.mSetBtn addSubview:setImg];
    
    [setImg makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mSetBtn.centerY);
        make.left.equalTo(self.mSetBtn).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    //按钮里面的文字
    UILabel *setlabel = [[UILabel alloc] init];
    setlabel.textColor = [UIColor blackColor];
    setlabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    setlabel.text =@"设置";
    [self.mSetBtn addSubview:setlabel];
    
    [setlabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mSetBtn.centerY);
        make.left.equalTo(self.mSetBtn).offset(50);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg3 = [[UIImageView alloc] init];
    rightImg3.image = [UIImage imageNamed:@"right"];
    [self.mSetBtn addSubview:rightImg3];
    
    [rightImg3 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mSetBtn.centerY);
        make.right.equalTo(self.mSetBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //按钮控制事件
    [personView addTarget:self action:@selector(onUserClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)initEvent{
    [self.mPayBtn addTarget:self action:@selector(onPayClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mRecBtn addTarget:self action:@selector(onRecClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mCpeBtn addTarget:self action:@selector(onCpeClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mOrdBtn addTarget:self action:@selector(onOrdClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mGoodsBtn addTarget:self action:@selector(onGoodsClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mShareBtn addTarget:self action:@selector(onShareClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mSetBtn addTarget:self action:@selector(onSetClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)onUserClick{
    if(self.delegate){
        [self.delegate onUserClick];
    }
}

-(void)onPayClick{
    if(self.delegate){
        [self.delegate onPayClick];
    }
}

-(void)onRecClick{
    if(self.delegate){
        [self.delegate onRecClick];
    }
}

-(void)onCpeClick{
    if(self.delegate){
        [self.delegate onCpeClick];
    }
}

-(void)onOrdClick{
    if(self.delegate){
        [self.delegate onOrdClick];
    }
}

-(void)onGoodsClick{
    if(self.delegate){
        [self.delegate onGoodsClick];
    }
}

-(void)onShareClick{
    if(self.delegate){
        [self.delegate onShareClick];
    }
}

-(void)onSetClick{
    if(self.delegate){
        [self.delegate onSetClick];
    }
}

@end
