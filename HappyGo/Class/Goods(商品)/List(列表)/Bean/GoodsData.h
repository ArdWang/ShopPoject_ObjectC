//
//  GoodsData.h
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsData : NSObject

@property(nonatomic,strong) NSString *goodsid;
@property(nonatomic,strong) NSString *categorypid;
@property(nonatomic,strong) NSString *categorysid;
@property(nonatomic,strong) NSString *goodsdesc;
@property(nonatomic,strong) NSString *goodsdefaulticon;
@property(nonatomic,strong) NSNumber *goodsdefaultprice;
@property(nonatomic,strong) NSNumber *goodssalescount;
@property(nonatomic,strong) NSNumber *goodsstockcount;

-(id)initWithDict:(NSDictionary*)dict;

@end
