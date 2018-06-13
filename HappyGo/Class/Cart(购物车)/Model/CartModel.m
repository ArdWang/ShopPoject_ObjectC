//
//  CartModel.m
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import "CartModel.h"

@implementation CartModel

-(void)getCart:(NSString *)userid{
    NSString *baseUrl = BASE_URL;
    NSString *strUrl = [NSString stringWithFormat:@"%@cart/getCart",baseUrl];
    [[AFNetReqest sharedInstance] setHeaderWithValue:userid  HeaderField:@"token"];
    
    [[AFNetReqest sharedInstance] POST:strUrl Parameters:nil Success:^(id  _Nullable responseObject){
        self.cart = [Cart mj_objectWithKeyValues:responseObject];
        if([self.cart.code isEqual:@"200"]){
            if([self.delegate respondsToSelector:@selector(getCartSuccess:)]){
                [self.delegate getCartSuccess:self.cart.cartGoods];
            }
        }else{
            if([self.delegate respondsToSelector:@selector(getCartFail:)]){
                [self.delegate getCartFail:self.cart.message];
            }
        }
    } Failure:^(NSError * _Nonnull error){
        //打印错误
        NSLog(@"failure--%@",error.localizedDescription);
    } Cookie:^(NSURLSessionDataTask * _Nullable task){
    }];
}


@end
