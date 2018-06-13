//
//  RegisterModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "AFNetReqest.h"
#import "User.h"

@protocol RegisterModelDelegate <NSObject>
//成功的时候
- (void)regUserSuccess:(NSString*) message;

-(void)regUserFail:(NSString *) message;

@end

@interface RegisterModel : NSObject

@property(nonatomic,assign) id<RegisterModelDelegate> delegate;

@property(nonatomic,strong) User *user;

-(void)regUser:(NSString *)phone passWord:(NSString*)password verifyCode:(NSString*)verifycode;

@end
