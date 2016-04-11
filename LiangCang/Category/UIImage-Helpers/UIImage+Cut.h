//
//  UIImage+cut.h
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Cut)

/**
 *  图片裁剪
 *
 *  @param rect 裁剪的尺寸
 */
-(UIImage*)getSubImage:(CGRect)rect;

@end
