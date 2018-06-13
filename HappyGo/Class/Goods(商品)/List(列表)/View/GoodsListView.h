//
//  GoodsListView.h
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRWaterfallLayout.h"
#import "CommonUtil.h"

@interface GoodsListView : UIView

@property(strong,nonatomic)   XRWaterfallLayout *waterfall;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) CommonUtil *commonUtil;

@end
