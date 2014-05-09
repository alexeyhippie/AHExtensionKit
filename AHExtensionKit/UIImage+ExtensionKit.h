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
- (CGSize)sizeForWidth:(CGFloat)width;

#pragma mark - modifiers
- (UIImage *)scaledImageToSize:(CGSize)scaledSize;

@end
