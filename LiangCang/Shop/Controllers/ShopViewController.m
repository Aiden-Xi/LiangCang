//
//  ShopViewController.m
//  LiangCang
//
//  Created by xxy on 16/1/27.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchButtonClick:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIView *navBarView;

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonClick -

- (IBAction)searchButtonClick:(UIButton *)sender {
    self.searchBar = [[UISearchBar alloc] init];
}
@end
