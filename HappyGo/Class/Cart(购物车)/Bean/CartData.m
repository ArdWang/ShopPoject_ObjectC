//
//  CartData.m
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CartData.h"

/*
 @property(copy,nonatomic) NSNumber *cartid;
 @property(copy,nonatomic) NSNumber *goodsid;
 @property(copy,nonatomic) NSNumber *goodscount;
 @property(copy,nonatomic) NSNumber *goodsprice;
 
 @property(copy,nonatomic) NSString *goodsdesc;
 @property(copy,nonatomic) NSString *goodsicon;
 @property(copy,nonatomic) NSString *goodssku;
 */


@implementation CartData

-(id)initWithDict:(NSDictionary*)dict{
    if(self = [super init]){
        self.cartid = dict[@"cartid"];
        self.goodsid = dict[@"goodsid"];
        self.goodscount = dict[@"goodscount"];
        self.goodsprice = dict[@"goodsprice"];
        self.goodsdesc = dict[@"goodsdesc"];
        self.goodsicon = dict[@"goodsicon"];
        self.goodssku = dict[@"goodssku"];
        self.goodssec = dict[@"goodssec"];
    }
    return self;
}

@end
