//
//  ShareViewController.m
//  LiangCang
//
//  Created by xxy on 16/2/2.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController () <UITabBarControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *leftSlideMenu;
- (IBAction)LeftSlideMenuAction:(UIButton *)sender;

@property (nonatomic, assign) BOOL is_show;


@end

@implementation ShareViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.delegate = self;
    
    _is_show = YES;

    // 扩大返回按钮的点击范围
    [self.leftSlideMenu setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    XXYLog(@"测试测试测试");
}

- (IBAction)LeftSlideMenuAction:(UIButton *)sender {
    XXYLog(@"左侧按钮被点击");
    if (_is_show) {
        CGRect rect = self.view.frame;
        
        rect.origin.x = self.view.frame.size.width / 2;
        rect.origin.y = 0;
        rect.size.height = self.view.bounds.size.height;
        rect.size.width = self.view.bounds.size.width/2;
    
        self.view.frame = rect;
        
         _is_show = NO;
    } else {
        CGRect rect = self.view.frame;
        rect.origin.x = 0;
        rect.origin.y = 0;
        rect.size.height = self.view.bounds.size.height;
        rect.size.width = self.view.bounds.size.width * 2;
        
        self.view.frame = rect;
        
        _is_show = YES;
    }
}

@end
