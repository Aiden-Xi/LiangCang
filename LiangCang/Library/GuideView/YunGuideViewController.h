//
//  YunGuideViewController.h
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabBarController.h"

#define kAppDelegate                        (AppDelegate *)[UIApplication sharedApplication].delegate
#define kUserDefaults                       [NSUserDefaults standardUserDefaults]
#define kScreenBounds                       ([[UIScreen mainScreen] bounds])
#define kScreenWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight                       ([[UIScreen mainScreen] bounds].size.height)

typedef NS_ENUM(NSInteger, GuideType) {
    FullScreen,           //!<   全屏显示
    UpAndDown             //!<   上下布局
};

@protocol YunGuideViewControllerDelegate <NSObject>

- (void)YunGuideLoginButtonClick:(UIButton *)button controller:(id *)controller;

- (void)YunGuideSignInButtonClick:(UIButton *)button controller:(id *)controller;

@end

@interface YunGuideViewController : UIViewController

/**
 *  引导页样式
 */
@property (nonatomic, assign) GuideType guideType;

/**
 *  按钮颜色
 */
@property (nonatomic, strong) UIColor *loginSignButtonColor;

/**
 *  获取引导页图片数组
 */
@property (nonatomic, strong) NSArray *imageNameArray;

@end
