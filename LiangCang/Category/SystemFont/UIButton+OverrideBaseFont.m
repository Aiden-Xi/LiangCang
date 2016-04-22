//
//  UIButton+OverrideBaseFont.m
//  LiangCang
//
//  Created by xxy on 16/4/22.
//  Copyright © 2016年 Mr.Xi. All rights reserved.
//

#import "UIButton+OverrideBaseFont.h"
#import "Aspects.h"

@implementation UIButton (OverrideBaseFont)

+ (void)load {
    [[self class]aspect_hookSelector:@selector(awakeFromNib) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        UIButton* instance = [aspectInfo instance];
        UILabel* label = instance.titleLabel;
        UIFont* font = [UIFont fontWithName:kFontFamily size:label.font.pointSize];
        instance.titleLabel.font = font;
    }error:nil];
}

@end
