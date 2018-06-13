//
//  UserInfoView.h
//  HappyGo
//
//  Created by rnd on 2018/5/18.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"

//设置代理方法
@protocol UserInfoViewDelegate <NSObject>

-(void)onUserImageClick;

-(void)onManClick;

-(void)onFaleManClick;

@end

@interface UserInfoView : UIView

//设置代理
@property (nonatomic, weak) id<UserInfoViewDelegate> delegate;

//头像
@property(nonatomic,strong) UIImageView *userImgView;
//昵称
@property(nonatomic,strong) UITextField *mUserNameTF;
//签名
@property(nonatomic,strong) UITextField *mUserSignTF;
//手机号码
@property(nonatomic,strong) UILabel *mUserPhoneLb;
//男
@property(nonatomic,strong) UIButton *mManBtn;
//女
@property(nonatomic,strong) UIButton *mFalemanBtn;

@end
