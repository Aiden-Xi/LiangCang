//
//  SLideZoomMenuController.h
//  SlideZoomMenuDemo
//
//  Created by renxiaojian on 15/3/16.
//  Copyright (c) 2015年 renxiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLideZoomMenuController : UIViewController

@property(nonatomic, strong) UIViewController *leftViewController;
@property(nonatomic, strong) UIViewController *rootViewController;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

// 用来判断选择了那个页面，进行跳转，并且根据跳转的页面不同，设置的值也不同
@property (nonatomic,assign) int  selCount;

- (id)initWithRootController:(UIViewController *)rootViewController;


@end

