//
//  CartController.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CartController.h"

@interface CartController ()<CartCellDelegate,CartModelDelegate,UITableViewDataSource, UITableViewDelegate>
@end

@implementation CartController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self initView];
    //接收温度数据的消息通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataCompletion:) name:@"goodsNofiction" object:nil];
}

//加载界面的时候需要处理
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //加载数据
    self.userid = [self.userDefaults stringForKey:UD_USER_ID];
    if(self.userid!=nil){
        [self.cartModel getCart:self.userid];
    }
}

-(void)dataCompletion:(NSNotification*)notification{
    NSDictionary *data = [notification userInfo];
    NSString *goodsData = [data objectForKey:@"goodsData"];
    NSArray *da = [goodsData componentsSeparatedByString:@","];
    int count = [da[0] intValue];
    float price = [da[1] floatValue];
    float tatol = count*price;
    NSString *to = [NSString stringWithFormat:@"总价 ¥%0.2f",tatol];
    self.cartView.countPriceLb.text = to;
}

//初始化View
-(void)initView{
    [self getCartView];
    [self getCartModel];
    [self getCartList];
    [self getUserDefaults];
    self.cartView.frame = self.view.bounds;
    [self.view addSubview:self.cartView];
    
    self.cartView.cartTbView.delegate = self;
    self.cartView.cartTbView.dataSource = self;
    self.cartView.cartTbView.separatorStyle = NO;
    self.cartModel.delegate = self;
    
    
}

//获取CartView
-(CartView*)getCartView{
    if(self.cartView==nil){
        self.cartView = [[CartView alloc] init];
    }
    return self.cartView;
}

-(CartModel*)getCartModel{
    if(self.cartModel==nil){
        self.cartModel = [[CartModel alloc] init];
    }
    return self.cartModel;
}

-(NSUserDefaults*)getUserDefaults{
    if(self.userDefaults==nil){
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self.userDefaults;
}

-(NSMutableArray*)getCartList{
    if(self.cartList==nil){
        self.cartList = [NSMutableArray array];
    }
    return self.cartList;
}

//设置头部
- (void)customContentView{
    UIColor *commonBlue = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"购物车";
}


//代理
- (void)getCartSuccess:(NSArray *) list{
    self.cartList = [NSMutableArray arrayWithArray:list];
    [self.cartView.cartTbView reloadData];
}

-(void)getCartFail:(NSString *) message{
    NSLog(@"加载失败");
}

#pragma mark tableView
//定义列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"CartCellIdentifiter";
    CartCell *cartCell= [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (cartCell == nil) {
        cartCell = [[CartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
        cartCell.delegate = self;
    }
    
    NSUInteger row = [indexPath row];
    if(row<self.cartList.count){
        if(_selectOk){
            CartData *cartData = [self.cartList objectAtIndex:row];
            BOOL a = [cartData.goodssec boolValue];
            if(a){
                [cartCell.checkBox setImage:[UIImage imageNamed:@"box_ck"] forState:UIControlStateNormal];
                NSInteger count = [cartCell.chooseCountView getCurrentCount];
                float price = [cartData.goodsprice floatValue];
                
                NSString *data = [NSString stringWithFormat:@"%ld,%f",(long)count,price];
                
                [self sendNofiction:data];
            }else{
                [cartCell.checkBox setImage:[UIImage imageNamed:@"box_no"] forState:UIControlStateNormal];
            }
        }else{
            CartData *cartData = [[CartData alloc] initWithDict:[self.cartList objectAtIndex:row]];

            [cartCell.cartImage sd_setImageWithURL:[NSURL URLWithString:cartData.goodsicon] placeholderImage:[UIImage imageNamed:@"user_default"]];
            cartCell.cartTitleLb.text = cartData.goodsdesc;
            cartCell.cartSkuLb.text = cartData.goodssku;
            
            NSString *good = [cartData.goodsprice stringValue];
            cartCell.cartSkuPriceLb.text = good;
            
            NSString *count = [cartData.goodscount stringValue];
            cartCell.chooseCountView.countTextField.text = count;
        }
    }
    return cartCell;
}

-(void)sendNofiction:(NSString *) data{
    NSDictionary *goodsDict = [NSDictionary dictionaryWithObject:data forKey:@"goodsData"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"goodsNofiction" object:nil userInfo:goodsDict];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cartList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifiter = @"CartCellIdentifiter";
    CartCell *cartCell= [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (cartCell == nil) {
        cartCell = [[CartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
    }
    
    NSUInteger row = [indexPath row];
    if(row<self.cartList.count){
        if(self.selectOk){
            CartData *cartData = [self.cartList objectAtIndex:row];
            if(cartData.goodssec){
                cartData.goodssec = [NSNumber numberWithBool:false];
            }else{
                cartData.goodssec = [NSNumber numberWithBool:true];
            }
            [self.cartList addObject:cartData];
        }else{
            CartData *cartData = [self.cartList objectAtIndex:row];
            if(cartData.goodssec){
                cartData.goodssec = [NSNumber numberWithBool:false];
            }else{
                cartData.goodssec = [NSNumber numberWithBool:true];
            }
            [self.cartList replaceObjectAtIndex:row withObject:cartData];
        }
    }
    
    self.selectOk = true;
    
    [self.cartView.cartTbView reloadData];
}

-(void)onCheckClick:(UIButton *)sender{
    if(sender.selected){
        NSLog(@"okokokok");
    }else{
        NSLog(@"KKKKK");
    }
}



@end
