//
//  Cart.h
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartData.h"
#import "MJExtension.h"

@interface Cart : NSObject

@property(nonatomic,copy) NSString *code;

@property(nonatomic,copy) NSString *message;

@property(nonatomic,copy) NSArray *cartGoods;

+(NSDictionary*)mj_objectClassInArray;

@end
