//
//  ATChooseCountView.m
//  HappyGo
//
//  Created by rnd on 2018/6/13.
//  Copyright © 2018年 GoDream. All rights reserved.
//

#define ATLINECOLOR [UIColor colorWithRed:200.0/255.0f green:200.0/255.0f blue:200.0/255.0f alpha:1]

#import "ATChooseCountView.h"

@interface ATChooseCountView ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIButton *minusButton;


@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;

@property (nonatomic, assign) NSInteger currentCount;

@end

@implementation ATChooseCountView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configSubViews];
        
    }
    return self;
}

- (void)configSubViews {
    self.canEdit = YES;
    self.minCount = 1;
    self.maxCount = NSIntegerMax;
    self.currentCount = 1;
    self.minusButton.enabled = NO;
    
    self.layer.borderColor = ATLINECOLOR.CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 2.0f;
    
    [self addSubview:self.plusButton];
    [self addSubview:self.minusButton];
    [self addSubview:self.countTextField];
    [self addSubview:self.lineView1];
    [self addSubview:self.lineView2];
    
    NSArray *constraint_PlusButton_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_plusButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_plusButton)];
    NSArray *constraint_MinusButton_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_minusButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_minusButton)];
    NSArray *constraint_CountTextField_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_countTextField]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_countTextField)];
    NSArray *constraint_LineView1_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_lineView1]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_lineView1)];
    NSArray *constraint_LineView2_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_lineView2]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_lineView2)];
    
    NSArray *constriant_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_minusButton]-0-[_lineView1(==1)]-5-[_countTextField]-5-[_lineView2(==1)]-0-[_plusButton]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_plusButton, _minusButton, _countTextField, _lineView1, _lineView2)];
    NSLayoutConstraint *constraint_PlusButton_Width = [NSLayoutConstraint constraintWithItem:self.plusButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.2 constant:0];
    NSLayoutConstraint *constraint_MinusButton_Width = [NSLayoutConstraint constraintWithItem:self.minusButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.2 constant:0];
    
    [self addConstraints:constraint_PlusButton_V];
    [self addConstraints:constraint_MinusButton_V];
    [self addConstraints:constraint_CountTextField_V];
    [self addConstraints:constraint_LineView1_V];
    [self addConstraints:constraint_LineView2_V];
    [self addConstraints:constriant_H];
    [self addConstraint:constraint_PlusButton_Width];
    [self addConstraint:constraint_MinusButton_Width];
}

- (NSInteger)getCurrentCount {
    return _currentCount;
}

- (void)setCountColor:(UIColor *)countColor {
    _countColor = countColor;
    self.countTextField.textColor = countColor;
}

- (void)setCanEdit:(BOOL)canEdit {
    _canEdit = canEdit;
    self.countTextField.enabled = canEdit;
}

#pragma mark - Event

- (void)onClickPlusButton:(UIButton *)sender {
    if (self.countTextField.isFirstResponder) {
        [self.countTextField resignFirstResponder];
    }
    self.minusButton.enabled = YES;
    self.currentCount += 1;
    self.countTextField.text = [NSString stringWithFormat:@"%ld", (long)self.currentCount];
    if (self.currentCount >= self.maxCount) {
        self.plusButton.enabled = NO;
    }
}

- (void)onClickMinusButton:(UIButton *)sender {
    if (self.countTextField.isFirstResponder) {
        [self.countTextField resignFirstResponder];
    }
    self.plusButton.enabled = YES;
    self.currentCount -= 1;
    self.countTextField.text = [NSString stringWithFormat:@"%ld", (long)self.currentCount];
    if (self.currentCount <= self.minCount) {
        self.minusButton.enabled = NO;
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.currentCount = [textField.text integerValue];
}

#pragma mark - Init Views

- (UIButton *)plusButton {
    if (!_plusButton) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"add_dark"] forState:UIControlStateDisabled];
        [_plusButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_plusButton addTarget:self action:@selector(onClickPlusButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusButton;
}

- (UIButton *)minusButton {
    if (!_minusButton) {
        _minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_minusButton setImage:[UIImage imageNamed:@"jian"] forState:UIControlStateNormal];
        [_minusButton setImage:[UIImage imageNamed:@"jian_dark"] forState:UIControlStateDisabled];
        [_minusButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_minusButton addTarget:self action:@selector(onClickMinusButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _minusButton;
}

- (UITextField *)countTextField {
    if (!_countTextField) {
        _countTextField = [[UITextField alloc] init];
        [_countTextField setTextAlignment:NSTextAlignmentCenter];
        _countTextField.keyboardType = UIKeyboardTypeNumberPad;
        _countTextField.text = @"1";
        _countTextField.delegate = self;
        [_countTextField setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _countTextField;
}

- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] init];
        [_lineView1 setBackgroundColor:ATLINECOLOR];
        [_lineView1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _lineView1;
}

- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] init];
        [_lineView2 setBackgroundColor:ATLINECOLOR];
        [_lineView2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _lineView2;
}

@end

