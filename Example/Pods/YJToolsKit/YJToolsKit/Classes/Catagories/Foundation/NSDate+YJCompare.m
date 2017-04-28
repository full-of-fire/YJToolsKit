//
//  NSDate+YJCompare.m
//  IIMediaNews
//
//  Created by yj on 16/5/23.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import "NSDate+YJCompare.h"

@implementation NSDate (YJCompare)

- (NSString*)yj_dateString {

    
    NSString *dataString = @"yyyy-MM-dd HH:mm:ss";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:dataString];
    
   return  [formatter stringFromDate:self];
}

+ (NSDate*)yj_DateFromString:(NSString *)dateString {

    
    
    NSString *formatString = @"yyyy-MM-dd HH:mm:ss";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:formatString];

    
    return [formatter dateFromString:dateString];
    
}

+ (NSTimeInterval)yj_compareCurrentDateWithDate:(NSDate*)compareDate {

    NSTimeInterval interval;
    
    interval = - [compareDate timeIntervalSince1970] + [[NSDate date] timeIntervalSince1970];
    
    return interval;
}

@end
