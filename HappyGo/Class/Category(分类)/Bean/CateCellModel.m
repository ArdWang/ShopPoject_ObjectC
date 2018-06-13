//
//  CateCellModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//  高度计算
//

#import "CateCellModel.h"


@implementation CateCellModel

-(void)setCate:(CatePData *)catedata{
    self.cateP = catedata;
    //计算主体Frame
    [self setMomentsBodyFrames];
    //计算CellHeight
    [self setCellHeight];
}

//计算Code圈主体Frame
- (void)setMomentsBodyFrames{
    CGFloat fontHight = 14;
    self.nameFrame = CGRectMake(fontHight, fontHight, fontHight, fontHight);
}

- (void)setCellHeight{
    self.cellHeight = CGRectGetMaxY(self.nameFrame);
}


@end
