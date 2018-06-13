//
//  CommonUtil.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil

static CommonUtil *sharedSingleton = nil;

/*
     单列模式给外部调用
 */
+(CommonUtil*)sharedManager{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedSingleton = [[self alloc] init];
    });
    return sharedSingleton;
}

/*
 * 字符串转为颜色值
 */
- (UIColor *) stringToColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}


@end
