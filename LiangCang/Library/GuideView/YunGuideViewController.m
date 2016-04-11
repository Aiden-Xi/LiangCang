//
//  YunGuideViewController.m
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "YunGuideViewController.h"

@implementation YunGuideViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _guideType = FullScreen;
    }
    return self;
}

- (void)setGuideType:(GuideType)guideType {
    self.guideType = guideType;
}

/**
 *  图片裁剪
 *
 *  @param rect 需要裁剪的尺寸
 */
- (UIImage*)getSubImage:(CGRect)rect image:(UIImage *)image {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, smallBounds, subImageRef);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}

@end
