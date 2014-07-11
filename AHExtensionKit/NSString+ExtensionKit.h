//
//  NSString+ExtensionKit.h
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import <Foundation/Foundation.h>

#define frmtStr(__FORMAT__, ...) ([NSString stringWithFormat:@"%@",[NSString stringWithFormat:__FORMAT__, ##__VA_ARGS__]])

@interface NSString (ExtensionKit)

#pragma mark - initializer
+ (NSString *)localizedStringFromBool:(BOOL)b;
+ (NSString *)fromInt:(int)val;
+ (NSString *)fromObject:(id)object;

#pragma mark - modifications
- (NSString *)lowerCaseFirstLetter;
- (NSString *)upperCaseFirstLetter;
- (NSDate *)convertToDate;

#pragma mark - checking
- (BOOL)containsString:(NSString *)substring;
- (BOOL)notEmpty;
- (BOOL)isValidEmail;
- (BOOL)isDoubleValue;
- (BOOL)isIntValue;

#pragma mark - Utils 
+ (NSString *)createUUID;

#pragma mark - Size
- (CGFloat)heightForWidth:(CGFloat)width withFont:(UIFont *)font;

@end
