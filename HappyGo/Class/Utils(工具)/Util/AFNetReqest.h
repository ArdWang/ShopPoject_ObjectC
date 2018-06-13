//
//  AFNetReqest.h
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AppConfig.h"

typedef void(^SuccessBlock)(id _Nullable responseObject);
typedef void(^FailedBlock )(NSError * _Nonnull error);
typedef void(^CookieBlock )(NSURLSessionDataTask * _Nullable task);

@interface AFNetReqest : NSObject

@property(nonatomic,strong)AFHTTPSessionManager * _Nullable manager;

// 单例
+ (instancetype _Nullable)sharedInstance;


/**
 *  设置请求头
 */
- (void)setHeaderWithValue:(NSString *_Nullable)value HeaderField:(NSString *_Nullable)field;

/**
 *  GET请求
 *
 *  @param url           基本url
 *  @param parameters    参数字典
 *  @param successBlock  成功的回调
 *  @param failedBlock   失败的回调
 *  @param cookieBlock   cookie
 *
 */
- (void)GET:(NSString * _Nonnull)url
 Parameters:(nullable id)parameters
    Success:(SuccessBlock _Nullable )successBlock
    Failure:(FailedBlock _Nullable )failedBlock
     Cookie:(CookieBlock _Nullable )cookieBlock;

/**
 *  POST请求
 *
 *  @param url           基本url
 *  @param parameters    参数字典
 *  @param successBlock  成功的回调
 *  @param failedBlock   失败的回调
 *  @param cookieBlock   cookie
 *
 */

- (void)POST:(NSString * _Nonnull)url
  Parameters:(nullable id)parameters
     Success:(SuccessBlock _Nullable )successBlock
     Failure:(FailedBlock _Nullable )failedBlock
      Cookie:(CookieBlock _Nullable )cookieBlock;



@end
