//
//  NSString+YJFilePath.h
//  IIMediaNews
//
//  Created by yj on 16/3/21.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJFilePath)

/**
 *  获取doucment路径
 *
 *  @return doucment路径
 */
+(NSString*)yj_getDocumentPath;

/**
 *  获取主路径
 *
 *  @return 主路径
 */
+(NSString*)yj_getHomePath;

/**
 *  caches路径
 *
 *  @return
 */
+(NSString*)yj_getCachesPath;
/**
 *  获取临时文件
 *
 *  @return temp文件
 */

+(NSString*)yj_getTempPath;



/**
 *  通过key获取文件路径
 *
 *  @param key key
 *
 *  @return 文件路径
 */
+(NSString*)yj_savePathWithKey:(NSString*)key;

@end
