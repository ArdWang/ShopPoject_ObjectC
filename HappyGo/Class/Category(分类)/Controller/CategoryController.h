//
//  CategoryController.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonUtil.h"
#import "CategoryView.h"
#import "CategoryCell.h"
#import "CategoryModel.h"
#import "CatePData.h"
#import "CateSData.h"
#import "CategorysCell.h"
#import "UIImageView+WebCache.h"
#import "XRWaterfallLayout.h"
#import "GoodsListController.h"
#import "AppConfig.h"
#import "SDCycleScrollView.h"
#import "BaseViewController.h"
#import "CateCellModel.h"
#import "CatesHeight.h"


@interface CategoryController : BaseViewController

//主要的scrollview
@property(strong,nonatomic)UIScrollView *mainScrollView;

@property(strong,nonatomic) CommonUtil *commonUtil;

@property(strong,nonatomic) CategoryView *categoryView;

@property(strong,nonatomic) CategoryCell *categoryCell;

@property(strong,nonatomic) CategorysCell *categorysCell;

@property(strong,nonatomic) CategoryModel *categoryModel;

@property(strong,nonatomic) NSMutableArray *categorypList;

@property(strong,nonatomic) NSMutableArray *categorysList;

@property(strong,nonatomic) CatePData *catePdata;

@property(strong,nonatomic) CateSData *cateSdata;

@end
