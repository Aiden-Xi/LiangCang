//
//  ShareViewController.m
//  LiangCang
//
//  Created by xxy on 16/2/2.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController () <UITabBarControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *leftSlideMenu;
- (IBAction)LeftSlideMenuAction:(UIButton *)sender;

@property (nonatomic, assign) BOOL is_show;


@end

@implementation ShareViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.delegate = self;
    
    _is_show = YES;

    // 扩大返回按钮的点击范围
    [self.leftSlideMenu setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    XXYLog(@"测试测试测试");
}

- (IBAction)LeftSlideMenuAction:(UIButton *)sender {
    
    
//    MainViewController *mainVC = [MainViewController new];
//    SettingViewController *setVC = [[SettingViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
//    
//    SLideZoomMenuController *slideZoomMenu = [[SLideZoomMenuController alloc] initWithRootController:nav];
//    slideZoomMenu.leftViewController = setVC;
//    self.window.rootViewController = slideZoomMenu;
//    self.slider = slideZoomMenu;
//    
//    [self.window makeKeyAndVisible]; // 添加的
    
    AppDelegate *app = kAppDelegate;
    
    UIView *leftView = [[UIView alloc] init];
    
    leftView.backgroundColor = [UIColor redColor];
    
    UIButton *test = [[UIButton alloc] init];
    
    test.titleLabel.text = @"lasdfjlk";
    
    [test setFrame:CGRectMake(20, 20, 50, 50)];
    
    test.backgroundColor = [UIColor blueColor];
    
    [test addTarget:self action:@selector(testButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [leftView addSubview:test];
    
    XXYLog(@"左侧按钮被点击");
    if (_is_show) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = self.view.frame;
            
            rect.origin.x = self.view.frame.size.width / 1.5;
            rect.origin.y = 0;
            rect.size.height = self.view.bounds.size.height;
            rect.size.width = self.view.bounds.size.width;
    
            self.view.frame = rect;
            
            [leftView setFrame:CGRectMake(0, 0, self.view.frame.size.width / 1.5, self.view.bounds.size.height)];
        } completion:^(BOOL finished) {
            _is_show = NO;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = self.view.frame;
            rect.origin.x = 0;
            rect.origin.y = 0;
            rect.size.height = self.view.bounds.size.height;
            rect.size.width = self.view.bounds.size.width;
            
            self.view.frame = rect;
            
            [leftView setFrame:CGRectMake(0, 0, 0, self.view.bounds.size.height)];
        } completion:^(BOOL finished) {
           _is_show = YES;
        }];
    }
}

- (void)testButton:(UIButton *)sender {
    XXYLog(@"家里谁看见对方离开就撒了点附近阿什利");
}

#pragma mark - TableViewDelegate -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
