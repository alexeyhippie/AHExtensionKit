//
//  NSDictionary+ExtensionKit.m
//  RockwoolCalculators
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Oggetto Web. All rights reserved.
//

#import "NSDictionary+ExtensionKit.h"
#import "NSArray+ExtensionKit.h"

@implementation NSDictionary (ExtensionKit)

#pragma mark - Checking

- (BOOL)notEmpty {
    return self.allKeys.notEmpty;
}

@end
