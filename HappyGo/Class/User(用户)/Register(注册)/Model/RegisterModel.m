//
//  RegisterModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "RegisterModel.h"

@implementation RegisterModel

-(void)regUser:(NSString *)phone passWord:(NSString*)password verifyCode:(NSString*)verifycode{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@user/regUser",baseUrl];
    
    NSDictionary *params = @{@"mobile":phone,
                             @"password":password,
                             @"verifyCode":verifycode
                             };
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.user = [User mj_objectWithKeyValues:responseObject];
        if([self.user.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(regUserSuccess:)]){
                [self.delegate regUserSuccess:self.user.message];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(regUserFail:)]){
                [self.delegate regUserFail:self.user.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
    
}



@end
