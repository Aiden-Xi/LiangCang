//
//  UIImage+cut.m
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UIImage+Cut.h"

@implementation UIImage (Cut)
-(UIImage*)getSubImage:(CGRect)rect {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, smallBounds, subImageRef);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}
@end
