//
//  UIView+ExtensionKit.m
//  LiveSeen
//
//  Created by Alexey Hippie on 16/05/14.
//  Copyright (c) 2014 LiveSeen. All rights reserved.
//

#import "UIView+ExtensionKit.h"

@implementation UIView (ExtensionKit)

- (void)moveViewToPoint:(CGPoint)point {
    self.frame = CGRectMoveRectToPoint(self.frame, point);
}

@end
