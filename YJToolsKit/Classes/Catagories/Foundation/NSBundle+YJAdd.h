//
//  NSBundle+YJAdd.h
//  YJBaseKit
//
//  Created by yj on 17/4/28.
//  Copyright © 2017年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (YJAdd)

/**
 获取APP的版本号

 @return 版本号
 */
+ (NSString*)yj_appVersion;

/**
 获取APPbuild版本号

 @return build版本号
 */
+ (NSString*)yj_appBuildVersion;


@end
