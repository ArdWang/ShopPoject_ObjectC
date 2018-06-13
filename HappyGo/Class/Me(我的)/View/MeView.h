//
//  MeView.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"

//设置代理方法
@protocol MeViewDelegate <NSObject>

-(void)onUserClick;

-(void)onPayClick;

-(void)onRecClick;

-(void)onCpeClick;

-(void)onOrdClick;

-(void)onGoodsClick;

-(void)onShareClick;

-(void)onSetClick;

@end

@interface MeView : UIView

//设置代理
@property (nonatomic, weak) id<MeViewDelegate> delegate;

@property(strong,nonatomic) CommonUtil *commonUtil;

//定义头部的头像
@property(strong,nonatomic) UIImageView *userImgView;

@property(strong,nonatomic) UILabel *userLabel;

@property(strong,nonatomic) UIButton *mPayBtn;

@property(strong,nonatomic) UIButton *mRecBtn;

@property(strong,nonatomic) UIButton *mCpeBtn;

@property(strong,nonatomic) UIButton *mOrdBtn;

@property(strong,nonatomic) UIButton *mGoodsBtn;

@property(strong,nonatomic) UIButton *mShareBtn;

@property(strong,nonatomic) UIButton *mSetBtn;

@end
