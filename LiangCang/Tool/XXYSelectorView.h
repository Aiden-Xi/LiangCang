//
//  XXYSelectorView.h
//  LiangCang
//
//  Created by xxy on 16/1/28.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XXYSelectorViewDelegate <NSObject>

- (void)XXYSelectorViewClickFrom:(UIButton *)fromButton To:(UIButton *)ToButton;

@end

@interface XXYSelectorView : UIView

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, assign) NSInteger defaultSelect;
@property (nonatomic, weak) UIColor *titleSelectColor;
@property (nonatomic, weak) UIColor *titleDefaultColor;
@property (nonatomic, weak) UIColor *lineColor;
@property (nonatomic, strong) UIButton *selectButton;

@property (nonatomic, weak) id<XXYSelectorViewDelegate> delegate ;

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)array defaultSelect:(NSInteger)defaultSelect backGroudColor:(UIColor *)color lineColor:(UIColor *)lineColor;

@end
