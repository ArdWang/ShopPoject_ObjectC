//
//  ResetPwdModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/17.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "ResetPwdModel.h"

@implementation ResetPwdModel

-(void)resetPwd:(NSString*)phone passWord:(NSString*)pwd{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@user/resetPwd",baseUrl];
    
    NSDictionary *params = @{@"mobile":phone,
                             @"password":pwd
                             };
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.user = [User mj_objectWithKeyValues:responseObject];
        if([self.user.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(resetPwdSuccess:)]){
                [self.delegate resetPwdSuccess:self.user.message];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(resetPwdFail:)]){
                [self.delegate resetPwdFail:self.user.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}

@end


