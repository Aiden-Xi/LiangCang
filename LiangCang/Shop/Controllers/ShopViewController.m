//
//  ShopViewController.m
//  LiangCang
//
//  Created by xxy on 16/1/27.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "ShopViewController.h"
#import "Masonry.h"
#import "UIImage+Color.h"

@interface ShopViewController () <UISearchBarDelegate, XXYSelectorViewDelegate, UITabBarControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchButtonClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *catButton;
- (IBAction)catButtonAction:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIView *navBarView;
@property (strong, nonatomic) IBOutlet UILabel *navTitle;

@property (nonatomic, strong) UISearchBar *searchBar;
- (IBAction)cacleButtonClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *cacleButton;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建搜索框控件
    [self createSearchBar];
    
    // 创建选择按钮视图
    [self createSelectButtonView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CreateUI -
- (void)createSearchBar {
    self.searchBar = [[UISearchBar alloc] init];
    
    self.searchBar.hidden = YES;
    
    _searchBar.placeholder = @"搜索";
    //    _searchBar.prompt = @"哈哈哈";   // 搜索框顶部文字
    _searchBar.backgroundImage = [UIImage createImageWithColor:[UIColor blackColor]];
    _searchBar.delegate = self;
    _searchBar.tintColor = [UIColor whiteColor];
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.layer.masksToBounds = YES;
    _searchBar.layer.cornerRadius = 5;
    
    [self.navBarView addSubview:_searchBar];
    
    // 添加约束
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_navBarView.mas_left).offset(10);
        make.right.equalTo(_navBarView.mas_right).offset(-70);
        make.top.mas_equalTo(25);
        make.height.mas_equalTo(35);
    }];
    
    [self setSearchTextFieldBackgroundColor:[UIColor blackColor]];
}

- (void)createSelectButtonView {
    _selectView = [[XXYSelectorView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 30) titleArray:@[@"分类", @"品牌", @"首页", @"专题", @"礼物"] defaultSelect:2 backGroudColor:kDefaultColor lineColor:kDefaultWhiteColor];
    _selectView.delegate = self;
    
    [self.view addSubview:_selectView];
}

#pragma mark - ButtonClick -

- (IBAction)searchButtonClick:(UIButton *)sender {
    self.searchBar.hidden = NO;
    // 设置第一响应
    [_searchBar becomeFirstResponder];
    
    // 隐藏标题
    self.navTitle.hidden = YES;
    self.cacleButton.hidden = NO;
    self.searchButton.hidden = YES;
    self.catButton.hidden = YES;
}

- (IBAction)cacleButtonClick:(UIButton *)sender {
    [UIView animateWithDuration:1.0 animations:^{
        [self.searchBar resignFirstResponder];
        self.searchBar.hidden = YES;
        self.searchButton.hidden = NO;
        self.navTitle.hidden = NO;
        self.cacleButton.hidden = YES;
        self.catButton.hidden = NO;
    }];
}

#pragma mark - UISearchDelegate -

- (void)setSearchTextFieldBackgroundColor:(UIColor *)backgroundColor {
    UITextField *searchTextField = nil;
    if (kDeviceOSVersion > 7) {
        // 经测试, 需要设置barTintColor后, 才能拿到UISearchBarTextField对象
        _searchBar.barTintColor = [UIColor whiteColor];
        searchTextField = (UITextField *)[[[_searchBar.subviews firstObject] subviews] lastObject];
    } else { // iOS6以下版本searchBar内部子视图的结构不一样
        for (UIView *subView in _searchBar.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                searchTextField = (UITextField *)subView;
            }
        }
    }
    
    searchTextField.backgroundColor = backgroundColor;
    searchTextField.textColor = kDefaultWhiteColor;
    searchTextField.font = kFontSizeFamily(18);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    XXYLog(@"开始搜索");
}

#pragma mark - XXYSelectButtonViewDelegate -

- (void)XXYSelectorViewClickFrom:(UIButton *)fromButton To:(UIButton *)ToButton {
    XXYLog(@"%ld---%ld", (long)fromButton.tag, (long)ToButton.tag);
}

- (IBAction)catButtonAction:(UIButton *)sender {
    
}
@end
