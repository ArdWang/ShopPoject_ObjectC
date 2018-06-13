//
//  CategoryModel.m
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

-(void)getCatepGoryp{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@cate/getCateGoryp",baseUrl];
    //设置头部
    [[AFNetReqest sharedInstance] setHeaderWithValue:@"1" HeaderField:@"token"];
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:nil Success:^(id  _Nullable responseObject){
        self.cateP = [CateP mj_objectWithKeyValues:responseObject];
        if([self.cateP.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(getCateSuccess:)]){
                [self.delegate getCateSuccess:self.cateP.data];
            }
        }else{
            if([_delegate respondsToSelector:@selector(getCateFail:)]){
                [_delegate getCateFail:self.cateP.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}

-(void)getCatepGorys:(NSString*) categoryId{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@cate/getCateGorys",baseUrl];
    NSDictionary *dict = @{@"categoryId":categoryId};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:strUrl parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.cateS = [CateS mj_objectWithKeyValues:responseObject];
        if([self.cateS.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(getCateSuccessS:)]){
                [self.delegate getCateSuccessS:self.cateS.cateGorys];
            }
        }
        
    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
       
    }];
    
    
    
    
}


/**
 
 [[AFNetReqest sharedInstance] POST:strUrl Parameters:nil Success:^(id  _Nullable responseObject){
 
 } Failure:^(NSError * _Nonnull error){
 //打印错误
 NSLog(@"failure--%@",error.localizedDescription);
 } Cookie:^(NSURLSessionDataTask * _Nullable task){
 
 }];
 
 */



@end
