//
//  User.h
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"
#import "MJExtension.h"

@interface User : NSObject

@property(strong,nonatomic) NSString *code;

@property(strong,nonatomic) NSString *message;

@property(strong,nonatomic) UserData *data;

@end
