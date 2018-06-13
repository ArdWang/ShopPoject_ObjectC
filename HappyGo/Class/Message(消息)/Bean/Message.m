//
//  Message.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "Message.h"

@implementation Message

+(NSDictionary*)mj_objectClassInArray{
    return @{@"messagedata":[MessageData class],};
}

@end
