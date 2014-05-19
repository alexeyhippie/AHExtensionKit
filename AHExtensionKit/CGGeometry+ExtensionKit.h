//
//  CGGeometry+ExtensionKit.h
//  RockwoolCalculators
//
//  Created by Alexey Hippie on 24/01/14.
//  Copyright (c) 2014 Oggetto Web. All rights reserved.
//

#pragma mark - CGRect

CG_INLINE CGRect CGRectFromPointAndSize(CGPoint point, CGSize size)
{
    CGRect rect;
    rect.origin = point;
    rect.size = size;
    return rect;
}

CG_INLINE CGRect CGRectMoveRectToPoint(CGRect rect, CGPoint point)
{
    CGRect arect;
    arect.origin = point;
    arect.size = rect.size;
    return arect;
}

CG_INLINE CGRect CGRectFromSizeAndCenter(CGSize size, CGPoint center)
{
    CGRect rect;
    rect.origin.x = center.x - size.width / 2.f;
    rect.origin.y = center.y - size.height / 2.f;
    rect.size = size;
    return rect;
}

#pragma mark - CGPoint

CG_INLINE CGPoint CGPointFromCenterOfRect(CGRect rect)
{
    CGPoint point;
    point.x = rect.size.width / 2.f + rect.origin.x;
    point.y = rect.size.height / 2.f + rect.origin.y;
    return point;
}

