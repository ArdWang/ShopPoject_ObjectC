//
//  CateS.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CateSData.h"

@interface CateS : NSObject

@property(strong,nonatomic) NSString *code;
@property(strong,nonatomic) NSString *message;
@property(strong,nonatomic) NSArray *cateGorys;

+(NSDictionary*)mj_objectClassInArray;

@end
