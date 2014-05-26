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

#pragma mark - Frame
- (void)moveToPoint:(CGPoint)point;
- (void)moveToPoint:(CGPoint)point withDuration:(NSTimeInterval)seconds;
- (void)moveByXFor:(CGFloat)xShift;
- (void)moveByXFor:(CGFloat)xShift withDuration:(NSTimeInterval)seconds;
- (void)moveByYFor:(CGFloat)yShift;
- (void)moveByYFor:(CGFloat)yShift withDuration:(NSTimeInterval)seconds;

@end
