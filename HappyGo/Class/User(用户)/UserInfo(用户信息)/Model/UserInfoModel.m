//
//  UserInfoModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/18.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "UserInfoModel.h"


@implementation UserInfoModel

/*
     获取上传的Token
 */
-(void)getUploadToken{
    
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@common/getUploadToken",baseUrl];
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:nil Success:^(id  _Nullable responseObject){
        self.upload = [Upload mj_objectWithKeyValues:responseObject];
        if([self.upload.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(uploadTokenSuccess:)]){
                [self.delegate uploadTokenSuccess:self.upload.data];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(uploadTokenFail:)]){
                [self.delegate uploadTokenFail:self.upload.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}

/*
     编辑用户信息
 */
-(void)editUser:(NSString *) userid userName:(NSString*) username userImage:(NSString*) userimg userSex:(NSString *)sex userSign:(NSString *) sign{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@user/editUser",baseUrl];
    NSDictionary *params = @{@"userid":userid,
                             @"username":username,
                             @"userimg":userimg,
                             @"sign":sign,
                             @"sex":sex
                             };
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.user = [User mj_objectWithKeyValues:responseObject];
        if([self.user.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(editUserSuccess:)]){
                [self.delegate editUserSuccess:self.user.data];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(editUserFail:)]){
                [self.delegate editUserFail:self.user.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
        
    }];
}


@end
