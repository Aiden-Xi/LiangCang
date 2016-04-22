//
//  UILabel+OverrideBaseFont.m
//  LiangCang
//
//  Created by xxy on 16/4/22.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UILabel+OverrideBaseFont.h"
#import "Aspects.h"

@implementation UILabel (OverrideBaseFont)

+ (void)load {
    [[self class] aspect_hookSelector:@selector(awakeFromNib) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        UILabel* instance = [aspectInfo instance];
        UIFont* font = [UIFont fontWithName:kFontFamily size:instance.font.pointSize];
        instance.font = font;
    }error:nil];
}

@end
