//
//  CateSData.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CateSData : NSObject

@property(strong,nonatomic) NSString *categorypid;
@property(strong,nonatomic) NSString *categorysid;
@property(strong,nonatomic) NSString *categorysname;
@property(strong,nonatomic) NSString *categorysicon;
@property(strong,nonatomic) NSString *categorysnote;

-(id)initWithDict:(NSDictionary*)dict;

@end
