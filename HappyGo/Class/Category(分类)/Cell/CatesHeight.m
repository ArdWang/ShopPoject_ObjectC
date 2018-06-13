//
//  CatesHeight.m
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CatesHeight.h"


@implementation CatesHeight

+ (instancetype)cateWithDic:(NSDictionary *)cateDic{
    CatesHeight *cate = [[CatesHeight alloc] init];
    cate.imageW = [cateDic[@"w"] floatValue];
    cate.imageH = [cateDic[@"h"] floatValue];
    return cate;
    
}


@end
