//
//  CatesHeight.h
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CatesHeight : NSObject

@property (nonatomic, assign) CGFloat imageW;

@property (nonatomic, assign) CGFloat imageH;

+ (instancetype)cateWithDic:(NSDictionary *)cateDic;

@end
