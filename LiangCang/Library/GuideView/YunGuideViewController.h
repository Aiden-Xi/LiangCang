//
//  YunGuideViewController.h
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunGuideView.h"
#import "BaseTabBarController.h"

typedef NS_ENUM(NSInteger, GuideType) {
    FullScreen      ,     //!<   全屏显示
    UpAndDown             //!<   上下布局
};

@protocol YunGuideViewControllerDelegate <NSObject>

- (void)YunGuideLoginButtonClick:(UIButton *)button controller:(id *)controller;

- (void)YunGuideSignInButtonClick:(UIButton *)button controller:(id *)controller;

@end

@interface YunGuideViewController : UIViewController

/**
 *  项目使用的tabBarController
 */
@property (nonatomic, strong) BaseTabBarController *tabbarController;

/**
 *  引导页图片空间
 */
@property (nonatomic, strong) UIImageView *guideImageView;

/**
 *  引导页样式
 */
@property (nonatomic, assign) GuideType guideType;

/**
 *  获取引导页图片数组名称
 *
 *  @param imageNameArray 图片名称数组
 */
- (void)getGuideImageNameArray:(NSArray *)imageNameArray;

/**
 *  图片裁剪
 *
 *  @param rect 裁剪的尺寸
 */
-(UIImage*)getSubImage:(CGRect)rect image:(UIImage *)image;

@end
