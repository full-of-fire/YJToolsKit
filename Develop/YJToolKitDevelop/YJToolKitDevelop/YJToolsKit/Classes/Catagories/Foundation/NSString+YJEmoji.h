//
//  NSString+YJEmoji.h
//  IIMediaNews
//
//  Created by yj on 16/9/8.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJEmoji)

/**
 *  判断字符中是否包含Emoji
 *
 *  @param string 字符串
 *
 *  @return 返回结果
 */
+ (BOOL)yj_stringContainsEmoji:(NSString *)string;
@end
