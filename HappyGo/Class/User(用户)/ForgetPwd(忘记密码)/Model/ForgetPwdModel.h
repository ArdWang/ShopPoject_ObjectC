//
//  ForgetPwdModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetReqest.h"
#import "User.h"

@protocol ForgetPwdModelDelegate <NSObject>
//成功的时候
- (void)forgetPwdSuccess:(NSString*) message;

-(void)forgetPwdFail:(NSString *) message;

@end


@interface ForgetPwdModel : NSObject

@property(nonatomic,assign) id<ForgetPwdModelDelegate> delegate;

@property(nonatomic,strong) User *user;

-(void)forgetPwd:(NSString*)phone verifyCode:(NSString *)code;

@end
