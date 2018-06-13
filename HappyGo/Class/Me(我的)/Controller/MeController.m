//
//  MeController.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MeController.h"

@interface MeController ()<MeViewDelegate>

@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#EAEAEA"];
    [self initView];
    [self initData];
    
}

-(void)initView{
    [self meViewd];
    self.meView.delegate = self;
    self.meView.frame = self.view.bounds;
    [self.view addSubview:self.meView];
}

//存储数据
-(void)initData{
    [self getUserDefaults];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    NSString * imgUrl = [self.userDefaults stringForKey:UD_USER_IMG];
    NSString *userName = [self.userDefaults stringForKey:UD_USER_NAME];
    if(imgUrl!=nil&&![imgUrl isEqual:@""]){
        [self.meView.userImgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"default_user"]];
    }else{
        self.meView.userImgView.image = [UIImage imageNamed:@"default_user"];
    }
    
    if(userName!=nil&&![userName isEqual:@""]){
        self.meView.userLabel.text = userName;
    }else{
        self.meView.userLabel.text = @"注册/登录";
    }
}
    
-(NSUserDefaults*)getUserDefaults{
    if(self.userDefaults==nil){
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self.userDefaults;
}


- (void)viewWillDisappear:(BOOL)animated{
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

-(MeView *)meViewd{
    if(self.meView==nil){
        self.meView=[[MeView alloc] init];
    }
    return self.meView;
}

//判断是否是登录
-(void) onUserClick{
    if([self.userDefaults stringForKey:UD_USER_PHONE]==nil){
        LoginController *loginView = [[LoginController alloc] init];
        NSString *logintitle = @"登录";
        loginView.title = logintitle;
        [self.navigationController pushViewController:loginView animated:YES];
    }else{
        //跳转到用户信息中去
        UserInfoController *userInfoView = [[UserInfoController alloc] init];
        NSString *usertitle = @"个人信息";
        userInfoView.title = usertitle;
        [self.navigationController pushViewController:userInfoView animated:YES];
    }
}

-(void)onPayClick{
    
}

-(void)onRecClick{
    
}

-(void)onCpeClick{
    
}

-(void)onOrdClick{
    
}

-(void)onGoodsClick{
    
}

-(void)onShareClick{
    
}

//转入设置界面
-(void)onSetClick{
    SetController *setView = [[SetController alloc] init];
    setView.title = @"设置";
    [self.navigationController pushViewController:setView animated:YES];
}

@end
