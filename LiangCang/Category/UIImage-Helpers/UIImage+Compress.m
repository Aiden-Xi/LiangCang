//
//  UIImage+Compress.m
//  LiangCang
//
//  Created by xxy on 16/4/11.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UIImage+Compress.h"

@implementation UIImage (Compress)

#define BASE_IMG_WIDTH  (1242)
#define BASE_IMG_HEIGHT (2208)

#define SUFFIX_3X_PNG   @"@3x.png"
#define SUFFIX_2X_PNG   @"@2x.png"

// 获取图片
+ (UIImage *)imageWithName:(NSString *)name {
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        return [UIImage imageNamed:name];
    }
    else {
        NSAssert(NO == [name hasSuffix:SUFFIX_3X_PNG], @"File name suffix @3x.png is unnecessary!");
        
        NSString *srcImgName = [name stringByAppendingString:SUFFIX_3X_PNG];
        
        NSString *desImgName = [UIImage desImageName:[UIImage getImageName:name] withExt:SUFFIX_2X_PNG];
        
        // Path
        NSString *cacheDir = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/Resources/images/"];
        
        // 判断存放图片的文件夹是否存在,不存在则创建对应文件夹
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        BOOL isDir = NO;
        BOOL isDirExist = [fileManager fileExistsAtPath:cacheDir isDirectory:&isDir];
        if(!(isDirExist && isDir)) {
            NSError *error = nil;
            BOOL bCreateDir = [fileManager createDirectoryAtPath:cacheDir withIntermediateDirectories:YES attributes:nil error:&error];
            
            if(!bCreateDir) {
                NSLog(@"Create Directory Failed! : %@", error.description);
                
                return nil;
            }
        }
        
        NSString *desPath = [cacheDir stringByAppendingPathComponent:desImgName];
        
        UIImage *desImage = [UIImage imageWithContentsOfFile:desPath];
        
        if(!desImage) {
            // 如果从Cache中没有取到图片
            if([UIImage compressImage:srcImgName compressionQuality:0.8 desPath:desPath]) {
                // 压缩成功
                desImage = [UIImage imageWithContentsOfFile:desPath];
            }
            else {
                desImage = nil;
            }
        }
        
        return desImage;
    }
}

// 压缩图片
+ (BOOL)compressImage:(NSString *)name compressionQuality:(CGFloat)compressionQuality desPath:(NSString *)desPath {
    if(name == nil || desPath == nil) {
        return NO;
    }
    
    UIImage *srcImage = [UIImage imageNamed:name];
    
    if(srcImage == nil) {
        return NO;
    }
    
    // 根据屏幕尺寸设置图片尺寸
    UIScreen *mainScreen = [UIScreen mainScreen];
    
    // Default is Portrait or PortraitUpsideDown
    CGSize baseImgSize = CGSizeMake(BASE_IMG_WIDTH, BASE_IMG_HEIGHT);
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if(orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
        // LandscapeLeft or LandscapeRight
        baseImgSize = CGSizeMake(BASE_IMG_HEIGHT, BASE_IMG_WIDTH);
    }
    
    CGSize newSize = CGSizeMake(srcImage.size.width * srcImage.scale * (CGRectGetWidth(mainScreen.bounds) * mainScreen.scale) / baseImgSize.width, srcImage.size.height * srcImage.scale * (CGRectGetHeight(mainScreen.bounds) * mainScreen.scale) / baseImgSize.height);
    
    // Reset image
    UIImage *newImage = [UIImage imageWithImage:srcImage scaleToSize:newSize];
    
    // 对图片进行压缩
    NSData *imageData = UIImageJPEGRepresentation(newImage, compressionQuality);
    
    // 保存新图片
    return [imageData writeToFile:desPath atomically:YES];
}

// 重设图片的全名(带扩展名)
+ (NSString *)desImageName:(NSString *)srcImageName withExt:(NSString *)extName {
    return [srcImageName stringByAppendingString:extName];
}

// 获取图片的名字(不带扩展名)
+ (NSString *)getImageName:(NSString *)srcImage {
    if(srcImage) {
        NSArray *tempArray = [srcImage componentsSeparatedByString:@"."];
        
        if(tempArray) {
            // 有.分割的文件名
            if([tempArray count] > 1) {
                NSString *extName = [tempArray lastObject];
                
                // 严格判断文件的扩展名
                if([extName isEqualToString:@"png"] || [extName isEqualToString:@"jpg"] || [extName isEqualToString:@"jpeg"]) {
                    return [srcImage substringWithRange:NSMakeRange(0, srcImage.length - (extName.length + 1))];
                }
                else {
                    return nil;
                }
            }
            else {
                return srcImage;
            }
        }
        else {
            return srcImage;
        }
    }
    return nil;
}

// 对图片尺寸进行重新设置
+ (UIImage *)imageWithImage:(UIImage*)image scaleToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0.0, 0.0, newSize.width, newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
