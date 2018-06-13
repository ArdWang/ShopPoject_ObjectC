//
//  ATChooseCountView.h
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATChooseCountView : UIView

@property (nonatomic, strong) UIColor *countColor;
@property (nonatomic, assign) BOOL canEdit;

@property (nonatomic, assign) NSInteger minCount;
@property (nonatomic, assign) NSInteger maxCount;

@property (nonatomic, strong) UITextField *countTextField;

- (NSInteger)getCurrentCount;

@end
