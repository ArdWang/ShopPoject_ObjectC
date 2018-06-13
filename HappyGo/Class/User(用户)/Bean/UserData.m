//
//  UserData.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "UserData.h"

/*
 *  @property(strong,nonatomic) NSString *password;
 @property(strong,nonatomic) NSString *userimg;
 @property(strong,nonatomic) NSString *phone;
 @property(strong,nonatomic) NSString *email;
 @property(strong,nonatomic) NSString *sign;
 @property(strong,nonatomic) NSString *pushid;
 */

@implementation UserData

-(id)initWithDict:(NSDictionary*)dict{
     if(self = [super init]){
         self.userid = dict[@"userid"];
         self.username = dict[@"username"];
         self.phone = dict[@"phone"];
         self.email = dict[@"email"];
         self.sign = dict[@"sign"];
         self.pushid = dict[@"pushid"];
         self.sex = dict[@"sex"];
     }
    return self;
}

@end
