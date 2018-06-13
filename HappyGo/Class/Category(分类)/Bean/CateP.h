//
//  CateP.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "CatePData.h"

@interface CateP : NSObject

@property(strong,nonatomic) NSString *code;
@property(strong,nonatomic) NSString *message;
@property(strong,nonatomic) NSArray *data;

+(NSDictionary*)mj_objectClassInArray;

@end
