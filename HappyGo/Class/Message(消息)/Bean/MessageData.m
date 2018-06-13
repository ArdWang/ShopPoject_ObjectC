//
//  MessageData.m
//  HappyGo
//
//  Created by rnd on 2018/5/21.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "MessageData.h"

@implementation MessageData

-(id)initWithDict:(NSDictionary*)dict{
    
    if(self = [super init]){
        self.msgid = dict[@"msgid"];
        self.userid = dict[@"userid"];
        self.msgtype = dict[@"msgtype"];
        self.msgtitle = dict[@"msgtitle"];
        self.msgcon = dict[@"msgcon"];
        self.msgtime = dict[@"msgtime"];
        self.msgimg = dict[@"msgimg"];
        self.msgread = dict[@"msgread"];
    }
    return self;
}
@end
