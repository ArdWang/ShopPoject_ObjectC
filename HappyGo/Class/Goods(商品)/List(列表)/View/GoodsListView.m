//
//  GoodsListView.m
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "GoodsListView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation GoodsListView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

-(void)initView{
    self.commonUtil = [CommonUtil sharedManager];
    UIColor *commonColor = [self.commonUtil stringToColor:@"#EAEAEA"];
    //创建瀑布流布局
    _waterfall = [XRWaterfallLayout waterFallLayoutWithColumnCount:2];
    //或者一次性设置
    [_waterfall setColumnSpacing:5 rowSpacing:5 sectionInset:UIEdgeInsetsMake(5, 5, 5, 5)];
    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_waterfall];
    self.collectionView.backgroundColor = commonColor;
    [self.collectionView registerNib:[UINib nibWithNibName:@"GoodsListCell" bundle:nil] forCellWithReuseIdentifier:@"goodscell"];
    [self addSubview:self.collectionView];
    
    [self.collectionView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(0);
    }];
}

@end
