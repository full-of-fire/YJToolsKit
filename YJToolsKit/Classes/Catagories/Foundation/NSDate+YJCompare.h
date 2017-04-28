//
//  NSDate+YJCompare.h
//  IIMediaNews
//
//  Created by yj on 16/5/23.
//  Copyright © 2016年 iimedia. All rights reserved.
// 时间比较的分类

#import <Foundation/Foundation.h>

@interface NSDate (YJCompare)

// 转为标准的时间戳yyyy-MM-dd HH:mm:ss
- (NSString*)yj_dateString;


// 时间戳字符串转为NSDate
+(NSDate*)yj_DateFromString:(NSString*)dateString;


// 比较与当前时间的差值
+ (NSTimeInterval)yj_compareCurrentDateWithDate:(NSDate*)compareDate;

@end
