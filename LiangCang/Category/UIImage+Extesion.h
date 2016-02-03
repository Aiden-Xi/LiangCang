//
//  UIImage+UIImage_Color.h
//  LiangCang
//
//  Created by Mr.Xi on 16/1/27.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extesion)

// 返回一张以颜色渲染的图片
+ (UIImage *)createImageWithColor:(UIColor *)color;

// 返回可以随意拉伸而不变形的图片
+ (UIImage *)resizableImage:(NSString *)name;

+ (UIImage *)resizableWithImage:(UIImage *)image;

+ (UIImage *)resizableImageTwo:(NSString *)name;

@end
