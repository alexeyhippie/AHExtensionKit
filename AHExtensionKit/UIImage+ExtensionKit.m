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

- (CGSize)aspectFitSizeInBounds:(CGSize)boundSize {
    CGFloat imageScale = self.size.width / self.size.height;
    CGFloat newScale = boundSize.width / boundSize.height;
    CGSize newSize = self.size;
    if (imageScale > newScale) {
        if (self.size.width > boundSize.width) {
            newSize.width = boundSize.width;
            newSize.height = boundSize.width / imageScale;
        }
    } else {
        if (self.size.height > boundSize.height) {
            newSize.height = boundSize.height;
            newSize.width = imageScale * boundSize.height;
        }
    }
    
    return newSize;
}

#pragma mark - modifiers

- (UIImage *)scaledImageToSize:(CGSize)scaledSize {
    CGSize newSize = [self aspectFitSizeInBounds:scaledSize];
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
