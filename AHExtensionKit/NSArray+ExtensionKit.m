//
//  NSArray+ExtensionKit.m
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import "NSArray+ExtensionKit.h"
#import "NSString+ExtensionKit.h"

@implementation NSArray (ExtensionKit)

- (BOOL)notEmpty {
    return (self.count > 0);
}

- (BOOL)isEmpty {
    return (self.count == 0);
}

- (NSArray *)arrayOfFieldValuesWithFieldName:(NSString *)fieldName distinct:(BOOL)distinct {
    // make array of some object fields
    // if some entity have no this field NSNull will added to result array
    NSArray *result = @[];
    if (([self count] > 0) && fieldName.notEmpty) {
        NSMutableArray *resultArray = [NSMutableArray array];
        for (id obj in self) {
            
            id fieldValue = nil;
            if ([fieldName containsString:@"."]) {
                NSArray *keypaths = [fieldName componentsSeparatedByString:@"."];
                fieldValue = obj;
                for (NSString *pathPart in keypaths) {
                    fieldValue = [fieldValue valueForKey:pathPart];
                }
            } else {
                fieldValue = [obj valueForKey:fieldName];
            }
            
            if (!fieldValue) {
                fieldValue = [NSNull null];
            }
            if (distinct) {
                if (![resultArray containsObject:fieldValue]) {
                    [resultArray addObject:fieldValue];
                }
            } else {
                // no distinct
                [resultArray addObject:fieldValue];
            }
            
        }
        result = [NSArray arrayWithArray:resultArray];
    }
    
    return result;
}


@end
