//
//  NSDate+ExtensionKit.m
//  AHExtensionKit
//
//  Created by Alexey Hippie on 19/01/14.
//  Copyright (c) 2014 Alexey Hippie. All rights reserved.
//

#import "NSDate+ExtensionKit.h"

@implementation NSDate (ExtensionKit)

#pragma mark - Initializers

+ (NSDate *)zeroDate {
    return [NSDate dateWithTimeIntervalSince1970:0];
}

+ (NSDate *)now {
    return [NSDate date];
}

+ (NSDate *)dateWithSystemTimezone {
    NSDate *date = [NSDate date];
    NSTimeZone *tz = [NSTimeZone systemTimeZone];
    date = [date dateByAddingTimeInterval:tz.secondsFromGMT];
    
    return date;
}

+ (NSDate *)date:(NSDate *)date withTime:(NSDate *)time {
    NSDate *result = nil;
    if (!date) {
        date = [NSDate date];
    }
    if (!time) {
        time = [NSDate date];
    }
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateComponents *dc = [cal components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    NSDateComponents *tc = [cal components:NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit fromDate:time];
    dc.hour = tc.hour;
    dc.minute = tc.minute;
    dc.second = tc.second;
    result = [cal dateFromComponents:dc];
    return result;
}

+ (NSDate *)dateWithYear:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec {    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    dc.year = year;
    dc.month = month;
    dc.day = day;
    dc.hour = hour;
    dc.minute = min;
    dc.second = sec;
    
    return [cal dateFromComponents:dc];
}

#pragma mark - Comporators

- (BOOL)isSameDaywithDate:(NSDate *)secondDate inDefaultLocal:(BOOL)isLocal {
    BOOL result = NO;
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    if (!isLocal) {
        cal.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    }
    
    NSDateComponents *selfdc = [cal components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    NSDateComponents *seconddc = [cal components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:secondDate];
    
    if (selfdc.era == seconddc.era &&
        selfdc.year == seconddc.year &&
        selfdc.month == seconddc.month &&
        selfdc.day == seconddc.day) {
        
        result = YES;
    }
    
    return result;
}

- (BOOL)isEarlierThan:(NSDate *)date {
    BOOL result = NO;
    // default value is NO, because if date is nil
    // we mean it as a most earlier date
    
    if (date) {
        if ([self timeIntervalSinceDate:date] < 0) {
            result = YES;
        }
    }
    
    return result;
}

- (BOOL)isEarlierThanNow {
    return [self isEarlierThan:[NSDate date]];
}

- (BOOL)isLaterThan:(NSDate *)date {
    BOOL result = YES;
    // default value is NO, because if date is nil
    // we mean it as a most earlier date
    
    if (date) {
        if ([self timeIntervalSinceDate:date] <= 0) {
            result = NO;
        }
    }
    
    return result;
}

- (BOOL)isLaterThanNow {
    return [self isLaterThan:[NSDate date]];
}

#pragma mark - Modificators

- (NSDate *)dateRoundedToMinuteInterval:(NSInteger)minInterval andZeroSecond:(BOOL)zeroSecond {
    // round time to min interval
    // for example:
    // 1) time is 12:11, minInterval 15, method return date with time 12:15
    // 2) time is 12:11, minInterval 10, method return date with time 12:10
    // 3) time is 12:11, minInterval -1 (or 0 or 61 or (minInterval div 60 != 0)), method return 12:11
    // for point 3 - if minInterval is wrong (minInterval div 60 != 0), then minInterval = 1;
    NSDate *result = nil;
    if (minInterval == 0) {
        minInterval = 1;
    }
    if (60 % minInterval != 0) {
        minInterval = 1;
    }
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:(NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:self];
    NSInteger mins = comps.minute;
    CGFloat part = (float)mins / minInterval;
    CGFloat quater = nearbyint(part);
    NSInteger dif = (int)((quater * minInterval) - mins);
    
    if (zeroSecond) {
        result = [self dateByAddingTimeInterval:(dif * 60.0) - comps.second];
    } else {
        result = [self dateByAddingTimeInterval:(dif * 60.0)];
    }
    
    return result;
}

#pragma mark - Getters

- (NSInteger)secondsOfDay {
    NSInteger result = 0;
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateComponents *dc = [cal components:NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit fromDate:self];
    result = dc.second + dc.minute * 60 + dc.hour * 60 * 60;
    
    return result;
}

- (NSDate *)time {
    NSDate *result = nil;
    NSCalendar *cal = [NSCalendar currentCalendar];
    cal.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateComponents *dc = [cal components:NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit fromDate:self];
    result = [cal dateFromComponents:dc];
    return result;
}

@end
