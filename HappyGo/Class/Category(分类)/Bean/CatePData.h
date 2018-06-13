//
//  CatePData.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatePData : NSObject
@property(strong,nonatomic) NSString *categorypid;
@property(strong,nonatomic) NSString *categorypname;
@property(strong,nonatomic) NSString *categorypicon;
@property(strong,nonatomic) NSString *categorypnote;

-(id)initWithDict:(NSDictionary*)dict;

@end
