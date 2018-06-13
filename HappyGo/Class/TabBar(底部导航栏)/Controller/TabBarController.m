//
//  TabBarController.m
//  HappyGo
//
//  Created by rnd on 2018/5/4.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarNavController : UINavigationController

@end

@implementation TabBarNavController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stepAllChildViewController];
    
    [self stepAllTitleButton];
    
    self.gla = [[GoodsListController alloc] init];
    
}


#pragma mark 设置TabBar按钮上面的所有内容
-(void)stepAllChildViewController{
    //主页
    self.home = [[HomeController alloc] init];
    TabBarNavController *homenav = [[TabBarNavController alloc] initWithRootViewController:self.home];
    [self addChildViewController:homenav];
    
    //分类
    self.cate = [[CategoryController alloc] init];
    TabBarNavController *catenav = [[TabBarNavController alloc] initWithRootViewController:self.cate];
    [self addChildViewController:catenav];
    
    //购物车
    self.cart = [[CartController alloc] init];
    TabBarNavController *cartnav = [[TabBarNavController alloc] initWithRootViewController:self.cart];
    [self addChildViewController:cartnav];
    
    //消息
    self.message = [[MessageController alloc] init];
    TabBarNavController *msgnav = [[TabBarNavController alloc] initWithRootViewController:self.message];
    [self addChildViewController:msgnav];
    
    //我的
    self.me = [[MeController alloc] init];
    TabBarNavController *menav = [[TabBarNavController alloc] initWithRootViewController:self.me];
    [self addChildViewController:menav];
}

-(void)stepAllTitleButton{
    //去掉顶部阴影部分
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    //主页
    UINavigationController *homenav = self.childViewControllers[0];
    homenav.tabBarItem.title = @"主页";
    homenav.tabBarItem.image = [UIImage imageNamed:@"home"];
    homenav.tabBarItem.selectedImage = [UIImage imageNamed:@"homepress"];
    
    //分类
    UINavigationController *catenav = self.childViewControllers[1];
    catenav.tabBarItem.title = @"分类";
    catenav.tabBarItem.image = [UIImage imageNamed:@"category"];
    catenav.tabBarItem.selectedImage = [UIImage imageNamed:@"categorypress"];
    
    //购物车
    UINavigationController *cartnav = self.childViewControllers[2];
    cartnav.tabBarItem.title = @"购物车";
    cartnav.tabBarItem.image = [UIImage imageNamed:@"cart"];
    cartnav.tabBarItem.selectedImage = [UIImage imageNamed:@"cartpress"];
    
    //消息
    UINavigationController *messagenav = self.childViewControllers[3];
    messagenav.tabBarItem.title = @"消息";
    messagenav.tabBarItem.image = [UIImage imageNamed:@"msg"];
    messagenav.tabBarItem.selectedImage = [UIImage imageNamed:@"msgpress"];
    
    //我的
    UINavigationController *menav = self.childViewControllers[4];
    menav.tabBarItem.title = @"我的";
    menav.tabBarItem.image = [UIImage imageNamed:@"me"];
    menav.tabBarItem.selectedImage = [UIImage imageNamed:@"mepress"];
}


@end
