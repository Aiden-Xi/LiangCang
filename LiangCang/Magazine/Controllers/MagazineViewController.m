//
//  MagazineViewController.m
//  LiangCang
//
//  Created by xxy on 16/1/29.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "MagazineViewController.h"

@interface MagazineViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *arrow;
@property (strong, nonatomic) IBOutlet UIButton *topButton;
- (IBAction)topButtonAction:(UIButton *)sender;
@property (nonatomic, strong) NSTimer *time;

/// 判断是放大还是缩小
@property (nonatomic, assign) BOOL isOpen;


@end

@implementation MagazineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isOpen = NO;
    
    // 创建定时器，箭头图标改变大小 scheduledTimerWithTimeInterval
    _time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(arrowImageViewChange) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
- (IBAction)topButtonAction:(UIButton *)sender {
    
}

- (void)arrowImageViewChange {
    // 放大
    [UIView animateWithDuration:1.0 animations:^{
        if (_isOpen) {
            self.arrow.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
            _isOpen = NO;
            XXYLog(@"-------放大");
            XXYLog(@"-----大大%@", NSStringFromCGRect(self.arrow.frame));
        } else {
            self.arrow.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
            _isOpen = YES;
            XXYLog(@"-------缩小");
            XXYLog(@"-----小小%@", NSStringFromCGRect(self.arrow.frame));
        }
    }];

}

@end
