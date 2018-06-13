//
//  GoodsListModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AppConfig.h"
#import "MJExtension.h"
#import "Goods.h"

@protocol GoodsListModelDelegate <NSObject>

//成功的时候
-(void)getGoodsList:(NSArray *) list;

@end

@interface GoodsListModel : NSObject

@property(nonatomic,assign) id<GoodsListModelDelegate> delegate;

@property(nonatomic,strong) Goods *goods;

@property(nonatomic,strong) GoodsData *goodsData;

//获取商品列表
-(void)getGoods:(NSString *) categorypid categorySid:(NSString *) categorysid  pageIndex:(NSString *) pageindex pageSize:(NSString*) pagesize;


@end
