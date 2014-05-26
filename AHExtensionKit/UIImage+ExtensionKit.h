//
//  UIImage+ExtensionKit.h
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ExtensionKit)

#pragma mark - getters
- (CGFloat)width;
- (CGFloat)height;
- (CGSize)sizeForWidth:(CGFloat)width;
- (CGSize)aspectFitSizeInBounds:(CGSize)boundSize;

#pragma mark - modifiers
- (UIImage *)aspectFitScaledImageToSize:(CGSize)scaledSize;
- (UIImage *)applyAspectFillInRect:(CGRect)bounds;

@end
