//
//  UIView+ExtensionKit.m
//  LiveSeen
//
//  Created by Alexey Hippie on 16/05/14.
//  Copyright (c) 2014 LiveSeen. All rights reserved.
//

#import "UIView+ExtensionKit.h"

@implementation UIView (ExtensionKit)

#pragma mark - Getters

- (CGSize)size {return self.frame.size;}
- (CGPoint)origin {return self.frame.origin;}
- (CGFloat)width {return self.frame.size.width;}
- (CGFloat)height {return self.frame.size.height;}
- (CGFloat)x {return self.frame.origin.x;}
- (CGFloat)y {return self.frame.origin.y;}

#pragma mark - Setters
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setAlpha:(CGFloat)alpha animated:(NSTimeInterval)seconds {
    [UIView animateWithDuration:seconds animations:^{
        self.alpha = alpha;
    }];
}

#pragma mark - Frame

- (void)moveToPoint:(CGPoint)point {
    self.frame = CGRectMoveRectToPoint(self.frame, point);
}

- (void)moveToPoint:(CGPoint)point animated:(NSTimeInterval)seconds {
    [UIView animateWithDuration:seconds animations:^{
        [self moveToPoint:point];
    }];
}

- (void)moveByXFor:(CGFloat)xShift {
    self.center = CGPointMake(self.center.x + xShift, self.center.y);
}

- (void)moveByXFor:(CGFloat)xShift animated:(NSTimeInterval)seconds {
    [UIView animateWithDuration:seconds animations:^{
        [self moveByXFor:xShift];
    }];
}

- (void)moveByYFor:(CGFloat)yShift {
    self.center = CGPointMake(self.center.x, self.center.y + yShift);
}

- (void)moveByYFor:(CGFloat)yShift animated:(NSTimeInterval)seconds {
    [UIView animateWithDuration:seconds animations:^{
        [self moveByYFor:yShift];
    }];
}

@end
