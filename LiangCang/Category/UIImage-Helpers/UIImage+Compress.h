//
//  UIImage+Compress.h
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

/**
 *  Get image with image name
 *
 *  @param name : Image name. A image named "logo@3x.png", inputing "logo" is necessary.
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithName:(NSString *)name;

@end
