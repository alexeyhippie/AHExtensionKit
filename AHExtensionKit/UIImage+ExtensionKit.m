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

- (CGFloat)width {
    return self.size.width;
}

- (CGFloat)height {
    return self.size.height;
}

- (CGSize)sizeForWidth:(CGFloat)width {
    return CGSizeAspectSizeOfSizeForWidth(self.size, width);
}

- (CGSize)aspectFitSizeInBounds:(CGSize)boundSize {
    return CGSizeAspectFitSizeInBoundsSize(self.size, boundSize);
}

#pragma mark - modifiers

- (UIImage *)aspectFitScaledImageToSize:(CGSize)scaledSize {
    CGSize newSize = [self aspectFitSizeInBounds:scaledSize];
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)applyAspectFillInRect:(CGRect)bounds {
    UIGraphicsBeginImageContext(bounds.size);
    CGRect rect = CGRectAspectFillRect(self.size, bounds);
    CGRect destRect = CGRectCenteredInRect(rect, bounds);
    
    [self drawInRect:destRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
