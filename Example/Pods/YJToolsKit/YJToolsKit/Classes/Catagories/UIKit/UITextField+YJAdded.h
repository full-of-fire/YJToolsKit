//
//  UITextField+YJAdded.h
//  注册登录模块UI
//
//  Created by yj on 16/3/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YJAdded)


/**
 *  设置提示文字颜色和字体
 *
 *  @param placeholder 提示文字
 *  @param color       颜色
 *  @param font        字体大小
 */
- (void)yj_setPlaceholder:(NSString*)placeholder color:(UIColor*)color font:(UIFont*)font;

@end
