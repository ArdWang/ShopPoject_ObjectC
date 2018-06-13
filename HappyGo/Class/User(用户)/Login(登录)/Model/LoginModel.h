//
//  LoginModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetReqest.h"
#import "MJExtension.h"
#import "User.h"

@protocol LoginModelDelegate <NSObject>
//成功的时候
- (void)getUserSuccess:(UserData *) data;

-(void)getUserFail:(NSString *) message;

@end

@interface LoginModel : NSObject

@property(nonatomic,assign) id<LoginModelDelegate> delegate;

-(void)getUser:(NSString *)phone getPwd:(NSString *)pwd;

@property(strong,nonatomic) User *user;

@end
