//
//  NSObject+ExtensionKit.h
//  CATTORMobile
//
//  Created by Alexey Hippie on 08/05/14.
//  Copyright (c) 2014 CATsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isEmpty(obj) [NSObject isEmpty:(obj)]
#define notNilWithReplacer(obj, areplacer) [NSObject notNil:(obj) replacer:(areplacer)]
#define notNil(obj) [NSObject notNil:(obj) replacer:nil]

@interface NSObject (ExtensionKit)

#pragma marl - Casting
- (NSString *)toString;

#pragma marl - Utils

/*
 Returns object if it's not nil, else - replacer
 Replacer shouldn't be nil in this way
 Cosy use with macros notNil
 
 Example:
    NSDictionary *bar = @{@"foo": notNilWithReplacer(someObj, @"")};
 will guarantied create a bar dictionary
 
 If no replacer then @"" will passed
 Then you can use noNil macros:
 NSDictionary *bar = @{@"foo": notNil(someObj)};
 **/
+ (id)notNil:(id)object replacer:(id)replacer;

/*
 Checks if object not nil and trying to send isEmpty message if yes. 
 Used for ExtensionKit NSString, NSArray and NSDictionary;
 If object is nil - NO returned;
 If object exist but not respond to isEmpty message - YES returned
 If object exist and responds to isEmpty selector - result of isEmpty returned
 Macros: isEmpty(obj);
 **/
+ (BOOL)isEmpty:(id)object;

/* 
 return class name as a NSString
 **/
+ (NSString *)className;
- (NSString *)className;

@end
