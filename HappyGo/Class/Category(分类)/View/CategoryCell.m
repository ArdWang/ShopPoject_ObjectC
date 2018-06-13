//
//  CategoryCell.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CategoryCell.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation CategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //布局
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.categorypLabel = [[UILabel alloc] init];
        self.categorypLabel.textColor = [UIColor blackColor];
        self.categorypLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self.contentView addSubview:self.categorypLabel];
        
        [self.categorypLabel makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(self.contentView).offset(10);
            make.centerX.equalTo(self.contentView);
            make.height.equalTo(@25);
        }];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

@end
