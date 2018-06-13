//
//  HomeCell.h
//  HappyGo
//
//  Created by rnd on 2018/5/22.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZheKouView.h"

@interface HomeCell : UICollectionViewCell

@property(strong, nonatomic) ZheKouView *mZkImage;

@property(strong,nonatomic) UILabel *mZkQLb;

@property(strong,nonatomic) UILabel *mZkHLb;

@property(strong,nonatomic) UIImageView *mZkImg;

@end
