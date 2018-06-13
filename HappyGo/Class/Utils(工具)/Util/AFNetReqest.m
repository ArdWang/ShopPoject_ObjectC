//
//  AFNetReqest.m
//  HappyGo
//
//  Created by rnd on 2018/5/15.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "AFNetReqest.h"

@implementation AFNetReqest

//创建单例
+ (instancetype _Nullable)sharedInstance
{
    static AFNetReqest *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AFNetReqest alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.manager = [AFHTTPSessionManager new];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL] sessionConfiguration:configuration];
        
        //设置请求参数的类型:JSON
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //设置服务器返回结果的类型:JSON (AFJSONResponseSerializer,AFHTTPResponseSerializer)
        self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //设置请求的超时时间
        self.manager.requestSerializer.timeoutInterval = 40.0f;
        //设置ContentType
        NSSet *currentAcceptSet = self.manager.responseSerializer.acceptableContentTypes;
        NSMutableSet *mset = [NSMutableSet setWithSet:currentAcceptSet];
        [mset addObject:@"text/html"];
    }
    return self;
}

- (void)setHeaderWithValue:(NSString *)value HeaderField:(NSString *)field
{
    [self.manager.requestSerializer setValue:value forHTTPHeaderField:field];
}

//GET请求
- (void)GET:(NSString * _Nonnull)url
 Parameters:(nullable id)parameters
    Success:(SuccessBlock _Nullable )successBlock
    Failure:(FailedBlock _Nullable )failedBlock
     Cookie:(CookieBlock _Nullable )cookieBlock
{
    [self GET:url Parameters:parameters Success:successBlock Failed:failedBlock Cookie:cookieBlock];
}

//POST请求
- (void)POST:(NSString * _Nonnull)url
  Parameters:(nullable id)parameters
     Success:(SuccessBlock _Nullable )successBlock
     Failure:(FailedBlock _Nullable )failedBlock
      Cookie:(CookieBlock _Nullable )cookieBlock
{
    [self POST:url Parameters:parameters Success:successBlock Failed:failedBlock Cookie:cookieBlock];
}

//get请求
- (void)GET:(NSString *)url Parameters:(id)parameters Success:(SuccessBlock)successBlock Failed:(FailedBlock)failedBlock Cookie:(CookieBlock)cookieBlock
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (successBlock) {
            successBlock(responseObject);
        }
        if (cookieBlock) {
            cookieBlock(task);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failedBlock) {
            failedBlock(error);
        }
    }];
}

//post请求
- (void)POST:(NSString *)url Parameters:(id)parameters Success:(SuccessBlock)successBlock Failed:(FailedBlock)failedBlock Cookie:(CookieBlock)cookieBlock
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (successBlock) {
            successBlock(responseObject);
        }
        if (cookieBlock) {
            cookieBlock(task);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failedBlock) {
            failedBlock(error);
        }
    }];
}




@end
