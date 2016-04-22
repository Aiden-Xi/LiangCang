//
//  BaseTabBarController.m
//  LiangCang
//
//  Created by Mr.Xi on 16/1/28.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "BaseTabBarController.h"

@implementation BaseTabBarController

- (void)viewDidLoad {
    // 设置tabbar背景颜色为黑色
    self.tabBar.barTintColor=kDefaultBlackColor;
    
    // 去除tabbar的模糊效果
    self.tabBar.translucent = NO;
    
    NSArray *selectImageName = @[@"shop_tab_select", @"magazine_tab_select", @"share_tab_select", @"talent_tab_select", @"personal_tab_select"];
    NSArray *imageName =  @[@"shop_tab", @"magazine_tab", @"share_tab", @"talent_tab", @"personal_tab"];
    
    NSArray *titleName = @[@"商店", @"杂志", @"分享", @"达人", @"个人"];
    
    NSArray *viewControllers = self.viewControllers;
    
    for (NSInteger i = 0; i < viewControllers.count; i++) {
        UIViewController *viewController = viewControllers[i];
        
        UIImage * tabImage = [[UIImage imageNamed:imageName[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * tabSelectImage = [[UIImage imageNamed:selectImageName[i]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [viewController.tabBarItem setImage:tabImage];
        [viewController.tabBarItem setSelectedImage:tabSelectImage];
        viewController.tabBarItem.title = titleName[i];

        // 设置状态栏的整体偏移量 水平方向和垂直方向
        // [viewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];

        [viewController.tabBarItem
            setTitleTextAttributes:[NSDictionary
                                       dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],
                                                                    NSForegroundColorAttributeName,
                                                                    kFontSizeFamily(14),
                                                                    NSFontAttributeName, nil]
                          forState:UIControlStateNormal];

        [viewController.tabBarItem
            setTitleTextAttributes:
                [NSDictionary
                    dictionaryWithObjectsAndKeys:kDefaultWhiteColor, NSForegroundColorAttributeName,
                                                 kFontSizeFamily(14), NSFontAttributeName, nil]
                          forState:UIControlStateSelected];
    }
}

@end
