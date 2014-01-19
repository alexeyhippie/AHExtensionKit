//
//  NSArray+ExtensionKit.h
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ExtensionKit)

- (NSArray *)arrayOfFieldValuesWithFieldName:(NSString *)fieldName distinct:(BOOL)distinct;

- (BOOL)notEmpty;

@end
