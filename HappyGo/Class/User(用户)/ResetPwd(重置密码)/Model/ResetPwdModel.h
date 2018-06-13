//
//  ResetPwdModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/17.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetReqest.h"
#import "User.h"

@protocol ResetPwdModelDelegate <NSObject>
//成功的时候
- (void)resetPwdSuccess:(NSString*) message;

-(void)resetPwdFail:(NSString *) message;

@end

@interface ResetPwdModel : NSObject

@property(nonatomic,assign) id<ResetPwdModelDelegate> delegate;

@property(strong,nonatomic) User *user;

-(void)resetPwd:(NSString*)phone passWord:(NSString*)pwd;

@end
