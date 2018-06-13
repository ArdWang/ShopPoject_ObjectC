//
//  CategoryView.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRWaterfallLayout.h"
#import "SDCycleScrollView.h"

@interface CategoryView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;

@property(strong,nonatomic) UITableView *categoryTable;

@property(strong,nonatomic)   XRWaterfallLayout *waterfall;

@property(strong,nonatomic) UIView *lunBo;

@property(strong,nonatomic) SDCycleScrollView *cycleScrollView;



@end
