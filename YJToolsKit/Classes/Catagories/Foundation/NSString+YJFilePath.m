//
//  NSString+YJFilePath.m
//  IIMediaNews
//
//  Created by yj on 16/3/21.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import "NSString+YJFilePath.h"

@implementation NSString (YJFilePath)

+(NSString*)yj_getHomePath {

    return NSHomeDirectory();
}

+(NSString*)yj_getDocumentPath {

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    
    
    return  [paths firstObject];
}

+(NSString*)yj_getCachesPath {

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    return [paths firstObject];
    
}

+(NSString*)yj_getTempPath {

    return NSTemporaryDirectory();
}


+(NSString*)yj_savePathWithKey:(NSString *)key {

    
    NSString *mainPath = [self yj_getDocumentPath];
    
    NSString *savePath = [mainPath stringByAppendingPathComponent:key];
    
    return savePath;
}


@end
