//
//  CatViewController.m
//  LiangCang
//
//  Created by Mr.Xi on 16/1/28.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "CartViewController.h"

@implementation CartViewController
- (IBAction)cartToShop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
