//
//  Message.h
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "MessageData.h"

@interface Message : NSObject

@property(nonatomic,copy) NSString *code;

@property(nonatomic,copy) NSString *message;

@property(nonatomic,copy) NSArray *msgInfos;

+(NSDictionary*)mj_objectClassInArray;

@end
