//
//  MessageModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

-(void)getMsg:(NSString *)userid pageIndex:(NSString*)pageindex pageSize:(NSString *)pagesize{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@message/getMessage",baseUrl];
    NSDictionary *params = @{@"pageIndex":pageindex,
                             @"pageSize":pagesize
                             };
    
    [[AFNetReqest sharedInstance] setHeaderWithValue:userid  HeaderField:@"token"];
    
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.msg = [Message mj_objectWithKeyValues:responseObject];
        if([self.msg.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(getMsgSuccess:)]){
                [self.delegate getMsgSuccess:self.msg.msgInfos];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(getMsgFail:)]){
                [self.delegate getMsgFail:self.msg.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
        
    }];
    
}

//更新消息操作
-(void)updateMsg:(NSString *)userid msgId:(NSString *)msgid msgRead:(NSString *) msgread{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@message/updateMessage",baseUrl];
    NSDictionary *params = @{@"msgId":msgid,
                             @"msgRead":msgread,
                             };
    
    [[AFNetReqest sharedInstance] setHeaderWithValue:userid  HeaderField:@"token"];
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.msg = [Message mj_objectWithKeyValues:responseObject];
        if([self.msg.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(updateMsgSuccess:)]){
                [self.delegate updateMsgSuccess:self.msg.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}

-(void)deleteMsg:(NSString *)userid msgId:(NSString *)msgid{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@message/deleteMessage",baseUrl];
    NSDictionary *params = @{@"msgId":msgid
                             };
    
    [[AFNetReqest sharedInstance] setHeaderWithValue:userid  HeaderField:@"token"];
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:params Success:^(id  _Nullable responseObject){
        self.msg = [Message mj_objectWithKeyValues:responseObject];
        if([self.msg.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(deleteMsgSuccess:)]){
                [self.delegate deleteMsgSuccess:self.msg.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}


@end
