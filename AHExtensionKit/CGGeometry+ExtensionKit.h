//
//  CGGeometry+ExtensionKit.h
//  RockwoolCalculators
//
//  Created by Alexey Hippie on 24/01/14.
//  Copyright (c) 2014 Oggetto Web. All rights reserved.
//

#pragma mark - CGFloat

// Calculate the destination scale for filling
CG_INLINE CGFloat CGAspectScaleFill(CGSize sourceSize, CGRect destRect)
{
    CGSize destSize = destRect.size;
    CGFloat scaleW = destSize.width / sourceSize.width;
    CGFloat scaleH = destSize.height / sourceSize.height;
    return MAX(scaleW, scaleH);
}

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

CG_INLINE CGRect CGRectAspectFillRect(CGSize sourceSize, CGRect destRect)
{
    CGSize destSize = destRect.size;
    CGFloat destScale = CGAspectScaleFill(sourceSize, destRect);
    CGFloat newWidth = sourceSize.width * destScale;
    CGFloat newHeight = sourceSize.height * destScale;
    CGFloat dWidth = ((destSize.width - newWidth) / 2.0f);
    CGFloat dHeight = ((destSize.height - newHeight) / 2.0f);
    CGRect rect = CGRectMake (dWidth, dHeight, newWidth, newHeight);
    return rect;
}

CG_INLINE CGRect CGRectCenteredInRect(CGRect rect, CGRect mainRect)
{
    CGFloat xOffset = CGRectGetMidX(mainRect)-CGRectGetMidX(rect);
    CGFloat yOffset = CGRectGetMidY(mainRect)-CGRectGetMidY(rect);
    return CGRectOffset(rect, xOffset, yOffset);
}

CG_INLINE CGRect CGRectCenteredSizeInRect(CGSize size, CGRect mainRect)
{
    CGFloat xOffset = CGRectGetMidX(mainRect) - (size.width / 2.f);
    CGFloat yOffset = CGRectGetMidY(mainRect) - (size.height / 2.f);
    return CGRectFromPointAndSize(CGPointMake(xOffset, yOffset), size);
}

#pragma mark - CGPoint

CG_INLINE CGPoint CGPointFromCenterOfRect(CGRect rect)
{
    CGPoint point;
    point.x = rect.size.width / 2.f + rect.origin.x;
    point.y = rect.size.height / 2.f + rect.origin.y;
    return point;
}

#pragma mark - CGSize 

CG_INLINE CGSize CGSizeAspectSizeOfSizeForWidth(CGSize originSize, CGFloat widthToFit)
{
    CGSize size = originSize;
    
    if (originSize.width >= widthToFit) {
        // change content size only if image width more than view size
        CGFloat k = originSize.height / originSize.width;
        CGFloat h = k * widthToFit;
        size = CGSizeMake(widthToFit, h);
    }
    
    return size;
}

CG_INLINE CGSize CGSizeAspectFitSizeInBoundsSize(CGSize size, CGSize boundSize)
{
    CGFloat originScale = size.width / size.height;
    CGFloat boundScale = boundSize.width / boundSize.height;
    CGSize newSize = size;
    if (originScale > boundScale) {
        if (size.width > boundSize.width) {
            newSize.width = boundSize.width;
            newSize.height = boundSize.width / originScale;
        }
    } else {
        if (size.height > boundSize.height) {
            newSize.height = boundSize.height;
            newSize.width = originScale * boundSize.height;
        }
    }
    
    return newSize;
}