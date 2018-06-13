//
//  HomeCell.m
//  HappyGo
//
//  Created by rnd on 2018/5/22.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "HomeCell.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIView *mainView = [[UIView alloc] init];
    [self.contentView addSubview:mainView];
    
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
    
    
    
    self.mZkImage = [[ZheKouView alloc] init];
  
    [mainView addSubview:self.mZkImage];
    
    [self.mZkImage makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(mainView).offset(0);
        make.left.equalTo(mainView).offset(0);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
    self.mZkHLb = [[UILabel alloc] init];
    self.mZkHLb.textColor = [UIColor redColor];
    self.mZkHLb.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.mZkHLb.text =@"¥1900";
    self.mZkHLb.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:self.mZkHLb];
    
    [self.mZkHLb makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mZkImage).offset(@60);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@20);
    }];
    
    self.mZkQLb = [[UILabel alloc] init];
    self.mZkQLb.textColor = [UIColor grayColor];
    self.mZkQLb.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.mZkQLb.text =@"¥3900";
    self.mZkQLb.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:self.mZkQLb];
    
    [self.mZkQLb makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mZkHLb).offset(@20);
        make.left.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.height.equalTo(@20);
    }];

    
}



@end
