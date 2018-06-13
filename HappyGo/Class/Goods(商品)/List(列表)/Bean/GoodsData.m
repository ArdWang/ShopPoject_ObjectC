//
//  GoodsData.m
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "GoodsData.h"

@implementation GoodsData

-(id)initWithDict:(NSDictionary*)dict{
    if(self = [super init]){
        self.goodsid = dict[@"goodsid"];
        self.categorypid = dict[@"categorypid"];
        self.categorysid = dict[@"categorysid"];
        self.goodsdesc = dict[@"goodsdesc"];
        self.goodsdefaulticon = dict[@"goodsdefaulticon"];
        self.goodsdefaultprice = dict[@"goodsdefaultprice"];
        self.goodssalescount = dict[@"goodssalescount"];
        self.goodsstockcount = dict[@"goodsstockcount"];
    }
    return self;
}

@end
