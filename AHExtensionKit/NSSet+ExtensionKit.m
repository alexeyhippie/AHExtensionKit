//
//  NSSet+ExtensionKit.m
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import "NSSet+ExtensionKit.h"
#import "NSArray+ExtensionKit.h"

@implementation NSSet (ExtensionKit)

- (NSSet *)setOfFieldValuesWithFieldName:(NSString *)fieldName distinct:(BOOL)distinct {
    // make array of some entity fields
    // if some entity have no this field NSNull abject will added to result array
    NSSet *result = [NSSet set];
    if (([self count] > 0) && fieldName) {
        NSArray *sorted = [self sortedArrayUsingDescriptors:@[]];
        NSArray *values = [sorted arrayOfFieldValuesWithFieldName:fieldName distinct:distinct];
        result = [NSSet setWithArray:values];
    }
    
    return result;
}

@end
