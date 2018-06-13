//
//  GLCell.m
//  HappyGo
//
//  Created by rnd on 2018/5/23.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "GLCell.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation GLCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    UIView *mainView = [[UIView alloc] init];
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.layer.cornerRadius = 5;
    mainView.layer.shadowColor = [UIColor grayColor].CGColor;
    mainView.layer.shadowOffset = CGSizeMake(2, 5);
    mainView.layer.shadowOpacity = 0.5;
    mainView.layer.shadowRadius = 5;
    [self.contentView addSubview:mainView];
    
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView).offset(0);
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(0);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
    
    self.mGLImg = [[UIImageView alloc] init];
    [mainView addSubview:self.mGLImg];
    
    [self.mGLImg makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(mainView).offset(5);
        make.left.equalTo(mainView).offset(5);
        make.width.equalTo(@150);
        make.height.equalTo(@100);
    }];
    
    self.mGlTitleLb = [[UILabel alloc] init];
    self.mGlTitleLb.textColor = [UIColor grayColor];
    self.mGlTitleLb.font = [UIFont fontWithName:@"Helvetica" size:14];
    self.mGlTitleLb.text =@"爱生活";
    self.mGlTitleLb.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:self.mGlTitleLb];
    
    [self.mGlTitleLb makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mGLImg).offset(@105);
        make.left.equalTo(mainView).offset(5);
        make.right.equalTo(mainView).offset(-5);
        make.height.equalTo(@20);
    }];
    
    self.mGlConLb = [[UILabel alloc] init];
    self.mGlConLb.textColor = [UIColor grayColor];
    self.mGlConLb.font = [UIFont fontWithName:@"Helvetica" size:12];
    self.mGlConLb.text =@"有品有范有时髦";
    self.mGlConLb.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:self.mGlConLb];
    
    [self.mGlConLb makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mGlTitleLb).offset(@20);
        make.left.equalTo(mainView).offset(5);
        make.right.equalTo(mainView).offset(-5);
        make.height.equalTo(@20);
    }];

    
}


@end
