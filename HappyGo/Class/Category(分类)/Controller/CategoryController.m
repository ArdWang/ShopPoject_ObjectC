//
//  CategoryController.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CategoryController.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@interface CategoryController ()<CategoryModelDelegate,UITableViewDataSource, UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,XRWaterfallLayoutDelegate,SDCycleScrollViewDelegate>

@end

@implementation CategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commonUtil = [CommonUtil sharedManager];
    self.view.backgroundColor = [self.commonUtil stringToColor:@"#d9d9d9"];
    [self cerateNav];
    [self initView];
    [self initData];
}


-(void)cerateNav{
    UIColor *commonBlue = [self.commonUtil stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"商品分类";
}

-(void)initView{
    self.categoryView = [CategoryView new];
    self.categoryView.frame = self.view.bounds;
    [self.view addSubview:self.categoryView];
    
    //给主view添加约束
    [self.categoryView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.height.equalTo(self.view).offset(0);
    }];
    
    //设置代理，实现代理方法
    self.categoryView.waterfall.delegate = self;
    self.categoryView.collectionView.dataSource = self;
    self.categoryView.collectionView.delegate = self;
    self.categoryView.categoryTable.delegate = self;
    self.categoryView.categoryTable.dataSource = self;
    
    //设置cell的估计高度
    self.categoryView.categoryTable.estimatedRowHeight = 200;
    //iOS以后这句话是默认的，所以可以省略这句话
    self.categoryView.categoryTable.rowHeight = UITableViewAutomaticDimension;
}

-(void)initData{
    self.categoryModel = [CategoryModel new];
    [self.categoryModel getCatepGoryp];
    self.categoryModel.delegate = self;
    self.categorypList = [[NSMutableArray alloc] init];
    self.categorysList = [[NSMutableArray alloc] init];

    NSArray *imagesURLStrings = @[LUNBO_URL_ONE,LUNBO_URL_TWO,LUNBO_URL_THREE,LUNBO_URL_FOUR];
    
    self.categoryView.cycleScrollView.delegate = self;
    
    //--- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.categoryView.cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    });
}

/*
 * delegate
 */
#pragma mark model
//成功的时候
- (void)getCateSuccess:(NSArray *) list{
    //强制转换
    _categorypList = [NSMutableArray arrayWithArray:list];
    [_categoryView.categoryTable reloadData];
    
    //默认是第二个
    if(_categorypList.count>0){
        NSInteger selectedIndex = 1;
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:selectedIndex inSection:0];
        [self.categoryView.categoryTable selectRowAtIndexPath:selectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        _catePdata= [[CatePData alloc] initWithDict:[_categorypList objectAtIndex:1]];
        [_categoryModel getCatepGorys:_catePdata.categorypid];
    }
}

- (void)getCateSuccessS:(NSArray *) list{
    _categorysList = (NSMutableArray *)list;
    [_categoryView.collectionView reloadData];
}

//失败的时候
-(void)getCateFail:(NSString *) message{
    
}
//错误的时候
-(void)getCateError:(NSString *) message{
    
}


#pragma mark tableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"CategoryCellIdentifiter";
    self.categoryCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (self.categoryCell == nil) {
        self.categoryCell = [[CategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
    }
    NSUInteger row = [indexPath row];
    if(row<_categorypList.count){
        _catePdata= [[CatePData alloc] initWithDict:[_categorypList objectAtIndex:row]];
        _categoryCell.categorypLabel.text = _catePdata.categorypname;
    }
    return self.categoryCell;
}

#pragma tableView的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifiter = @"CategoryCellIdentifiter";
    self.categoryCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (self.categoryCell == nil) {
        self.categoryCell = [[CategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
    }
    NSUInteger row = [indexPath row];
    
    if(row<_categorypList.count){
        _catePdata= [[CatePData alloc] initWithDict:[_categorypList objectAtIndex:row]];
        [_categoryModel getCatepGorys:_catePdata.categorypid];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_categorypList count];
}


//
//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(XRWaterfallLayout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    if(_categorysCell!=nil){
        CGFloat Heigh1 = _categorysCell.catesImage.bounds.size.height;
        CGFloat Height2 = _categorysCell.catesLabel.bounds.size.height;
        return Heigh1+Height2+5;
    }else{
        return 80;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categorysList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"cell";
    _categorysCell = (CategorysCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiter forIndexPath:indexPath];
    NSUInteger row = [indexPath row];
    if(_categorysList.count>0){
        _cateSdata = [[CateSData alloc] initWithDict:[_categorysList objectAtIndex:row]];
        [_categorysCell.catesImage sd_setImageWithURL:[NSURL URLWithString:_cateSdata.categorysicon] placeholderImage:[UIImage imageNamed:@"user_default"]];
        _categorysCell.catesLabel.text = _cateSdata.categorysname;
    }
    return _categorysCell;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifiter = @"cell";
    _categorysCell = (CategorysCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiter forIndexPath:indexPath];
    NSUInteger row = [indexPath row];
    if(_categorysList.count>0){
        _cateSdata = [[CateSData alloc] initWithDict:[_categorysList objectAtIndex:row]];
        GoodsListController *goodsView = [[GoodsListController alloc] init];
        NSString *goodslist = @"商品列表";
        goodsView.title = goodslist;
        goodsView.categorypId = _cateSdata.categorypid;
        goodsView.categorysId = _cateSdata.categorysid;
        //[self presentViewController:goodsView animated:YES completion:nil];
        [self.navigationController pushViewController:goodsView animated:YES];
    }
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    //[self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}


@end
