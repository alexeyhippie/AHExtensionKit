//
//  NSObject+ExtensionKit.m
//  CATTORMobile
//
//  Created by Alexey Hippie on 08/05/14.
//  Copyright (c) 2014 CATsoft. All rights reserved.
//

#import "NSObject+ExtensionKit.h"

@implementation NSObject (ExtensionKit)

- (NSString *)toString {
    return [NSString stringWithFormat:@"%@", self];
}

#pragma mark - Utils

+ (id)notNil:(id)object replacer:(id)replacer {
    if (!replacer) {
        replacer = @"";
    }
    return object ? object : replacer;
}

@end
