//
//  MessageCell.h
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property(strong,nonatomic) UILabel *mMsgTitleLb;

@property(strong,nonatomic) UILabel *mMsgConLb;

@property(strong,nonatomic) UILabel *mMsgTimeLb;

@property(strong,nonatomic) UIImageView *mMsgImgV;

@property(strong,nonatomic) UILabel *isRed;

@end
