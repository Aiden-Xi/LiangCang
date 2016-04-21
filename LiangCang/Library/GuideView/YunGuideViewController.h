//
//  YunGuideViewController.h
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAPageControl.h"

typedef enum {
    PageContolAlimentRight,   // 居右
    PageContolAlimentCenter   // 居中
} PageContolAliment;

typedef enum {
    PageContolStyleClassic,        // 系统自带经典样式
    PageContolStyleAnimated,       // 动画效果pagecontrol
    PageContolStyleNone            // 不显示pagecontrol
} PageContolStyle;

@protocol YunGuideViewControllerDelegate <NSObject>

- (void)YunGuideLoginButtonClick:(UIButton *)button;

- (void)YunGuideSignInButtonClick:(UIButton *)button;

@end

@interface YunGuideViewController : UIViewController

// 获取引导页图片数组
@property (nonatomic, strong) NSArray *imageNameArray;

// 是否显示分页控件
@property (nonatomic, assign) BOOL showPageControl;

// 分页控件小圆标大小
@property (nonatomic, assign) CGSize pageControlDotSize;

// 分页控件小圆标颜色
@property (nonatomic, strong) UIColor *dotColor;

// 分页控制器的样式
@property (nonatomic, assign) PageContolStyle pageStyle;

// 分页控制器的摆放位置
@property (nonatomic, assign) PageContolAliment pageAliment;

// 分页控制器
@property (nonatomic, weak) UIControl *pageControl;

// 代理
@property (nonatomic, assign) id <YunGuideViewControllerDelegate> delegate;

@end
