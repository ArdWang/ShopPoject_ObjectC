//
//  MessageData.h
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageData : NSObject

@property(nonatomic,copy) NSNumber *msgid;
@property(nonatomic,copy) NSNumber *userid;
@property(nonatomic,copy) NSNumber *msgtype;
@property(nonatomic,copy) NSString *msgtitle;
@property(nonatomic,copy) NSString *msgcon;
@property(nonatomic,copy) NSString *msgimg;
@property(nonatomic,copy) NSString *msgtime;
@property(nonatomic,copy) NSNumber *msgread;

-(id)initWithDict:(NSDictionary*)dict;

@end
