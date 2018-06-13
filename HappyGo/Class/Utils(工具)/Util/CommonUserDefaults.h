//
//  CommonUserDefaults.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppConfig.h"
#import "UserData.h"

@interface CommonUserDefaults : NSObject

@property (strong,nonatomic) NSUserDefaults *userDefaults;

///方法区块--------------
+(CommonUserDefaults*)sharedManager;

/*
 存储用户的对象数据
 可以存储为空的值
 */
-(void)saveUserData:(UserData *)userData;



@end
