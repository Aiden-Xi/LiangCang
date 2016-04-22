//
//  UIFont+AppFont.m
//  LiangCang
//
//  Created by xxy on 16/4/22.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UIFont+AppFont.h"

@implementation UIFont (AppFont)

+ (UIFont *)systemFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:kFontFamily size:fontSize];
    return font;
}

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize
{
    UIFont *font = [UIFont fontWithName:kFontFamily size:fontSize];
    return font;
}

@end
