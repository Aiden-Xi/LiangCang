//
//  AppDelegate.m
//  LiangCang
//
//  Created by Mr.Xi on 16/1/19.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "AppDelegate.h"
#import "LaunchScreenViewController.h"
#import "BaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /// 注册各种库的使用
    [self startRegisterDefault];
    
    sleep(1.5);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; // 添加的
    self.window.backgroundColor = kDefaultBlackColor; // 添加的
    
    UIStoryboard *mainStoryboard = kStoryBoard(@"Main");
    
    BaseTabBarController *baseTabVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"baseTabbarController"];
    
    self.window.rootViewController = baseTabVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
 *  一些需要开始注册使用的库
 */
- (void)startRegisterDefault {
    /// 需要使用的库，基本的注册（键盘处理库）
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    /// BugLy 配置
    [[CrashReporter sharedInstance] enableLog:YES];
    [[CrashReporter sharedInstance] installWithAppId:kBugLyAppId];
}

@end
