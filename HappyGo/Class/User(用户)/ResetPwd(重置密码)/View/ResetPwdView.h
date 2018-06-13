//
//  ResetPwdView.h
//  HappyGo
//
//  Created by rnd on 2018/5/17.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"

//设置代理方法
@protocol ResetPwdViewDelegate <NSObject>

-(void)onConfirmClick;

@end

@interface ResetPwdView : UIView

//设置代理
@property (nonatomic, weak) id<ResetPwdViewDelegate> delegate;

@property(nonatomic,strong) UITextField *mPwdTF;

@property(nonatomic,strong) UITextField *mConfirmTF;

@end
