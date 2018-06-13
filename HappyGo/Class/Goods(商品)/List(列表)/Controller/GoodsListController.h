//
//  GoodsListController.h
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"
#import "GoodsListModel.h"
#import "GoodsListCell.h"
#import "GoodsListView.h"
#import "CommonUtil.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "BaseViewController.h"


@interface GoodsListController : BaseViewController

@property(nonatomic,strong) NSMutableArray *goodsList;

@property(nonatomic,strong) GoodsData *goodsData;

@property(nonatomic,strong) GoodsListCell *goodsListCell;

@property(nonatomic,strong) GoodsListView *goodsListView;

@property(nonatomic,strong) GoodsListModel *goodsListModel;

@property(nonatomic,strong) CommonUtil *commonUtil;

//分类的id
@property(strong,nonatomic) NSString *categorypId;

@property(strong,nonatomic) NSString *categorysId;

@property(assign,nonatomic) int pageSize;



@end
