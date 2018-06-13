//
//  CartData.h
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartData : NSObject

/*
 private Integer userid;
 private Integer goodsid;
 private String goodsdesc;
 private String goodsicon;
 private Float goodsprice;
 private Integer goodscount;
 private String goodssku;
 */

@property(copy,nonatomic) NSNumber *cartid;
@property(copy,nonatomic) NSNumber *goodsid;
@property(copy,nonatomic) NSNumber *goodscount;
@property(copy,nonatomic) NSNumber *goodsprice;
@property(copy,nonatomic) NSNumber *goodssec;

@property(copy,nonatomic) NSString *goodsdesc;
@property(copy,nonatomic) NSString *goodsicon;
@property(copy,nonatomic) NSString *goodssku;



-(id)initWithDict:(NSDictionary*)dict;

@end
