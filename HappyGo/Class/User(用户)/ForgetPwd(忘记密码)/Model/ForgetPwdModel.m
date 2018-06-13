//
//  ForgetPwdModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ForgetPwdModel.h"

@implementation ForgetPwdModel

//忘记密码
-(void)forgetPwd:(NSString*)phone verifyCode:(NSString *)code{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@user/forgetPwd",baseUrl];
    
    NSDictionary *params = @{@"mobile":phone,
                             @"verifyCode":code
                             };
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.user = [User mj_objectWithKeyValues:responseObject];
        if([self.user.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(forgetPwdSuccess:)]){
                [self.delegate forgetPwdSuccess:self.user.message];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(forgetPwdFail:)]){
                [self.delegate forgetPwdFail:self.user.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}


@end
