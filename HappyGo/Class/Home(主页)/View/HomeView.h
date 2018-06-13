//
//  HomeView.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"
#import "SDCycleScrollView.h"
#import "SGAdvertScrollView.h"
#import "ZheKouView.h"
#import "GLCoverFlowLayout.h"

@interface HomeView : UIView

@property(strong,nonatomic) SDCycleScrollView *cycleScrollView;
//头部导航栏
@property(strong,nonatomic) UINavigationController *homeNav;

@property(strong,nonatomic) UIView *lunBo;

//轮滑广告栏目
@property(strong,nonatomic) SGAdvertScrollView *advertScrollView;

@property(strong,nonatomic) ZheKouView *mZKView;

@property(nonatomic, strong) UICollectionView *zkCollectionView;

@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property(nonatomic, strong) UICollectionView *glCollectionView;

@property(nonatomic,strong) GLCoverFlowLayout *glflowLayout;

@end
