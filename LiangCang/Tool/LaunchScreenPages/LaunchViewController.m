//
//  LaunchViewController.m
//  WBZhiHuDailyPaper
//
//  Created by caowenbo on 15/12/18.
//  Copyright © 2015年 曹文博. All rights reserved.
//

#import "LaunchViewController.h"
#import "MJExtension.h"
//#import "UIImageView+WebCache.h"
#import "LaunchImage.h"

static CGFloat const animationDuration = 3.0;

@interface LaunchViewController ()

@property (nonatomic, strong) UIImageView *launchImage;
@property (nonatomic, strong) UIImageView *logoImage;
@property (nonatomic, strong) UILabel *imageTitle;

@end

@implementation LaunchViewController

#pragma mark - life cycle

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.launchImage];
    [self.view bringSubviewToFront:self.launchImage];
    [self.view addSubview:self.imageTitle];
//    获得启动动画图片
    [self updateLanunchImage];

}

#pragma mark - private method
- (void)updateLanunchImage {
    
    
}

#pragma mark - getter and setter


@end
