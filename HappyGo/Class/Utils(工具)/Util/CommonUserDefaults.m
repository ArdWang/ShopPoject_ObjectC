//
//  CommonUserDefaults.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CommonUserDefaults.h"

@implementation CommonUserDefaults

static CommonUserDefaults *sharedSingleton = nil;
/*
     单列模式给外部调用
 */
+(CommonUserDefaults*)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedSingleton = [[self alloc] init];
    });
    
    return sharedSingleton;
}

-(instancetype)init{
    self = [super init];
    if(self){
        self.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

/*
     存储用户的对象数据
     可以存储为空的值
 */
-(void)saveUserData:(UserData *)userData{
    if(userData!=nil){
        [self.userDefaults setValue:userData.userid forKey:UD_USER_ID];
        [self.userDefaults setValue:userData.username forKey:UD_USER_NAME];
        [self.userDefaults setValue:userData.password forKey:UD_USER_PWD];
        [self.userDefaults setValue:userData.userimg forKey:UD_USER_IMG];
        [self.userDefaults setValue:userData.phone forKey:UD_USER_PHONE];
        [self.userDefaults setValue:userData.email forKey:UD_USER_EMAIL];
        [self.userDefaults setValue:userData.sign forKey:UD_USER_SIGN];
        [self.userDefaults setValue:userData.pushid forKey:UD_USER_PUSHID];
        [self.userDefaults setValue:userData.sex forKey:UD_USER_SEX];
    }else{
        [self.userDefaults setValue:nil forKey:UD_USER_ID];
        [self.userDefaults setValue:nil forKey:UD_USER_SEX];
        [self.userDefaults setValue:nil forKey:UD_USER_NAME];
        [self.userDefaults setValue:nil forKey:UD_USER_PWD];
        [self.userDefaults setValue:nil forKey:UD_USER_IMG];
        [self.userDefaults setValue:nil forKey:UD_USER_PHONE];
        [self.userDefaults setValue:nil forKey:UD_USER_EMAIL];
        [self.userDefaults setValue:nil forKey:UD_USER_SIGN];
        [self.userDefaults setValue:nil forKey:UD_USER_PUSHID];
    }
}

/*
     得到存储的用户数据
     没有的时候输出为空的值
 */
-(UserData *)getUserData{
    UserData *userData = [self.userDefaults objectForKey:UD_USER_DATA];
    if(userData!=nil){
        return userData;
    }
    return nil;
}


@end
