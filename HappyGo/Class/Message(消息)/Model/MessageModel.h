//
//  MessageModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetReqest.h"
#import "Message.h"

@protocol MessageModelDelegate <NSObject>
//成功的时候
- (void)getMsgSuccess:(NSArray *) list;

-(void)getMsgFail:(NSString *) message;

-(void)updateMsgSuccess:(NSString *)message;

-(void)deleteMsgSuccess:(NSString *)message;

@end

@interface MessageModel : NSObject

@property(nonatomic,assign) id<MessageModelDelegate> delegate;

@property(strong,nonatomic) Message *msg;

@property(strong,nonatomic) NSUserDefaults *userDefaults;

-(void)getMsg:(NSString *)userid pageIndex:(NSString*)pageindex pageSize:(NSString *)pagesize;

-(void)updateMsg:(NSString *)userid msgId:(NSString *)msgid msgRead:(NSString *) msgread;

-(void)deleteMsg:(NSString *)userid msgId:(NSString *)msgid;

@end
