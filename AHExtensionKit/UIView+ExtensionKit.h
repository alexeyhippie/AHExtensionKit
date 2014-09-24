//
//  UIView+ExtensionKit.h
//  LiveSeen
//
//  Created by Alexey Hippie on 16/05/14.
//  Copyright (c) 2014 LiveSeen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ExtensionKit)

#pragma mark - Getters
- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)x;
- (CGFloat)y;

#pragma mark - Setters
- (void)setSize:(CGSize)size;
- (void)setOrigin:(CGPoint)origin;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;

- (void)setAlpha:(CGFloat)alpha animated:(NSTimeInterval)seconds;

#pragma mark - Frame
- (void)moveToPoint:(CGPoint)point;
- (void)moveToPoint:(CGPoint)point animated:(NSTimeInterval)seconds;
- (void)moveToCenter:(CGPoint)center;
- (void)moveToCenter:(CGPoint)center animated:(NSTimeInterval)seconds;
- (void)moveByXFor:(CGFloat)xShift;
- (void)moveByXFor:(CGFloat)xShift animated:(NSTimeInterval)seconds;
- (void)moveByYFor:(CGFloat)yShift;
- (void)moveByYFor:(CGFloat)yShift animated:(NSTimeInterval)seconds;

@end
