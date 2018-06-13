//
//  ZheKouView.m
//  HappyGo
//
//  Created by rnd on 2018/5/22.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ZheKouView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation ZheKouView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

-(void)initView{
    self.mZkView = [[UIImageView alloc] init];
    self.mZkView.image = [UIImage imageNamed:@"header"];
    [self addSubview:self.mZkView];
    
    [self.mZkView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
    }];
    
    UIImageView *zkView = [[UIImageView alloc] init];
    zkView.image = [UIImage imageNamed:@"zhekou"];
    [self.mZkView addSubview:zkView];
    
    [zkView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.mZkView).offset(0);
        make.left.equalTo(self.mZkView).offset(0);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
}

@end
