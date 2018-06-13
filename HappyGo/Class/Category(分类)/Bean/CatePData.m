//
//  CatePData.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CatePData.h"

@implementation CatePData


-(id)initWithDict:(NSDictionary*)dict{
    
    if(self = [super init]){
        self.categorypid = dict[@"categorypid"];
        self.categorypname = dict[@"categorypname"];
        self.categorypicon = dict[@"categorypicon"];
        self.categorypnote = dict[@"categorypnote"];
    }
    return self;
}

@end
