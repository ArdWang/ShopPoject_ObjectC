//
//  MessageController.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MessageController.h"

@interface MessageController ()<MessageModelDelegate,UITableViewDataSource, UITableViewDelegate>

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    [self setupRefresh];
}

-(void)initView{
    self.pageSize = 10;
    [self getMessageView];
    [self getMessageModel];
    [self getUserDefaults];
    [self getMsgList];
    self.msgView.mMsgTableView.delegate = self;
    self.msgView.mMsgTableView.dataSource = self;
    self.msgModel.delegate = self;
    self.msgView.frame = self.view.bounds;
    [self.view addSubview:self.msgView];
}

- (void)customContentView{
    UIColor *commonBlue = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";
}

-(MessageView*)getMessageView{
    if(self.msgView==nil){
        self.msgView = [[MessageView alloc] init];
    }
    return self.msgView;
}

-(MessageModel*)getMessageModel{
    if(self.msgModel==nil){
        self.msgModel = [[MessageModel alloc] init];
    }
    return self.msgModel;
}

-(NSUserDefaults*)getUserDefaults{
    if(self.userDefaults==nil){
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self.userDefaults;
}

-(NSMutableArray*)getMsgList{
    if(self.msgList==nil){
        self.msgList = [NSMutableArray array];
    }
    return self.msgList;
}

//加载界面的时候需要处理
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //加载数据
    [self getLoadData:self.pageSize];
}

/// 刷新加载数据
- (void)setupRefresh{
    __weak __typeof(self) weakSelf = self;
    // 上拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.msgView.mMsgTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadRefData];
    }];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.msgView.mMsgTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

/*
 刷新数据
 */
-(void)loadRefData{
    if(self.msgList.count>0){
        [self.msgList removeAllObjects];
    }
    //加载数据
    [self getLoadData:self.pageSize];
}

#pragma mark 上拉加载更多数据
- (void)loadMoreData{
    // 刷新数据
    self.pageSize=self.pageSize+5;
    //加载数据
    [self getLoadData:self.pageSize];
}

-(void)getLoadData:(int) pageSize{
    NSString *pagesize = [NSString stringWithFormat:@"%d",pageSize];
    self.userid = [self.userDefaults stringForKey:UD_USER_ID];
    if(self.userid!=nil){
        [self.msgModel getMsg:self.userid pageIndex:@"1" pageSize:pagesize];
    }
}

//所有的代理
- (void)getMsgSuccess:(NSArray *) list{
    self.msgList = [NSMutableArray arrayWithArray:list];
    [self.msgView.mMsgTableView reloadData];
    // 拿到当前的下拉刷新控件，结束刷新状态
    [self.msgView.mMsgTableView.mj_header endRefreshing];
    // 隐藏当前的上拉刷新控件
    [self.msgView.mMsgTableView.mj_footer endRefreshing];
}

-(void)getMsgFail:(NSString *) message{
    NSLog(@"加载失败");
}

#pragma mark tableView
#pragma mark tableView
//定义列的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiter = @"MessageCellIdentifiter";
    MessageCell *msgCell= [tableView dequeueReusableCellWithIdentifier:cellIdentifiter];
    if (msgCell == nil) {
        msgCell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiter];
    }
    NSUInteger row = [indexPath row];
    if(row<self.msgList.count){
        MessageData *msgData= [[MessageData alloc] initWithDict:[self.msgList objectAtIndex:row]];
        int msgread = [msgData.msgread intValue];
        if(msgread==0){
            msgCell.isRed.text = @"未读";
        }else{
            msgCell.isRed.text = @"已读";
        }
        
        //用户登录成功
        int msgtype = [msgData.msgtype intValue];
        
        if(msgtype==0){
            msgCell.mMsgImgV.image = [UIImage imageNamed:@"kf6"];
        }
        else if(msgtype==1){
            msgCell.mMsgImgV.image = [UIImage imageNamed:@"kf1"];
        }
        else if(msgtype==2){
            msgCell.mMsgImgV.image = [UIImage imageNamed:@"kf8"];
        }
        else if(msgtype==3){
            msgCell.mMsgImgV.image = [UIImage imageNamed:@"kf2"];
        }
        else if(msgtype==4){
            msgCell.mMsgImgV.image = [UIImage imageNamed:@"kf3"];
        }
        msgCell.mMsgTitleLb.text = msgData.msgtitle;
        msgCell.mMsgConLb.text = msgData.msgcon;
        msgCell.mMsgTimeLb.text = [self dateAndString:msgData.msgtime];
    }
    return msgCell;
}

//时间的转化
-(NSString *)longAndString:(NSNumber*)time{
    if(time!=nil){
        long a = [time longValue];
        NSDate *cdate = [NSDate dateWithTimeIntervalSince1970:a/1000];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
        
        return [dateFormatter stringFromDate:cdate];
    }
    return @"";
}

-(NSString*)dateAndString:(NSString*)date{
    if(date!=nil){
        //NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        //NSString* str = [numberFormatter stringFromNumber:date];
        NSString *strtime = [date stringByReplacingOccurrencesOfString:@"T" withString:@" "];
       return [self createAt:strtime];
    }
    return @"None";
}

-(NSString *)createAt:(NSString*)date1
{
    NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.000Z";
    NSDate *date = [formatter dateFromString:date1];
    NSDateFormatter *formatter1 =[[NSDateFormatter alloc]init];
    formatter1.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateStr =[formatter1 stringFromDate:date];
    return dateStr;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.msgList.count;
}

//在里面操作
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //MessageCell *msgCell = [self.msgView.mMsgTableView cellForRowAtIndexPath:indexPath];
    UITableViewRowAction *msgisred = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"标为已读" handler:^(UITableViewRowAction * action, NSIndexPath *indexPath) {
            NSUInteger row = [indexPath row];
            if(row<self.msgList.count){
                MessageData *msgData= [[MessageData alloc] initWithDict:[self.msgList objectAtIndex:row]];
                NSString *msgid = [NSString stringWithFormat:@"%d",[msgData.msgid intValue]];
            
                [self.msgModel updateMsg:self.userid msgId:msgid msgRead:@"1"];
            }
    }];
    
    UITableViewRowAction *msgdel = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * action, NSIndexPath *indexPath) {
            //执行删除操作
            //[self.msgList removeObjectAtIndex:indexPath.row];
            //[self.msgView.mMsgTableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
            [self createAreltDialog:indexPath];
        
    }];
    return @[msgdel,msgisred];
}

-(void)updateMsgSuccess:(NSString *)message{
    //重新加载数据
    [self getLoadData:self.pageSize];
}

-(void)createAreltDialog:(NSIndexPath*)indexPath{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"删除提示" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"用户取消了操作");
    }];
    
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSUInteger row = [indexPath row];
        if(row<self.msgList.count){
            MessageData *msgData= [[MessageData alloc] initWithDict:[self.msgList objectAtIndex:row]];
            NSString *msgid = [NSString stringWithFormat:@"%d",[msgData.msgid intValue]];
            [self.msgModel deleteMsg:self.userid msgId:msgid];
        }
    }];
    
    [alertController addAction:cancle];
    [alertController addAction:delete];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)deleteMsgSuccess:(NSString *)message{
    //重新加载数据
    [self getLoadData:self.pageSize];
}


@end
