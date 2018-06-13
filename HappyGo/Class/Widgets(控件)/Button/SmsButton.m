//
//  SmsButton.m
//  HappyGo
//
//  Created by rnd on 2018/5/16.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "SmsButton.h"

@implementation SmsButton{
    NSTimeInterval timeInterval;
    UIButton *smsButton;
    NSString *authTitle;
    NSTimer *timer;
    BOOL isFired;
}

+ (instancetype)sharedSmsBHandle{
    static dispatch_once_t onceToken;
    static SmsButton *handle;
    
    dispatch_once(&onceToken, ^{
        handle = [[SmsButton alloc] init];
    });
    return handle;
}

- (UIButton *)title:(NSString *)title{
    [[SmsButton sharedSmsBHandle] timeInterval];
    smsButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    if ([[SmsButton sharedSmsBHandle] timeInterval] < 59) {
        [[SmsButton sharedSmsBHandle] startTimer];
    }else{
        [smsButton setTitle:title forState:(UIControlStateNormal)];
    }
    [[SmsButton sharedSmsBHandle] authTitle:title];
    UIColor *color = [[CommonUtil sharedManager] stringToColor:@"#03a9f4"];
    [smsButton setTitleColor:color forState:(UIControlStateNormal)];
    return smsButton;
}

- (NSString *)authTitle:(NSString *)title{
    if (!authTitle) {
        authTitle = title;
    }
    return authTitle;
}

- (NSTimeInterval)timeInterval{
    if (!timeInterval) {
        timeInterval = 59;
    }
    return timeInterval;
}

- (NSTimer *)timer{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [timer setFireDate:[NSDate distantFuture]];
    }
    return timer;
}

#pragma mark - Timer Action
- (void)timerAction{
    if (timeInterval >= 1) {
        //[smsButton setTitle:[authTitle stringByAppendingString:[NSString stringWithFormat:@"（%@）",@(timeInterval--)]] forState:UIControlStateNormal];
        [smsButton setTitle:[@"剩余" stringByAppendingString:[NSString stringWithFormat:@"(%@)",@(timeInterval--)]] forState:UIControlStateNormal];
        smsButton.backgroundColor = [UIColor whiteColor];
        smsButton.userInteractionEnabled = NO;
    }else{
        [self stopTimer];
        timeInterval = 59;
        authTitle = @"重新发送";
        smsButton.backgroundColor = [[CommonUtil sharedManager] stringToColor:@"#FFFFFF"];
        [smsButton setTitle:authTitle forState:UIControlStateNormal];
        smsButton.userInteractionEnabled = YES;
    }
}

#pragma mark - Private Method
- (void)startTimer{
    isFired = YES;
    [self.timer setFireDate:[NSDate date]];
}

- (void)stopTimer{
    if (timer) {
        [timer setFireDate:[NSDate distantFuture]];
        isFired = NO;
    }
}

- (void)endTimer{
    if (timer) {
        timeInterval = 59;
        isFired = NO;
        [timer invalidate];
        timer = nil;
    }
}

@end

