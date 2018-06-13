//
//  CategoryCell.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CateCellModel.h"

@interface CategoryCell : UITableViewCell

@property(strong,nonatomic) UILabel *categorypLabel;

@property(strong,nonatomic) CateCellModel *cateCell;

@end
