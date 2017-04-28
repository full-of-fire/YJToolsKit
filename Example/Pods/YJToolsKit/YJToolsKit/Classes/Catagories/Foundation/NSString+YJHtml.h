//
//  NSString+YJHtml.h
//  IIMediaNews
//
//  Created by yj on 16/9/5.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJHtml)

/**
 *  获取html中图片标签
 *
 *  @param htmlContentString html内容字符串
 *
 *  @return img标签数组
 */
+ (NSMutableArray*)yj_filtrateImgTagWithHTMLContentString:(NSString*)htmlContentString;

@end
