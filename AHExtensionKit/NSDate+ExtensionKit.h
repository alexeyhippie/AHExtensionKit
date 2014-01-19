//
//  NSDate+ExtensionKit.h
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ExtensionKit)

#pragma mark - Initializers
+ (NSDate *)zeroDate;
+ (NSDate *)dateWithSystemTimezone;
+ (NSDate *)date:(NSDate *)date withTime:(NSDate *)time;

#pragma mark - Comporators
- (BOOL)isSameDaywithDate:(NSDate *)secondDate inDefaultLocal:(BOOL)isLocal;
- (BOOL)isEarlierThan:(NSDate *)date;
- (BOOL)isEarlierThanNow;
- (BOOL)isLaterThan:(NSDate *)date;
- (BOOL)isLaterThanNow;

#pragma mark - Modificators
- (NSDate *)dateRoundedToMinuteInterval:(NSInteger)minInterval andZeroSecond:(BOOL)zeroSecond;

#pragma mark - Getters
- (NSInteger)secondsOfDay;
- (NSDate *)time;

@end
