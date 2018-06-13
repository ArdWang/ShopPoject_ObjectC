//
//  CategoryView.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CategoryView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation CategoryView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

//创建控件
-(void)initView{
    //设置左边的布局
    UIView *leftView = [[UIView alloc] init];
    [self addSubview:leftView];
    
    //给主view添加约束
    [leftView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.3);
        make.bottom.equalTo(self).offset(0);
    }];
    
    self.categoryTable = [[UITableView alloc] init];
    [leftView addSubview:self.categoryTable];
    
    //布局
    [_categoryTable makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(leftView).offset(0);
        make.right.equalTo(leftView).offset(0);
        make.top.equalTo(leftView).offset(0);
        make.bottom.equalTo(leftView).offset(-49);
    }];
    
    //右边布局
    UIView *rightView = [[UIView alloc] init];
    [self addSubview:rightView];
    //给主view添加约束
    [rightView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.68);
        make.bottom.equalTo(self).offset(0);
    }];
    
    self.lunBo = [[UIView alloc] init];
    self.lunBo.backgroundColor = [UIColor grayColor];
    [rightView addSubview:self.lunBo];
    
    [self.lunBo makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(rightView).offset(-5);
        make.top.equalTo(rightView).offset(70);
        make.left.equalTo(rightView).offset(5);
        make.height.equalTo(@150);
    }];
    
    _cycleScrollView = [[SDCycleScrollView alloc] init];
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.lunBo addSubview:_cycleScrollView];
    
    [_cycleScrollView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.lunBo).offset(0);
        make.top.equalTo(self.lunBo).offset(0);
        make.left.equalTo(self.lunBo).offset(0);
        make.bottom.equalTo(self.lunBo).offset(0);
    }];
    
    UILabel *recodLabel = [[UILabel alloc] init];
    recodLabel.textColor = [UIColor blackColor];
    recodLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    recodLabel.text = @"热卖推荐";
    [rightView addSubview:recodLabel];
    
    [recodLabel makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.lunBo).offset(155);
        make.left.equalTo(rightView).offset(5);
        make.right.equalTo(rightView).offset(-5);
        make.height.equalTo(@30);
    }];
    
    
    
    
    
    //2.初始化collectionView
    //创建瀑布流布局
    _waterfall = [XRWaterfallLayout waterFallLayoutWithColumnCount:3];
    
    //或者一次性设置
    [_waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];

    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:rightView.bounds collectionViewLayout:_waterfall];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CategorysCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [rightView addSubview:self.collectionView];
    
    [self.collectionView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(recodLabel).offset(30);
        make.left.equalTo(rightView).offset(0);
        make.right.equalTo(rightView).offset(-5);
        make.bottom.equalTo(rightView).offset(-49);
    }];
}

@end
