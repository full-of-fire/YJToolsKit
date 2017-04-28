//
//  UIColor+YJHexString.h
//  IIMediaNews
//
//  Created by yj on 16/3/15.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YJHexString)
// 十六进行字符串转为颜色
+ (UIColor *) yj_colorWithHexString: (NSString *) stringToConvert;
@end
