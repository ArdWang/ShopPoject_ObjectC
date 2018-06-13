//
//  GoodsListController.m
//  HappyGo
//
//  Created by rnd on 2018/5/14.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "GoodsListController.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@interface GoodsListController()<GoodsListModelDelegate,UICollectionViewDataSource,UICollectionViewDelegate,XRWaterfallLayoutDelegate>
@end

@implementation GoodsListController



- (void)viewDidLoad {
    [super viewDidLoad];
    //默认为6个数据
    self.pageSize = 6;
    [self cerateNav];
    [self initView];
    [self initData];
    [self setupRefresh];
}

-(void)cerateNav{
    self.commonUtil = [CommonUtil sharedManager];
    UIColor *commonBlue = [self.commonUtil stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"商品列表";
    self.view.backgroundColor = [self.commonUtil stringToColor:@"#EAEAEA"];
}

-(void)initView{
    self.goodsListView = [GoodsListView new];
    self.goodsListView.frame = self.view.bounds;
    [self.view addSubview:self.goodsListView];
    
    //给主view添加约束
    [self.goodsListView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.height.equalTo(self.view).offset(0);
    }];
    
    //设置代理，实现代理方法
    self.goodsListView.waterfall.delegate = self;
    self.goodsListView.collectionView.dataSource = self;
    self.goodsListView.collectionView.delegate = self;
}

/// 刷新加载数据
- (void)setupRefresh{
    __weak __typeof(self) weakSelf = self;
    // 上拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.goodsListView.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
   self.goodsListView.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

-(NSMutableArray *)dataArray{
    if(self.goodsList==nil){
        self.goodsList = [NSMutableArray array];
    }
    return self.goodsList;
}

/*
     刷新数据
 */
-(void)loadNewData{
    if(self.goodsList.count>0){
        [self.goodsList removeAllObjects];
    }
    //加载数据
    [self getLoadData:self.pageSize];
}

#pragma mark 上拉加载更多数据
- (void)loadMoreData{
    // 刷新数据
    self.pageSize=self.pageSize+2;
    //加载数据
    [self getLoadData:self.pageSize];
}

-(void)initData{
    self.goodsListModel = [GoodsListModel new];
    self.goodsListModel.delegate = self;
    self.goodsList = [self dataArray];
    [self getLoadData:self.pageSize];
}

-(void)getLoadData:(int) pageSize{
    NSString *pagesize = [NSString stringWithFormat:@"%d",pageSize];
    if(_categorypId!=nil&&_categorysId!=nil){
        [_goodsListModel getGoods:_categorypId categorySid:_categorysId  pageIndex:@"1" pageSize:pagesize];
    }
}

//
//成功的时候
-(void)getGoodsList:(NSArray *) list{
    self.goodsList = [NSMutableArray arrayWithArray:list];
    [self.goodsListView.collectionView reloadData];
    // 拿到当前的下拉刷新控件，结束刷新状态
    [self.goodsListView.collectionView.mj_header endRefreshing];
    // 隐藏当前的上拉刷新控件
    [self.goodsListView.collectionView.mj_footer endRefreshing];
}

//
- (CGFloat)waterfallLayout:(XRWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    return 230;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.goodsListView.collectionView.mj_footer.hidden = _goodsList.count == 0;
    return self.goodsList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"goodscell";
    _goodsListCell = (GoodsListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiter forIndexPath:indexPath];
    NSUInteger row = [indexPath row];
    if(self.goodsList.count>0){
        _goodsData = [[GoodsData alloc] initWithDict:[_goodsList objectAtIndex:row]];
        [_goodsListCell.GoodsImage sd_setImageWithURL:[NSURL URLWithString:_goodsData.goodsdefaulticon] placeholderImage:[UIImage imageNamed:@"user_default"]];
        _goodsListCell.GoodsDetail.text = _goodsData.goodsdesc;
        _goodsListCell.GoodsPrice.text = [NSString stringWithFormat:@"¥ %@",_goodsData.goodsdefaultprice];
        _goodsListCell.GoodsSelas.text =[NSString stringWithFormat:@"%@",_goodsData.goodssalescount ];
        _goodsListCell.GoodsSave.text =[NSString stringWithFormat:@"%@",_goodsData.goodsstockcount];
    }
    
    return _goodsListCell;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
}


@end

/**
 // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
 __weak UICollectionView *collectionView = self.goodsListView.collectionView;
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 // 刷新表格
 [collectionView reloadData];
 });
 
 self.goodsListView.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
 
 self.goodsListView.collectionView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 if(self.goodsList.count>0){
 [self.goodsList removeAllObjects];
 }
 [self.goodsListView.collectionView reloadData];
 [self.goodsListView.collectionView.mj_header endRefreshing];
 //加载数据
 [self getLoadData:self.pageSize];
 });
 }];
 
 **/



