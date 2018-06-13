//
//  CartCell.m
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CartCell.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation CartCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

//布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //布局
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor whiteColor];
        //选择框
        self.checkBox = [[UIButton alloc] init];
        [self.checkBox setImage:[UIImage imageNamed:@"box_no"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.checkBox];
      
        [self.checkBox makeConstraints:^(MASConstraintMaker *make){
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(10);
            make.width.offset(@25);
            make.height.offset(@25);
        }];
        
        //图片
        self.cartImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.cartImage];
        
        [self.cartImage makeConstraints:^(MASConstraintMaker *make){
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.checkBox).offset(35);
            make.width.equalTo(@80);
            make.height.equalTo(@80);
        }];
        
    
        self.cartTitleLb = [[UILabel alloc] init];
        self.cartTitleLb.textColor = [UIColor grayColor];
        self.cartTitleLb.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self.contentView addSubview:self.cartTitleLb];
        
        [self.cartTitleLb makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.left.equalTo(self.cartImage).offset(90);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@25);
        }];
        
        self.cartSkuLb = [[UILabel alloc] init];
        self.cartSkuLb.textColor = [UIColor grayColor];
        self.cartSkuLb.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self.contentView addSubview:self.cartSkuLb];
        
        [self.cartSkuLb makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.cartTitleLb).offset(25);
            make.left.equalTo(self.cartImage).offset(90);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@25);
        }];
        
        self.cartSkuPriceLb = [[UILabel alloc] init];
        self.cartSkuPriceLb.textColor = [UIColor redColor];
        self.cartSkuPriceLb.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self.contentView addSubview:self.cartSkuPriceLb];
        
        [self.cartSkuPriceLb makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.cartSkuLb).offset(25);
            make.left.equalTo(self.cartImage).offset(90);
            make.right.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@25);
        }];
        
        self.chooseCountView = [[ATChooseCountView alloc] init];
        self.chooseCountView.countColor = [UIColor redColor];
        self.chooseCountView.canEdit = NO;
        [self.contentView addSubview:self.chooseCountView];
        
        [self.chooseCountView makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.cartSkuLb).offset(30);
            make.right.equalTo(self.contentView).offset(-10);
            make.width.equalTo(@90);
            make.height.equalTo(@22);
        }];
        
        [self.checkBox addTarget:self action:@selector(onCheckClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//点击按钮
-(void)onCheckClick:(UIButton*)sender{
    if(self.delegate){
        [self.delegate onCheckClick:sender];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
