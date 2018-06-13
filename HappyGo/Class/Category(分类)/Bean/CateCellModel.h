//
//  CateCellModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CateP.h"

@interface CateCellModel : NSObject

@property (nonatomic ,strong) CatePData *cateP;
/**
  *  主体Frame
  */
@property (nonatomic ,assign) CGRect bodyFrame;
/*
     文字的高度
 */
@property(nonatomic,assign) CGRect nameFrame;
/**
 *  cell高度
 */
@property (nonatomic ,assign) CGFloat cellHeight;

@end
