//
//  GoodsListCell.h
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsListCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *GoodsImage;

@property (weak, nonatomic) IBOutlet UILabel *GoodsDetail;

@property (weak, nonatomic) IBOutlet UILabel *GoodsPrice;

@property (weak, nonatomic) IBOutlet UILabel *GoodsSelas;

@property (weak, nonatomic) IBOutlet UILabel *GoodsSave;



@end
