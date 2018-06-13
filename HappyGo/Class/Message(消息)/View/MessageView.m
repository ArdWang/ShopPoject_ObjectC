//
//  MessageView.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MessageView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation MessageView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

-(void)initView{
    self.mMsgTableView = [[UITableView alloc] init];
    [self addSubview:self.mMsgTableView];
    
    //布局
    [self.mMsgTableView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(-49);
    }];
}

@end
