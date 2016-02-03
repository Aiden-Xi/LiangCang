//
//  UIImage+UIImage_Color.m
//  LiangCang
//
//  Created by Mr.Xi on 16/1/27.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UIImage+Extesion.h"

@implementation UIImage (Extesion)

+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);  //图片尺寸
    UIGraphicsBeginImageContext(rect.size); //填充画笔
    CGContextRef context = UIGraphicsGetCurrentContext(); //根据所传颜色绘制
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect); //联系显示区域
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext(); // 得到图片信息
    UIGraphicsEndImageContext(); //消除画笔
    return image;
}

/**
 *  返回一张可以随意拉伸不变形的图片
 * 根据项目要求，这里的上下不需要拉伸，因此只需要将左右进行拉伸就可以了。
 */
+ (UIImage *)resizableImage:(NSString *)name {
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width * 0.5;
    // CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(0, w, 0, w)];
}

+ (UIImage *)resizableWithImage:(UIImage *)image {
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

+ (UIImage *)resizableImageTwo:(NSString *)name {
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

@end
