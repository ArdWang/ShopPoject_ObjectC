//
//  LoginModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

-(void)getUser:(NSString *)phone getPwd:(NSString *)pwd{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@user/getUser",baseUrl];
    
    NSDictionary *params = @{@"phone":phone,
                             @"password":pwd,
                             @"pushid":@"1a0018970a8b42fe125"
                             };
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.user = [User mj_objectWithKeyValues:responseObject];
        if([self.user.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(getUserSuccess:)]){
                //NSLog(@"data %@",self.user.userData);
                [self.delegate getUserSuccess:self.user.data];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(getUserFail:)]){
                [self.delegate getUserFail:self.user.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
    
    
}



@end

/*
 //NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
 //NSLog(@"success--%@",str);
 
 */
