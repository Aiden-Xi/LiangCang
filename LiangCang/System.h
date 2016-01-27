//
//  System.h
//  LiangCang
//
//  Created by Mr.Xi on 16/1/19.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#ifndef System_h
#define System_h

#pragma mark - Debug -

#ifdef DEBUG

#define XXYLog(fmt, ...)   NSLog((@"\n%s [Line %u]:\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define XXYLog(fmt, ...)

#endif

#pragma mark - Library -

#import "AFNetworking.h"
#import "Masonry.h"
#import "MJExtension.h"


#pragma mark - 系统基础设置 -

#define kAppVersion                         [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
#define kAppBuild                           [NSString stringWithFormat:@"%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]]

#define kDeviceOSVersion                    [[[UIDevice currentDevice] systemVersion] floatValue]

#define kIsiPhone                           [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

#define kCustomNaviHeight                   (kDeviceOSVersion >= 7.0 ? 64 : 0)
#define kNavTabBarHeight                    64

#define kNullToString(str)                  ([str isEqual:[NSNull null]] || str == nil) ? @"" : str
#define kNullToArray(arr)                   ([arr isEqual:[NSNull null]] || arr == nil) ? @[] : arr
#define kNullToDictionary(dic)              ([dic isEqual:[NSNull null]] || dic == nil) ? @{} : dic

#define kScreenBounds                       ([[UIScreen mainScreen] bounds])
#define kScreenWidth                        ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight                       ([[UIScreen mainScreen] bounds].size.height)
#define kScreenSize                         CGSizeMake(kScreenWidth, kScreenHeight)
#define kLineHeight                         (1 / [UIScreen mainScreen].scale)


#pragma mark - 系统原生单例和StoryBoard -

#define kApplication                        [UIApplication sharedApplication]
#define kAppDelegate                        (AppDelegate *)[UIApplication sharedApplication].delegate
#define kUserDefaults                       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter                 [NSNotificationCenter defaultCenter]
#define kLivingNoteStoryBoard               (UIStoryboard *)[UIStoryboard storyboardWithName:@"LivingNote" bundle:nil]
#define kLoginRegisterStoryBoard            (UIStoryboard *)[UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil]


#endif /* System_h */
