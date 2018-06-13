//
//  CommonUtil.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonUtil : NSObject
//静态类
+(CommonUtil*)sharedManager;

//颜色转换
-(UIColor *) stringToColor:(NSString *)str;

@end
