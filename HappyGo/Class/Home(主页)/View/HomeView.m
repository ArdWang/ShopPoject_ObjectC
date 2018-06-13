//
//  HomeView.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "HomeView.h"

#ifdef __OBJC__
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#endif

@implementation HomeView

//添加布局
-(instancetype) init{
    self = [super init];
    if(self){
        [self initView];
    }
    return self;
}

/*
     自定义导航栏
 */
-(void)cerateNav{
    UIColor *commonBlue = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    self.homeNav = [[UINavigationController alloc] init];
    //[self.homeNav.navigationBar setBarTintColor:commonBlue];
    //创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    [navBar setBarTintColor:commonBlue];
    //创建一个导航栏集合
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"主页"];
    UIBarButtonItem *scanbutton =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"scan"] style:UIBarButtonItemStylePlain target:self action:@selector(scanOnClick)];
    navItem.rightBarButtonItem = scanbutton;
    navBar.tintColor = [UIColor whiteColor]; 
}

/*
     创建View
 */
-(void)initView{
    UIView *mainView = [[UIView alloc] init];
    [self addSubview:mainView];
    
    //给主view添加约束
    [mainView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).offset(0);
        make.bottom.equalTo(self).offset(0);
    }];
    
    self.lunBo = [[UIView alloc] init];
    self.lunBo.backgroundColor = [UIColor grayColor];
    [mainView addSubview:self.lunBo];
    
    [self.lunBo makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(mainView).offset(0);
        make.right.equalTo(mainView).offset(0);
        make.left.equalTo(mainView).offset(0);
        make.height.equalTo(@180);
    }];
    
    self.cycleScrollView = [[SDCycleScrollView alloc] init];
    self.cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.lunBo addSubview:self.cycleScrollView];
    
    [self.cycleScrollView makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.lunBo).offset(0);
        make.top.equalTo(self.lunBo).offset(0);
        make.left.equalTo(self.lunBo).offset(0);
        make.bottom.equalTo(self.lunBo).offset(0);
    }];
    
    UIView *noticeView = [[UIView alloc] init];
    noticeView.backgroundColor = [UIColor whiteColor];
    noticeView.layer.cornerRadius = 19;
    noticeView.layer.masksToBounds = YES;
    noticeView.layer.borderWidth = 0.5;
    noticeView.layer.borderColor = [[UIColor colorWithWhite:0.5 alpha:0.8] CGColor];
    
    [mainView addSubview:noticeView];
    
    [noticeView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.lunBo).offset(190);
        make.left.equalTo(mainView).offset(10);
        make.right.equalTo(mainView).offset(-10);
        make.height.equalTo(@35);
    }];
    
    //制作图片显示
    UIImageView *noticeImg = [[UIImageView alloc] init];
    noticeImg.image = [UIImage imageNamed:@"news"];
    [noticeView addSubview:noticeImg];
    
    [noticeImg makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(noticeView);
        make.left.equalTo(noticeView).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@15);
    }];
    
    UIView *noticLine = [[UIView alloc] init];
    noticLine.backgroundColor = [UIColor grayColor];
    [noticeView addSubview:noticLine];
    
    [noticLine makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(noticeView);
        make.left.equalTo(noticeImg).offset(50);
        make.width.equalTo(@1);
        make.height.equalTo(@20);
    }];
    
    
    
    self.advertScrollView = [[SGAdvertScrollView alloc] init];
    [noticeView addSubview:self.advertScrollView];
    
    [self.advertScrollView makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(noticeView);
        make.left.equalTo(noticLine).offset(5);
        make.right.equalTo(noticeView).offset(-10);
        make.height.equalTo(@30);
    }];
    
    //特价火爆进行中
    UIView *specialView = [[UIView alloc] init];
    [mainView addSubview:specialView];
    
    [specialView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(noticeView).offset(40);
        make.left.equalTo(mainView).offset(10);
        make.right.equalTo(mainView).offset(-10);
        make.height.equalTo(@100);
    }];
    
    UIView *sptopView = [[UIView alloc] init];
    [specialView addSubview:sptopView];
    
    [sptopView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(specialView).offset(0);
        make.left.equalTo(specialView).offset(10);
        make.right.equalTo(specialView).offset(-10);
        make.height.equalTo(@30);
    }];
    
    UIImageView *specialImg = [[UIImageView alloc] init];
    specialImg.image = [UIImage imageNamed:@"special"];
    [sptopView addSubview:specialImg];
    
    [specialImg makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(sptopView);
        make.left.equalTo(sptopView).offset(0);
        make.width.equalTo(@40);
        make.height.equalTo(@20);
    }];
    
    UILabel *fireLabel = [[UILabel alloc] init];
    fireLabel.textColor = [UIColor blackColor];
    fireLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    fireLabel.text =@"火爆进行中";
    [sptopView addSubview:fireLabel];
    
    [fireLabel makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(sptopView);
        make.left.equalTo(specialImg).offset(50);
        make.right.equalTo(sptopView).offset(-10);
        make.height.equalTo(@20);
    }];
    
    //添加横向的tableView
    // (view.height - 10) *0.5 +  （屏幕宽 / 个数）
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(60, 90);
    // 设置UICollectionView为横向滚动
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 每一行cell之间的间距
    self.flowLayout.minimumLineSpacing = 32;
    // 设置第一个cell和最后一个cell,与父控件之间的间距
    self.flowLayout.sectionInset = UIEdgeInsetsMake(8, 0, 8, 0);
    self.zkCollectionView =[[UICollectionView alloc] initWithFrame:specialView.bounds collectionViewLayout:self.flowLayout];
    self.zkCollectionView.backgroundColor = [UIColor whiteColor];
    self.zkCollectionView.scrollsToTop = NO;
    self.zkCollectionView.showsVerticalScrollIndicator = NO;
    self.zkCollectionView.showsHorizontalScrollIndicator = NO;
    
    [specialView addSubview:self.zkCollectionView];
    
    //布局
    [self.zkCollectionView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(specialView).offset(10);
        make.right.equalTo(specialView).offset(-10);
        make.top.equalTo(sptopView).offset(30);
        make.height.equalTo(specialView).offset(0);
    }];
    
    UIView *glView = [[UIView alloc] init];
    [mainView addSubview:glView];
    
    [glView makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(specialView).offset(150);
        make.left.equalTo(mainView).offset(10);
        make.right.equalTo(mainView).offset(-10);
        make.height.equalTo(@200);
    }];
    
    self.glflowLayout = [[GLCoverFlowLayout alloc] init];
    self.glCollectionView =[[UICollectionView alloc] initWithFrame:glView.bounds collectionViewLayout:self.glflowLayout];
    UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"home_container_bg"]];
    [self.glCollectionView setBackgroundColor:bgColor];
    self.glCollectionView.scrollsToTop = NO;
    self.glCollectionView.showsVerticalScrollIndicator = NO;
    self.glCollectionView.showsHorizontalScrollIndicator = NO;
    
    [glView addSubview:self.glCollectionView];
    
    //布局
    [self.glCollectionView makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(glView).offset(0);
        make.height.equalTo(glView).offset(0);
    }];
}

-(void)scanOnClick{
    NSLog(@"OK");
}


@end
