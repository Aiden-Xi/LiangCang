//
//  TalentViewController.m
//  LiangCang
//
//  Created by xxy on 16/2/2.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "TalentViewController.h"

@interface TalentViewController ()
@property (strong, nonatomic) IBOutlet UIButton *leftSlideMenu;
- (IBAction)LeftSlideMenuAction:(UIButton *)sender;

@end

@implementation TalentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 扩大返回按钮的点击范围
    [self.leftSlideMenu setEnlargeEdgeWithTop:10 right:10 bottom:10 left:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LeftSlideMenuAction:(UIButton *)sender {
}
@end
