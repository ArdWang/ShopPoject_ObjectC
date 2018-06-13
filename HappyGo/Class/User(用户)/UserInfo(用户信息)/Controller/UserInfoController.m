//
//  UserInfoController.m
//  HappyGo
//
//  Created by rnd on 2018/5/18.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "UserInfoController.h"

@interface UserInfoController ()<UserInfoViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UserInfoModelDelegate>

@property(nonatomic,strong) NSString *userId;
@property(nonatomic,strong) NSString *userSex;
@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *userPhone;
@property(nonatomic,strong) NSString *userSign;
@property(nonatomic,strong) NSString *userImg;

@property(nonatomic,strong) NSString *uploadImg;

@end

@implementation UserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
}

//加载界面的时候需要处理
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


-(void)initView{
    self.view.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#EAEAEA"];
    [self getUserInfoView];
    [self getUserInfoModel];
    self.userInfoView.delegate = self;
    self.userInfoView.frame = self.view.bounds;
    [self.view addSubview:self.userInfoView];
    self.userInfoModel.delegate = self;
}


-(void)initData{
    self.dateformatter = [[NSDateFormatter alloc] init];
    [self.dateformatter setDateFormat:@"YYYYMMddHHmmss"];
    [self getUserDefaults];
    
    self.userId = [self.userDefaults stringForKey:UD_USER_ID];
    self.userSex = [self.userDefaults stringForKey:UD_USER_SEX];
    self.userName = [self.userDefaults stringForKey:UD_USER_NAME];
    self.userImg = [self.userDefaults stringForKey:UD_USER_IMG];
    self.userSign = [self.userDefaults stringForKey:UD_USER_SIGN];
    self.userPhone = [self.userDefaults stringForKey:UD_USER_PHONE];
    
    //头像加载显示
    if([self.userImg isEqualToString:@""]||self.userImg==nil){
        self.userInfoView.userImgView.image = [UIImage imageNamed:@"default_user"];
    }else{
        [self.userInfoView.userImgView sd_setImageWithURL:[NSURL URLWithString:self.userImg] placeholderImage:[UIImage imageNamed:@"default_user"]];
    }
    
    //0是男 1是女
    int sex = [self.userSex intValue];
    UIColor *buttonColor = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    if(sex==0){
        [self.userInfoView.mManBtn.layer setBorderColor:buttonColor.CGColor];
        [self.userInfoView.mFalemanBtn.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.userInfoView.mFalemanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.userInfoView.mManBtn setTitleColor:buttonColor forState:UIControlStateNormal];
    }else{
        [self.userInfoView.mFalemanBtn.layer setBorderColor:buttonColor.CGColor];
        [self.userInfoView.mManBtn.layer setBorderColor:[UIColor grayColor].CGColor];
        [self.userInfoView.mFalemanBtn setTitleColor:buttonColor forState:UIControlStateNormal];
        [self.userInfoView.mManBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    self.userInfoView.mUserNameTF.text = self.userName;
    self.userInfoView.mUserPhoneLb.text = self.userPhone;
    self.userInfoView.mUserSignTF.text = self.userSign;
    
}

-(NSUserDefaults*)getUserDefaults{
    if(self.userDefaults==nil){
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self.userDefaults;
}

- (void)customContentView{
    UIColor *commonBlue = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    [self.navigationController.navigationBar setBarTintColor:commonBlue];
}

//重写右边的按钮
-(void)customNavigationRightItem{
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveOnClick)];
    save.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = save;
}


-(UserInfoView*)getUserInfoView{
    if(self.userInfoView==nil){
        self.userInfoView = [[UserInfoView alloc] init];
    }
    return self.userInfoView;
}

-(UserInfoModel*)getUserInfoModel{
    if(self.userInfoModel==nil){
        self.userInfoModel = [[UserInfoModel alloc] init];
    }
    return self.userInfoModel;
}

//点击保存按钮的时候需要
-(void)saveOnClick{
    //[self uploadImgQiuNiu];
    if(self.uploadImg!=nil&&![self.uploadImg isEqualToString:@""]){
        [self.userInfoModel editUser:self.userId userName:self.userInfoView.mUserNameTF.text userImage:self.uploadImg userSex:self.userSex userSign:self.userInfoView.mUserSignTF.text];
    }else{
         [self.userInfoModel editUser:self.userId userName:self.userInfoView.mUserNameTF.text userImage:self.userImg userSex:self.userSex userSign:self.userInfoView.mUserSignTF.text];
    }
}

-(void)onManClick{
    UIColor *buttonColor = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [self.userInfoView.mManBtn.layer setBorderColor:buttonColor.CGColor];
    [self.userInfoView.mManBtn setTitleColor:buttonColor forState:UIControlStateNormal];
    [self.userInfoView.mFalemanBtn.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.userInfoView.mFalemanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.userSex =@"0";
}

-(void)onFaleManClick{
    UIColor *buttonColor = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [self.userInfoView.mFalemanBtn.layer setBorderColor:buttonColor.CGColor];
    [self.userInfoView.mManBtn.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.userInfoView.mManBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.userInfoView.mFalemanBtn setTitleColor:buttonColor forState:UIControlStateNormal];
    self.userSex =@"1";
}

//上传照片到七牛
-(void)uploadImgQiuNiu{
    //华南
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        builder.zone = [QNFixedZone zone2];
    }];
    QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
    [upManager putFile:self.filePath key:nil token:self.userToken complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        if(info.ok)
        {
            NSLog(@"请求成功");
        }
        else{
            NSLog(@"失败");
            //如果失败，这里可以把info信息上报自己的服务器，便于后面分析上传错误原因
        }
        NSLog(@"info ===== %@", info);
        NSLog(@"resp ===== %@", resp);
        
        //第一种方法
        for(NSString *key in resp){
            NSString *value = [resp objectForKey:key];
            if([key isEqualToString:@"hash"]){
                self.uploadImg = [NSString stringWithFormat:@"http://p6yij445k.bkt.clouddn.com/%@",value];
            }
        }
    }
    option:nil];
}



//代理
-(void)onUserImageClick{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        NSLog(@"用户取消了操作");
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *picture = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            
        }
        pickerImage.delegate = self;
        pickerImage.allowsEditing = NO;
        
        [self presentViewController:pickerImage animated:YES completion:nil];
    }];
    [alertController addAction:cancle];
    [alertController addAction:camera];
    [alertController addAction:picture];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

//获取上传的token
-(void)getUserImgToken{
    [self.userInfoModel getUploadToken];
}


//获取Token成功的时候的代理
- (void)uploadTokenSuccess:(NSString*) data{
    [self.progress closeLoadingView];
    self.userToken = data;
    [self uploadImgQiuNiu];
}

-(void)uploadTokenFail:(NSString *) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
}


#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImageJPEGRepresentation(image, 0.1);
        }
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        self.currentDate = [NSDate date];
        NSString * locationtime=[self.dateformatter stringFromDate:self.currentDate];
        
        
        NSString * DocumentPath =[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //NSString *DocumentsPath = [NSString stringWithFormat:@"%@%@",locationtime,DocumentsPath];
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        NSString *fileImg = [NSString stringWithFormat:@"%@.png",locationtime];
        
        [fileManager createFileAtPath:[DocumentPath stringByAppendingString:fileImg] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        self.filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentPath,fileImg];
        
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:nil];
        
        //将获取的图片存储到用户的头像目录中
        self.userInfoView.userImgView.image = image;
        //上传图片到七牛
        [self getUserImgToken];
    }
}


//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//成功的时候
- (void)editUserSuccess:(UserData *) data{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:@"修改成功" intInterval:2];
    //存储用户的数据
    [[CommonUserDefaults sharedManager] saveUserData:data];
    UIViewController *target = nil;
    for (UIViewController * controller in self.navigationController.viewControllers) { //遍历
        if ([controller isKindOfClass:[MeController class]]) { //这里判断是否为你想要跳转的页面
            target = controller;
        }
    }
    if (target) {
        [self.navigationController popToViewController:target animated:YES]; //跳转
    }
}

-(void)editUserFail:(NSString *) message{
    [self.progress closeLoadingView];
    self.progress = [[MHProgress alloc] initWithType:MHPopViewTypeTips];
    [self.progress showTips:message intInterval:2];
}

@end

/*
  2018/5/18
  备注的代码块
     //自动加载图片的时候需要使用
     //创建一个选择后图片的小图标放在下方
     //类似微薄选择图后的效果
     //UIImageView *smallimage = [[UIImageView alloc] initWithFrame:
     //CGRectMake(50, 120, 40, 40)];
     //smallimage.image = image;
     //加在视图中
     //[self.view addSubview:smallimage];
 
 */
