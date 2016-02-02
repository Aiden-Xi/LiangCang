//
//  CatViewController.m
//  LiangCang
//
//  Created by Mr.Xi on 16/1/28.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()
@property (strong, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation CartViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    self.view.backgroundColor = kDefaultColor;
    // 扩大返回按钮的点击范围
    [self.backButton setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
}
- (IBAction)cartToShop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
