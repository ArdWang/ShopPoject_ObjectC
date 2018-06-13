//
//  UserInfoView.m
//  HappyGo
//
//  Created by rnd on 2018/5/18.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "UserInfoView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation UserInfoView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

//显示view
-(void)initView{
    UIView *mainView = [[UIView alloc] init];
    mainView.backgroundColor = [UIColor whiteColor];
    [self addSubview:mainView];
    
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(94);
        make.height.equalTo(@310);
    }];
    
    UIButton *mUserImgbtn = [[UIButton alloc] init];
    [mainView addSubview:mUserImgbtn];
    
    [mUserImgbtn makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(mainView).offset(0);
        make.left.equalTo(mainView).offset(0);
        make.top.equalTo(mainView).offset(0);
        make.height.equalTo(@80);
    }];
    
    self.userImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default_user"]];
    self.userImgView.clipsToBounds = YES;
    self.userImgView.layer.cornerRadius = 30;
    [mUserImgbtn addSubview:self.userImgView];
    
    [self.userImgView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(mUserImgbtn).offset(-30);
        make.centerY.equalTo(mUserImgbtn);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
    //按钮里面右边图片
    UIImageView *rightImg = [[UIImageView alloc] init];
    rightImg.image = [UIImage imageNamed:@"right"];
    [mUserImgbtn addSubview:rightImg];
    
    [rightImg makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(mUserImgbtn);
        make.right.equalTo(mUserImgbtn).offset(-10);
        make.width.equalTo(@10);
        make.height.equalTo(@15);
    }];
    
    //按钮里面的文字
    UILabel *userlabel = [[UILabel alloc] init];
    userlabel.textColor = [UIColor grayColor];
    userlabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    userlabel.text =@"头像";
    [mUserImgbtn addSubview:userlabel];
    
    [userlabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(mUserImgbtn);
        make.left.equalTo(mUserImgbtn).offset(10);
        make.height.equalTo(@25);
    }];
    
    //添加view
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view1];
    
    [view1 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(mUserImgbtn).offset(81);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    UIView *userView = [[UIView alloc] init];
    [mainView addSubview:userView];
    
    [userView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view1).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.textColor = [UIColor grayColor];
    namelabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    namelabel.text =@"昵称";
    [userView addSubview:namelabel];
    
    [namelabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(userView);
        make.left.equalTo(userView).offset(10);
        make.height.equalTo(@25);
    }];
    
    self.mUserNameTF = [[UITextField alloc] init];
    self.mUserNameTF.borderStyle = UITextBorderStyleNone;
    self.mUserNameTF.textColor = [UIColor grayColor];
    self.mUserNameTF.placeholder = @"你的名字";
    [userView addSubview:self.mUserNameTF];
    
    [self.mUserNameTF makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(userView);
        make.right.equalTo(userView).offset(-10);
        make.height.equalTo(@40);
    }];
    
    //添加view
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view2];
    
    [view2 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(userView).offset(56);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //关于性别
    UIView *sexView = [[UIView alloc] init];
    [mainView addSubview:sexView];
    
    [sexView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view2).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    
    UILabel *sexlabel = [[UILabel alloc] init];
    sexlabel.textColor = [UIColor grayColor];
    sexlabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    sexlabel.text =@"性别";
    [sexView addSubview:sexlabel];
    
    [sexlabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(sexView);
        make.left.equalTo(sexView).offset(10);
        make.height.equalTo(@25);
    }];
    
    UIColor *buttonColor = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    self.mManBtn = [[UIButton alloc] init];
    //[self.mManBtn.layer setMasksToBounds:YES];
    [self.mManBtn.layer setBorderWidth:0.5];
    [self.mManBtn.layer setBorderColor:buttonColor.CGColor];
    self.mManBtn.layer.cornerRadius = 10;
    [self.mManBtn setTitle:@"男" forState:UIControlStateNormal];
    [self.mManBtn setTitleColor:buttonColor forState:UIControlStateNormal];
    [sexView addSubview:self.mManBtn];
    
    [self.mManBtn makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(sexView);
        make.right.equalTo(sexView).offset(-60);
        make.width.equalTo(@35);
        make.height.equalTo(@35);
    }];
    
    self.mFalemanBtn = [[UIButton alloc] init];
    //[self.mFalemanBtn.layer setMasksToBounds:YES];
    [self.mFalemanBtn.layer setBorderWidth:0.5];
    [self.mFalemanBtn.layer setBorderColor:buttonColor.CGColor];
    self.mFalemanBtn.layer.cornerRadius = 10;
    [self.mFalemanBtn setTitle:@"女" forState:UIControlStateNormal];
    [self.mFalemanBtn setTitleColor:buttonColor forState:UIControlStateNormal];
    [sexView addSubview:self.mFalemanBtn];
    
    [self.mFalemanBtn makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(sexView);
        make.right.equalTo(sexView).offset(-10);
        make.width.equalTo(@35);
        make.height.equalTo(@35);
    }];
    
    //添加view
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view3];
    
    [view3 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(sexView).offset(56);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    //手机
    UIView *phoneView = [[UIView alloc] init];
    [mainView addSubview:phoneView];
    
    [phoneView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view3).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    UILabel *phonelabel = [[UILabel alloc] init];
    phonelabel.textColor = [UIColor grayColor];
    phonelabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    phonelabel.text =@"手机";
    [phoneView addSubview:phonelabel];
    
    [phonelabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(phoneView);
        make.left.equalTo(phoneView).offset(10);
        make.height.equalTo(@25);
    }];
    
    self.mUserPhoneLb = [[UILabel alloc] init];
    self.mUserPhoneLb.textColor = [UIColor grayColor];
    self.mUserPhoneLb.font = [UIFont fontWithName:@"Helvetica" size:16];
    self.mUserPhoneLb.text =@"123456";
    [phoneView addSubview:self.mUserPhoneLb];
    
    [self.mUserPhoneLb makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(phoneView);
        make.right.equalTo(phoneView).offset(-10);
        make.height.equalTo(@25);
    }];
    
    //添加view
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#AAAAAA"];
    [mainView addSubview:view4];
    
    [view4 makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(phoneView).offset(56);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@0.5);
    }];
    
    UIView *signView = [[UIView alloc] init];
    [mainView addSubview:signView];
    
    [signView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(view4).offset(1);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@55);
    }];
    
    UILabel *signlabel = [[UILabel alloc] init];
    signlabel.textColor = [UIColor grayColor];
    signlabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    signlabel.text =@"签名";
    [signView addSubview:signlabel];
    
    [signlabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(signView);
        make.left.equalTo(signView).offset(10);
        make.height.equalTo(@25);
    }];
    
    self.mUserSignTF = [[UITextField alloc] init];
    self.mUserSignTF.borderStyle = UITextBorderStyleNone;
    self.mUserSignTF.textColor = [UIColor grayColor];
    self.mUserSignTF.placeholder = @"你的签名";
    [signView addSubview:self.mUserSignTF];
    
    [self.mUserSignTF makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(signView);
        make.right.equalTo(signView).offset(-10);
        make.height.equalTo(@40);
    }];
    
    
    
    [mUserImgbtn addTarget:self action:@selector(onUserImageClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mManBtn addTarget:self action:@selector(onManClick) forControlEvents:UIControlEventTouchUpInside];
    
     [self.mFalemanBtn addTarget:self action:@selector(onFaleManClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onUserImageClick{
    if(self.delegate){
        [self.delegate onUserImageClick];
    }
}

-(void)onManClick{
    if(self.delegate){
        [self.delegate onManClick];
    }
}

-(void)onFaleManClick{
    if(self.delegate){
        [self.delegate onFaleManClick];
    }
}


@end
