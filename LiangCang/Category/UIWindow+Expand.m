//
//  UIWindow+Expand.m
//  LiangCang
//
//  Created by xxy on 16/1/25.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UIWindow+Expand.h"
#import "LaunchViewController.h"

@implementation UIWindow (Expand)

- (void)showLanuchPageAndSetUmeng {
    
    LaunchViewController *launchVC = [[LaunchViewController alloc] init];
    
    [self addSubview:launchVC.view];
}

@end
