//
//  SetView.h
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"

//设置代理方法
@protocol SetViewDelegate <NSObject>

-(void)onLoginOutClick;

@end

@interface SetView : UIView

//设置代理
@property (nonatomic, weak) id<SetViewDelegate> delegate;

@property(strong,nonatomic) UIButton *mUserPoBtn;

@property(strong,nonatomic) UIButton *mFeedBackBtn;

@property(strong,nonatomic) UIButton *mClearSaveBtn;

@property(strong,nonatomic) UIButton *mAboutBtn;

@end
