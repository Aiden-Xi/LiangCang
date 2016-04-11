//
//  YunGuideViewController.m
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "YunGuideViewController.h"
#import "UIImage-Helpers.h"

@interface YunGuideViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UIScrollView *scrollView;

@end


@implementation YunGuideViewController

#pragma mark - Initialization -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

#pragma mark - UIView Functions -

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 设置透明导航栏
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        NSArray *list = self.navigationController.navigationBar.subviews;
        
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                imageView.alpha = 0.0;
            }
        }
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        
        imageView.image = [UIImage imageNamed:@"navigation_bar_background"];
        
        [self.navigationController.navigationBar addSubview:imageView];
        
        [self.navigationController.navigationBar sendSubviewToBack:imageView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSArray *list=self.navigationController.navigationBar.subviews;
    
    for (id obj in list) {
        
        if ([obj isKindOfClass:[UIImageView class]]) {
            
            UIImageView *imageView=(UIImageView *)obj;
            [UIView animateWithDuration:0.01 animations:^{
                imageView.alpha = 1.0;
            }];
        }
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.navigationController.navigationBarHidden = YES;
    
    [self createPageView];
}

- (void)createPageView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    _scrollView.contentSize = CGSizeMake(self.imageNameArray.count * kScreenWidth, kScreenHeight);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth - 120) / 2, kScreenHeight - 50, 120, 44)];
    
    _pageControl.numberOfPages = _imageNameArray.count;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPage = 0;
    
    [self.view addSubview:_pageControl];
    
    for (int i = 0; i < self.imageNameArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageWithName:_imageNameArray[i]];
        
        [_scrollView addSubview:imageView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_pageControl setCurrentPage:offset.x / bounds.size.width];
    [_pageControl sizeForNumberOfPages:offset.x / bounds.size.width];
    
    if ((offset.x / bounds.size.width) == _imageNameArray.count - 1) {
        _pageControl.hidden = YES;
    } else {
        _pageControl.hidden = NO;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_scrollView endEditing:YES];
}

- (void)setGuideType:(GuideType)guideType {
    _guideType = guideType;
}

- (void)setLoginSignButtonColor:(UIColor *)loginSignButtonColor {
    _loginSignButtonColor = loginSignButtonColor;
}

- (void)setImageNameArray:(NSArray *)imageNameArray {
    _imageNameArray = imageNameArray;
}

@end
