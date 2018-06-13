//
//  CartModel.h
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetReqest.h"
#import "Cart.h"

@protocol CartModelDelegate <NSObject>

//成功的时候
- (void)getCartSuccess:(NSArray *) list;

-(void)getCartFail:(NSString *) message;

@end

@interface CartModel : NSObject

@property(strong,nonatomic) Cart *cart;

@property(nonatomic,assign) id<CartModelDelegate> delegate;

-(void)getCart:(NSString *)userid;

@end
