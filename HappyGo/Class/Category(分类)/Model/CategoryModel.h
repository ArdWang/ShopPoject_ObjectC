//
//  CategoryModel.h
//  HappyGo
//
//  Created by rnd on 2018/5/11.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AppConfig.h"
#import "MJExtension.h"
#import "CateP.h"
#import "CatePData.h"
#import "CateS.h"
#import "CateSData.h"
#import "AFNetReqest.h"

@protocol CategoryModelDelegate <NSObject>

//成功的时候
- (void)getCateSuccess:(NSArray *) list;
//失败的时候
-(void)getCateFail:(NSString *) message;
//错误的时候
-(void)getCateError:(NSString *) message;

- (void)getCateSuccessS:(NSArray *) list;

@end

@interface CategoryModel : NSObject

@property(nonatomic,assign) id<CategoryModelDelegate> delegate;

@property(strong,nonatomic) CateP *cateP;

@property(strong,nonatomic) CatePData *catePdata;

@property(strong,nonatomic) CateS *cateS;

@property(strong,nonatomic) CateSData *cateSdata;


-(void)getCatepGoryp;

-(void)getCatepGorys:(NSString *) categoryId;

@end
