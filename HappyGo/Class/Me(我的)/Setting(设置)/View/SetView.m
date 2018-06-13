//
//  SetView.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "SetView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation SetView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

//初始化View
-(void)initView{
    //mainView按钮
    UIView *mainView = [[UIView alloc] init];
    mainView.backgroundColor = [UIColor whiteColor];
    [self addSubview:mainView];
    
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(74);
        make.height.equalTo(@228);
    }];
    
    //用户协议按钮
    self.mUserPoBtn = [[UIButton alloc] init];
    [mainView addSubview:self.mUserPoBtn];

    [self.mUserPoBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(mainView).offset(0);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面的文字
    UILabel *userpolabel = [[UILabel alloc] init];
    userpolabel.textColor = [UIColor blackColor];
    userpolabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    userpolabel.text =@"用户协议";
    [self.mUserPoBtn addSubview:userpolabel];
    
    [userpolabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mUserPoBtn.centerY);
        make.left.equalTo(self.mUserPoBtn).offset(20);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg1 = [[UIImageView alloc] init];
    rightImg1.image = [UIImage imageNamed:@"right"];
    [self.mUserPoBtn addSubview:rightImg1];
    
    [rightImg1 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mUserPoBtn.centerY);
        make.right.equalTo(self.mUserPoBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //添加view
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view1];
    [view1 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mUserPoBtn).offset(56);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //反馈意见
    self.mFeedBackBtn = [[UIButton alloc] init];
    [mainView addSubview:self.mFeedBackBtn];
    
    [self.mFeedBackBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view1).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面的文字
    UILabel *feedbacklabel = [[UILabel alloc] init];
    feedbacklabel.textColor = [UIColor blackColor];
    feedbacklabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    feedbacklabel.text =@"反馈意见";
    [self.mFeedBackBtn addSubview:feedbacklabel];
    
    [feedbacklabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mFeedBackBtn.centerY);
        make.left.equalTo(self.mFeedBackBtn).offset(20);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg2 = [[UIImageView alloc] init];
    rightImg2.image = [UIImage imageNamed:@"right"];
    [self.mFeedBackBtn addSubview:rightImg2];
    
    [rightImg2 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mFeedBackBtn.centerY);
        make.right.equalTo(self.mFeedBackBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //添加view
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view2];
    [view2 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mFeedBackBtn).offset(56);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //清理缓存
    self.mClearSaveBtn = [[UIButton alloc] init];
    [mainView addSubview:self.mClearSaveBtn];
    
    [self.mClearSaveBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view2).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面的文字
    UILabel *clearsavelabel = [[UILabel alloc] init];
    clearsavelabel.textColor = [UIColor blackColor];
    clearsavelabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    clearsavelabel.text =@"清理缓存";
    [self.mClearSaveBtn addSubview:clearsavelabel];
    
    [clearsavelabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mClearSaveBtn.centerY);
        make.left.equalTo(self.mClearSaveBtn).offset(20);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg3 = [[UIImageView alloc] init];
    rightImg3.image = [UIImage imageNamed:@"right"];
    [self.mClearSaveBtn addSubview:rightImg3];
    
    [rightImg3 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mClearSaveBtn.centerY);
        make.right.equalTo(self.mClearSaveBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //添加view
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view3];
    [view3 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mClearSaveBtn).offset(56);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //关于
    self.mAboutBtn = [[UIButton alloc] init];
    [mainView addSubview:self.mAboutBtn];
    
    [self.mAboutBtn makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view3).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    //按钮里面的文字
    UILabel *aboutlabel = [[UILabel alloc] init];
    aboutlabel.textColor = [UIColor blackColor];
    aboutlabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    aboutlabel.text =@"关于";
    [self.mAboutBtn addSubview:aboutlabel];
    
    [aboutlabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mAboutBtn.centerY);
        make.left.equalTo(self.mAboutBtn).offset(20);
        make.height.equalTo(@25);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg4 = [[UIImageView alloc] init];
    rightImg4.image = [UIImage imageNamed:@"right"];
    [self.mAboutBtn addSubview:rightImg4];
    
    [rightImg4 makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.mAboutBtn.centerY);
        make.right.equalTo(self.mAboutBtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
   
    UIButton *mLoginOutBt = [[UIButton alloc] init];
    mLoginOutBt.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    mLoginOutBt.layer.cornerRadius = 10;
    [mLoginOutBt setTitle:@"退出登录" forState:UIControlStateNormal];
    [self addSubview:mLoginOutBt];
    
    [mLoginOutBt makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(mainView).offset(250);
        make.height.equalTo(@50);
    }];
    
    [mLoginOutBt addTarget:self action:@selector(onLoginOutClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onLoginOutClick{
    if(self.delegate){
        [self.delegate onLoginOutClick];
    }
}


@end
