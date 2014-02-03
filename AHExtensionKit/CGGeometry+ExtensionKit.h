//
//  CGGeometry+ExtensionKit.h
//  RockwoolCalculators
//
//  Created by Alexey Hippie on 24/01/14.
//  Copyright (c) 2014 Oggetto Web. All rights reserved.
//


CG_INLINE CGRect CGRectFromPointAndSize(CGPoint point, CGSize size)
{
    CGRect rect;
    rect.origin = point;
    rect.size = size;
    return rect;
}