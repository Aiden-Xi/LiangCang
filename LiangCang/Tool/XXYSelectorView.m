//
//  XXYSelectorView.m
//  LiangCang
//
//  Created by xxy on 16/1/28.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "XXYSelectorView.h"

@implementation XXYSelectorView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)array defaultSelect:(NSInteger)defaultSelect backGroudColor:(UIColor *)color lineColor:(UIColor *)lineColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color;
        self.titleArray = array;
        self.defaultSelect = defaultSelect;
        self.lineColor = lineColor;
        
        XXYLog(@"%@", _titleArray);
        XXYLog(@"%ld", self.defaultSelect);
        
        CGFloat buttonWidth = frame.size.width / self.titleArray.count;
        CGFloat buttonHeight = frame.size.height - 5;
        for (NSInteger i = 0; i < self.titleArray.count; i++) {
            CGFloat buttonX = 0 + buttonWidth * i;
            CGFloat buttonY = 5;
            
            // 添加按钮
            UIButton *selectButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
            
            selectButton.tag = i + 1;
            selectButton.titleLabel.font = [UIFont systemFontOfSize:14];
            
            [selectButton setTitleColor:_titleDefaultColor forState:UIControlStateNormal];
            [selectButton setTitleColor:_titleSelectColor forState:UIControlStateSelected];
            
            [selectButton setTitle:_titleArray[i] forState:UIControlStateNormal];
            
            [selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i == _defaultSelect) {
                selectButton.selected = YES;
                
                selectButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
                
                self.selectButton = selectButton;
            }
            
            [self addSubview:selectButton];
            
            // 添加下部划线
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(buttonX + 10, CGRectGetHeight(self.frame) - 3, buttonWidth - 20, 2)];
            
            lineView.tag = 10 * (i+1);
            lineView.backgroundColor = _lineColor;
            lineView.hidden = YES;
            if (i == _defaultSelect) {
                lineView.hidden = NO;
            }
            
            [self addSubview:lineView];
        }
    }
    
    return self;
}

- (void)selectButtonAction:(UIButton *)sender {
    if (_selectButton.tag == sender.tag) return;
    
    // 将上级的选中按钮和选中下划线隐藏
    UIButton *button = (UIButton *)_selectButton;
    
    button.selected = NO;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *lineView = (UIView *)[self viewWithTag:button.tag * 10];
    lineView.hidden = YES;
    
    // 设置选中的按钮和下划线
    _selectButton = sender;
    sender.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    UIView *currentLine = (UIView *)[self viewWithTag:_selectButton.tag * 10];
    currentLine.hidden = NO;
    
    if ([self.delegate respondsToSelector:@selector(XXYSelectorViewClickFrom:To:)]) {
        [self.delegate XXYSelectorViewClickFrom:button To:sender];
    }
}

- (UIColor *)titleSelectColor {
    if (_titleSelectColor == nil) {
        _titleSelectColor = [UIColor whiteColor];
    }
    
    return _titleSelectColor;
}

- (UIColor *)titleDefaultColor {
    if (_titleDefaultColor == nil) {
        _titleDefaultColor = [UIColor grayColor];
    }
    
    return _titleDefaultColor;
}

- (UIColor *)lineColor {
    if (_lineColor == nil) {
        _lineColor = [UIColor whiteColor];
    }
    
    return _lineColor;
}

@end
