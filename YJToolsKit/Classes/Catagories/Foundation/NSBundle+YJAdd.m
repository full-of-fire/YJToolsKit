//
//  NSBundle+YJAdd.m
//  YJBaseKit
//
//  Created by yj on 17/4/28.
//  Copyright © 2017年 yj. All rights reserved.
//

#import "NSBundle+YJAdd.h"

@implementation NSBundle (YJAdd)
+ (NSString*)yj_appVersion {

    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}
+ (NSString*)yj_appBuildVersion {

    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return version;
}
@end
