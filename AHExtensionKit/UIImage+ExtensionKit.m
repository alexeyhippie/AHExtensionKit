//
//  UIImage+ExtensionKit.m
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import "UIImage+ExtensionKit.h"

@implementation UIImage (ExtensionKit)

- (CGSize)sizeForWidth:(CGFloat)width {
    CGSize result = CGSizeMake(self.size.width, self.size.height);
    
    if (self.size.width >= width) {
        // change content size only if image width more than view size
        CGFloat imageKoeff = self.size.height / self.size.width;
        CGFloat h = imageKoeff * width;
        result = CGSizeMake(width, h);
    }
    
    return result;
}

@end
