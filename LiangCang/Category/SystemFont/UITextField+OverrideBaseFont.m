//
//  UITextField+OverrideBaseFont.m
//  LiangCang
//
//  Created by xxy on 16/4/22.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UITextField+OverrideBaseFont.h"
#import "Aspects.h"

@implementation UITextField (OverrideBaseFont)

+ (void)load {
    [[self class]aspect_hookSelector:@selector(awakeFromNib) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        UITextField* instance = [aspectInfo instance];
        UIFont* font = [UIFont fontWithName:kFontFamily size:instance.font.pointSize];
        instance.font = font;
    }error:nil];
}

@end
