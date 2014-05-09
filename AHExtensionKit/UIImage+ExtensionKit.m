//
//  UIImage+ExtensionKit.m
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import "UIImage+ExtensionKit.h"

@implementation UIImage (ExtensionKit)

#pragma mark - getters

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

#pragma mark - modifiers

- (UIImage *)scaledImageToSize:(CGSize)scaledSize {
    CGFloat imageScale = self.size.width / self.size.height;
    CGFloat newScale = scaledSize.width / scaledSize.height;
    CGSize newSize;
    if (imageScale > newScale) {
        newSize.width = scaledSize.width;
        newSize.height = scaledSize.width / imageScale;
    } else {
        newSize.height = scaledSize.height;
        newSize.width = imageScale * scaledSize.height;
    }
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
