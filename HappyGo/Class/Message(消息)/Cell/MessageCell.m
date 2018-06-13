//
//  MessageCell.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MessageCell.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


//布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //布局
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //图片显示
        self.mMsgImgV = [[UIImageView alloc] init];
        self.mMsgImgV.image = [UIImage imageNamed:@"kf6"];
        [self addSubview:self.mMsgImgV];
        
        [self.mMsgImgV makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.contentView).offset(10);
            make.width.equalTo(@50);
            make.height.equalTo(@50);
        }];
        
        //标题显示
        self.mMsgTitleLb = [[UILabel alloc] init];
        self.mMsgTitleLb.textColor = [UIColor grayColor];
        self.mMsgTitleLb.font = [UIFont fontWithName:@"Helvetica" size:16];
        self.mMsgTitleLb.text =@"标题";
        [self addSubview:self.mMsgTitleLb];
        
        [self.mMsgTitleLb makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.mMsgImgV).offset(60);
            make.height.equalTo(@25);
        }];
        
        //时间
        self.mMsgTimeLb = [[UILabel alloc] init];
        self.mMsgTimeLb.textColor = [UIColor grayColor];
        self.mMsgTimeLb.font = [UIFont fontWithName:@"Helvetica" size:16];
        self.mMsgTimeLb.text =@"2018/5/2 10:05";
        [self addSubview:self.mMsgTimeLb];
        
        [self.mMsgTimeLb makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@25);
        }];
        
        //是否已读
        _isRed = [[UILabel alloc] init];
        _isRed.textColor = [UIColor blackColor];
        _isRed.font = [UIFont fontWithName:@"Helvetica" size:14];
        NSString *isred = @"未读";
        _isRed.text = isred;
        [self.contentView addSubview:_isRed];
        
        [_isRed makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.mMsgTitleLb).offset(25);
            make.right.equalTo(self.contentView).offset(-10);
            make.width.equalTo(@40);
            make.height.equalTo(@25);
        }];
        
        //内容
        self.mMsgConLb = [[UILabel alloc] init];
        self.mMsgConLb.textColor = [UIColor grayColor];
        self.mMsgConLb.font = [UIFont fontWithName:@"Helvetica" size:16];
        self.mMsgConLb.text =@"2018/5/2 10:05";
        self.mMsgConLb.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:self.mMsgConLb];
        
        [self.mMsgConLb makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.mMsgTitleLb).offset(25);
            make.left.equalTo(self.mMsgImgV).offset(60);
            make.right.equalTo(self.isRed).offset(-45);
            make.height.equalTo(@25);
        }];
        
       
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
