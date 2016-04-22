//
//  YunGuideViewController.m
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "YunGuideViewController.h"
#import "UIImage-Helpers.h"

#define kScreenBounds                       ([[UIScreen mainScreen] bounds])
#define kScreenWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight                       ([[UIScreen mainScreen] bounds].size.height)
#define kButtonSpace                   60
#define kButtonWidth                   (kScreenWidth - kButtonSpace * 3) / 2
#define kButtonHeight                  40

@interface YunGuideViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UIButton *signInButton;

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
    
    _showPageControl = YES;
    _pageControlDotSize = CGSizeMake(10, 10);
    _pageStyle = PageContolStyleAnimated;
    
    [self createPageView];
}

#pragma mark - CreateUI -

- (void)createPageView {
    // 设置scrollView控制器
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    _scrollView.contentSize = CGSizeMake(self.imageNameArray.count * kScreenWidth, kScreenHeight);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.view addSubview:_scrollView];
    
    for (int i = 0; i < self.imageNameArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageWithName:_imageNameArray[i]];
        
        [_scrollView addSubview:imageView];
    }
    
    _signInButton = [[UIButton alloc] initWithFrame:CGRectMake(kButtonSpace, kScreenHeight - kButtonHeight - 80, kButtonWidth, kButtonHeight)];
    [_signInButton setTitle:@"注册" forState:UIControlStateNormal];
    [_signInButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _signInButton.layer.cornerRadius = 3.0;
    _signInButton.layer.masksToBounds = YES;
    _signInButton.hidden = YES;
    [_signInButton addTarget:self action:@selector(signInButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_signInButton];
    
    
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 2 * kButtonSpace - kButtonWidth, kScreenHeight - kButtonHeight - 80, kButtonWidth, kButtonHeight)];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius = 3.0;
    _loginButton.layer.masksToBounds = YES;
    _loginButton.hidden = YES;
    [_loginButton addTarget:self
                     action:@selector(loginButtonClick:)
           forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:_loginButton];
}

#pragma mark - SETTING FUNCTION -

- (void)setPageAliment:(PageContolAliment)pageAliment {
    _pageAliment = pageAliment;
    
    [self setupPageControl];
}

- (void)setPageStyle:(PageContolStyle)pageStyle {
    _pageStyle = pageStyle;
    
    [self setupPageControl];
}

- (void)setupPageControl
{
    if (_pageControl) [_pageControl removeFromSuperview]; // 重新加载数据时调整
    
    switch (self.pageStyle) {
        case PageContolStyleAnimated:
        {
            TAPageControl *pageControl = [[TAPageControl alloc] init];
            pageControl.numberOfPages = self.imageNameArray.count;
            pageControl.dotColor = self.dotColor;
            
            [self.view addSubview:pageControl];
            
            _pageControl = pageControl;
            
            break;
        }
            
        case PageContolStyleClassic:
        {
            UIPageControl *pageControl = [[UIPageControl alloc] init];
            pageControl.numberOfPages = self.imageNameArray.count;
            pageControl.currentPageIndicatorTintColor = self.dotColor;
            
            [self.view addSubview:pageControl];
            
            _pageControl = pageControl;
            
            break;
        }
            
        default:
            break;
    }
    
    CGSize size = CGSizeZero;
    
    if ([self.pageControl isKindOfClass:[TAPageControl class]]) {
        TAPageControl *pageControl = (TAPageControl *)_pageControl;
        
        size = [pageControl sizeForNumberOfPages:self.imageNameArray.count];
    } else {
        size = CGSizeMake(self.imageNameArray.count * self.pageControlDotSize.width * 1.2, self.pageControlDotSize.height);
    }
    
    CGFloat x = (self.view.frame.size.width - size.width) * 0.5;
    
    if (self.pageAliment == PageContolAlimentRight) {
        x = self.view.frame.size.width - size.width - 10;
    }
    
    CGFloat y = self.view.frame.size.height - size.height - 10;
    
    if ([self.pageControl isKindOfClass:[TAPageControl class]]) {
        TAPageControl *pageControl = (TAPageControl *)_pageControl;
        [pageControl sizeToFit];
    }
    
    _pageControl.frame = CGRectMake(x, y, size.width, size.height);
    
    _pageControl.hidden = !_showPageControl;
}

- (void)setPageControlDotSize:(CGSize)pageControlDotSize
{
    _pageControlDotSize = pageControlDotSize;
    
    if ([self.pageControl isKindOfClass:[TAPageControl class]]) {
        TAPageControl *pageContol = (TAPageControl *)_pageControl;
        pageContol.dotSize = pageControlDotSize;
    }
}

- (void)setShowPageControl:(BOOL)showPageControl
{
    _showPageControl = showPageControl;
    
    _pageControl.hidden = !showPageControl;
}

- (void)setDotColor:(UIColor *)dotColor
{
    _dotColor = dotColor;
    if ([self.pageControl isKindOfClass:[TAPageControl class]]) {
        TAPageControl *pageControl = (TAPageControl *)_pageControl;
        pageControl.dotColor = dotColor;
    } else {
        UIPageControl *pageControl = (UIPageControl *)_pageControl;
        pageControl.currentPageIndicatorTintColor = dotColor;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_scrollView endEditing:YES];
}

- (void)setImageNameArray:(NSArray *)imageNameArray {
    _imageNameArray = imageNameArray;
}

#pragma mark - UIButton Click -

- (void)loginButtonClick:(UIButton *)sender {
}

- (void)signInButtonClick:(UIButton *)sender {
}

#pragma mark - UIScrollViewDelegate -

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    
    if ([self.pageControl isKindOfClass:[TAPageControl class]]) {
        TAPageControl *pageControl = (TAPageControl *)_pageControl;
        pageControl.currentPage = (offset.x / bounds.size.width);
        [pageControl sizeForNumberOfPages:offset.x / bounds.size.width];
        
    } else {
        UIPageControl *pageControl = (UIPageControl *)_pageControl;
        pageControl.currentPage = (offset.x / bounds.size.width);
        [pageControl sizeForNumberOfPages:offset.x / bounds.size.width];
    }
    
    if ((offset.x / bounds.size.width) == _imageNameArray.count - 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _pageControl.hidden = YES;
        });
    } else {
        _pageControl.hidden = NO;
    }
}

@end
