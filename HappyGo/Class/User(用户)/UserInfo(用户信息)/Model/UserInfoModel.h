//
//  UserInfoModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/18.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetReqest.h"
#import "User.h"
#import "Upload.h"
#import "AppConfig.h"

@protocol UserInfoModelDelegate <NSObject>
//成功的时候
- (void)uploadTokenSuccess:(NSString*) data;

-(void)uploadTokenFail:(NSString *) message;

//成功的时候
- (void)editUserSuccess:(UserData *) data;

-(void)editUserFail:(NSString *) message;

@end

@interface UserInfoModel : NSObject

@property(nonatomic,assign) id<UserInfoModelDelegate> delegate;

@property(strong,nonatomic) User *user;

@property(strong,nonatomic) Upload *upload;

//获取图片的token
-(void)getUploadToken;

//编辑用户信息
-(void)editUser:(NSString *) userid userName:(NSString*) username userImage:(NSString*) userimg userSex:(NSString *)sex userSign:(NSString *) sign;

@end
