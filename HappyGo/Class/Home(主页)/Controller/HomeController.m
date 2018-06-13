//
//  HomeController.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "HomeController.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

static NSString *cellIdentifiter = @"CellIdentifiter";
static NSString *glcellIdentifiter = @"GLCellIdentifiter";

@interface HomeController ()<UISearchBarDelegate,SDCycleScrollViewDelegate,UIScrollViewDelegate,SGAdvertScrollViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    //背景为白色
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    [self initData];
}

-(void)initView{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    self.mainScrollView = [[UIScrollView alloc] init];
    self.mainScrollView.contentSize = CGSizeMake(size.width, 850);
    self.mainScrollView.scrollEnabled = YES;
    self.mainScrollView.directionalLockEnabled = YES;
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScrollView];
    
    [self.mainScrollView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    [self getHomeView];
    self.homeView.frame = self.view.bounds;
    [self.mainScrollView addSubview:self.homeView];
    
    //给主view添加约束
    [self.homeView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.mainScrollView).offset(0);
        make.height.equalTo(@850);
    }];
    
    self.homeView.advertScrollView.titles = @[@"京东、天猫等 app 首页常见的广告滚动视图", @"采用代理设计模式进行封装, 可进行事件点击处理", @"建议在 github 上下载"];
    self.homeView.advertScrollView.titleColor = [UIColor grayColor];
    self.homeView.advertScrollView.textAlignment = NSTextAlignmentCenter;
    self.homeView.advertScrollView.scrollTimeInterval = 5;
    self.homeView.advertScrollView.titleFont = [UIFont systemFontOfSize:14];
    self.homeView.advertScrollView.delegate = self;
    
    self.homeView.zkCollectionView.dataSource = self;
    self.homeView.zkCollectionView.delegate = self;
    
    [self.homeView.zkCollectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:cellIdentifiter];
    
    self.homeView.glCollectionView.dataSource = self;
    self.homeView.glCollectionView.delegate = self;
    [self.homeView.glCollectionView registerClass:[GLCell class] forCellWithReuseIdentifier:glcellIdentifiter];
    
    
}


-(HomeView*)getHomeView{
    if(self.homeView == nil){
        self.homeView = [[HomeView alloc] init];
    }
    return self.homeView;
}

-(NSArray*)getHomeList{
    if(self.homeList==nil){
        self.homeList = [NSArray array];
    }
    return self.homeList;
}

-(NSArray*)getGlList{
    if(self.glList==nil){
        self.glList = [NSArray array];
    }
    return self.glList;
}

-(void)initData{
    NSArray *imagesURLStrings = @[LUNBO_URL_ONE,LUNBO_URL_TWO,LUNBO_URL_THREE,LUNBO_URL_FOUR];
    self.homeView.cycleScrollView.delegate = self;
    //--- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.homeView.cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    });
    
    [self homeList];
    [self getGlList];
    
    self.homeList = @[HOME_DISCOUNT_ONE,HOME_DISCOUNT_TWO,HOME_DISCOUNT_THREE,HOME_DISCOUNT_FOUR,HOME_DISCOUNT_FIVE];
    
    self.glList = @[HOME_TOPIC_ONE,HOME_TOPIC_TWO,HOME_TOPIC_THREE,HOME_TOPIC_FOUR,HOME_TOPIC_FIVE];
}

/*
     重写了导航栏事件
 */
- (void)customContentView{
    self.commonUtil = [CommonUtil sharedManager];
    UIColor *commonBlue = [self.commonUtil stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    CGRect mainViewBounds = self.navigationController.view.bounds;
    UISearchBar *customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(CGRectGetWidth(mainViewBounds)/2-((CGRectGetWidth(mainViewBounds)-120)/2), CGRectGetMinY(mainViewBounds)+22, CGRectGetWidth(mainViewBounds)-120, 40)];
    customSearchBar.delegate = self;
    customSearchBar.showsCancelButton = NO;
    customSearchBar.tintColor = [UIColor whiteColor];
    customSearchBar.barTintColor = [UIColor whiteColor];
    UITextField *searchField = [customSearchBar valueForKey:@"_searchField"];
    // 输入文本颜色
    searchField.textColor = [UIColor whiteColor];
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: customSearchBar];
    UIBarButtonItem *scan = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"scan"] style:UIBarButtonItemStylePlain target:self action:@selector(scanOnClick)];
    self.navigationItem.rightBarButtonItem = scan;
}

/*
     searchBar事件
 */
//当搜索框开始编辑时候调用
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"DidBegin");
}

//点击SearchButton调用
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"SearchButtonClicked");
}


-(void)scanOnClick{
    
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
}

/// 代理方法
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"点击了%ld",(long)index);
}

//collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if([collectionView isEqual:self.homeView.zkCollectionView]){
        return self.homeList.count;
    }else if([collectionView isEqual:self.homeView.glCollectionView]){
        return self.glList.count;
    }
    return 0;
}

#pragma mark cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if([collectionView isEqual:self.homeView.glCollectionView]){
        return CGSizeMake(160, 150);
    }else if([collectionView isEqual:self.homeView.zkCollectionView]){
        return CGSizeMake(60, 90);
    }
    return CGSizeMake(100, 100);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if([collectionView isEqual:self.homeView.zkCollectionView]){
        HomeCell *cell = (HomeCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifiter forIndexPath:indexPath];
        NSUInteger row = [indexPath row];
        if(self.homeList.count>0){
             [cell.mZkImage.mZkView sd_setImageWithURL:[NSURL URLWithString:self.homeList[row]] placeholderImage:[UIImage imageNamed:@"user_default"]];
        }
        return cell;
    }
    else if([collectionView isEqual:self.homeView.glCollectionView]){
        GLCell *cell = (GLCell *)[collectionView dequeueReusableCellWithReuseIdentifier:glcellIdentifiter forIndexPath:indexPath];
        NSUInteger row = [indexPath row];
        if(self.glList.count>0){
            [cell.mGLImg sd_setImageWithURL:[NSURL URLWithString:self.glList[row]] placeholderImage:[UIImage imageNamed:@"user_default"]];
        }
        return cell;
    }
    
    return nil;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
