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
// 是否隐藏tabbar
@property (nonatomic, assign) BOOL needToHideBottomBar;

/// 判断是放大还是缩小
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation MagazineViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 设置左上角当前时间
    self.timeLabel.text = [NSString customDateToString];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isOpen = NO;
    _needToHideBottomBar = YES;
    
    // 创建定时器，箭头图标改变大小 scheduledTimerWithTimeInterval
    _time = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(arrowImageViewChange) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonAction -

/**
 *  点击顶部导航栏改变页面排布
 *
 *  @param sender 按钮
 */
- (IBAction)topButtonAction:(UIButton *)sender {
    // 隐藏tabbar, 主视图高度增高tabbar的高度
    if (self.needToHideBottomBar) {
        self.needToHideBottomBar = NO;
        [UIView animateWithDuration:0.1 animations:^{
            CGRect frame = self.tabBarController.tabBar.frame;
            [self.tabBarController.tabBar setFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height, frame.size.width, frame.size.height)];
            
            CGRect viewFrame = self.view.frame;
            [self.view setFrame:CGRectMake(viewFrame.origin.x, viewFrame.origin.y, viewFrame.size.width, viewFrame.size.height + frame.size.height)];
        }];
    }
    else {
        self.needToHideBottomBar = YES;
        [UIView animateWithDuration:0.1 animations:^{
            CGRect frame = self.tabBarController.tabBar.frame;
            [self.tabBarController.tabBar setFrame:CGRectMake(frame.origin.x, frame.origin.y - frame.size.height, frame.size.width, frame.size.height)];
            
            CGRect viewFrame = self.view.frame;
            [self.view setFrame:CGRectMake(viewFrame.origin.x, viewFrame.origin.y, viewFrame.size.width, viewFrame.size.height - frame.size.height)];
        }];
    }
}

- (void)arrowImageViewChange {
    // 放大
    [UIView animateWithDuration:1.0 animations:^{
        if (_isOpen) {
            self.arrow.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
            _isOpen = NO;
        } else {
            self.arrow.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
            _isOpen = YES;
        }
    }];
}

@end
