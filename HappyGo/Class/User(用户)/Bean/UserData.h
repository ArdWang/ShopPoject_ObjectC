//
//  UserData.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject

@property(strong,nonatomic) NSNumber *userid;
@property(strong,nonatomic) NSString *username;
@property(strong,nonatomic) NSString *password;
@property(strong,nonatomic) NSString *userimg;
@property(strong,nonatomic) NSString *phone;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSString *sign;
@property(strong,nonatomic) NSString *pushid;
@property(strong,nonatomic) NSNumber *sex;

-(id)initWithDict:(NSDictionary*)dict;

@end
