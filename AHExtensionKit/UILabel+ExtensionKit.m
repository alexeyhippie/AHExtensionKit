//
//  UILabel+ExtensionKit.m
//  NineSounds
//
//  Created by Alexey Hippie on 11/07/14.
//  Copyright (c) 2014 9Sounds. All rights reserved.
//

#import "UILabel+ExtensionKit.h"

@implementation UILabel (ExtensionKit)

- (CGFloat)heightForWidth:(CGFloat)width withText:(NSString *)text {
    CGFloat height = 0.f;
    
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                         attributes:@{NSFontAttributeName: self.font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    height = rect.size.height;
    
    return height;
}

@end
