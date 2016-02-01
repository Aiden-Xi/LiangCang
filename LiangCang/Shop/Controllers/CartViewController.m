//
//  CatViewController.m
//  LiangCang
//
//  Created by Mr.Xi on 16/1/28.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    self.view.backgroundColor = kDefaultBackColor;
}
- (IBAction)cartToShop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
