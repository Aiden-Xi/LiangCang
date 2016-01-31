//
//  NSString+Tools.h
//  Shops-iPhone
//
//  Created by rujax on 14-9-26.
//  Copyright (c) 2014年 net.atyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

// 计算字符串的长宽
- (CGRect)rectWithSize:(CGSize)size font:(UIFont *)font;

- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size;

// 返回一个日期格式（自定义 JAN.29）
+ (NSString *)customDateToString;

@end
