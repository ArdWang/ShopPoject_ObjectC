//
//  GoodsListModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "GoodsListModel.h"

@implementation GoodsListModel

//获取商品列表
-(void)getGoods:(NSString *) categorypid categorySid:(NSString *) categorysid  pageIndex:(NSString *) pageindex pageSize:(NSString *) pagesize {
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@goods/getGoodsInfo",baseUrl];
    NSDictionary *dict = @{@"categorypid":categorypid,
                           @"categorysid":categorysid,
                           @"pageIndex":pageindex,
                           @"pageSize":pagesize
                           };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:strUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.goods = [Goods mj_objectWithKeyValues:responseObject];
        if([self.goods.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(getGoodsList:)]){
                [self.delegate getGoodsList:self.goods.data];
            }
        }   
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
        
    }];
}


@end
