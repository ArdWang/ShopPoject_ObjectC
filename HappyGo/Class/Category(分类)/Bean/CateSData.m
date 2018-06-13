//
//  CateSData.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CateSData.h"

@implementation CateSData

-(id)initWithDict:(NSDictionary*)dict{
    
    if(self = [super init]){
        self.categorypid = dict[@"categorypid"];
        self.categorysid = dict[@"categorysid"];
        self.categorysname = dict[@"categorysname"];
        self.categorysicon = dict[@"categorysicon"];
        self.categorysnote = dict[@"categorysnote"];
    }
    return self;
}

@end
