//
//  LaunchViewController.m
//  WBZhiHuDailyPaper
//
//  Created by caowenbo on 15/12/18.
//  Copyright © 2015年 曹文博. All rights reserved.
//

#import "LaunchViewController.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
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

- (UIImageView *)launchImage{
    
    if (_launchImage == nil) {
        _launchImage = [[UIImageView alloc] initWithFrame:kScreenBounds];
        _launchImage.image = [UIImage imageNamed:@"Default"];
    }

    return _launchImage;
}

- (UIImageView *)logoImage{
    
    if (_logoImage == nil) {
        _logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth(95), kHeight(458), kWidth(128), kHeight(49))];
        _logoImage.image = [UIImage imageNamed:@"Login_Logo"];
    }
    
    return _logoImage;
}

- (UILabel *)imageTitle{
    
    if (_imageTitle == nil) {
        _imageTitle = [[UILabel alloc] init];
        _imageTitle.textColor = kWhiteColor;
        _imageTitle.font = [UIFont systemFontOfSize:14];
    }
    
    return _imageTitle;
}

@end
