//
//  UITextField+YJAdded.m
//  注册登录模块UI
//
//  Created by yj on 16/3/30.
//  Copyright © 2016年 yj. All rights reserved.
//

#import "UITextField+YJAdded.h"

@implementation UITextField (YJAdded)


- (void)yj_setPlaceholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font {

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:placeholder];
    
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:(color?color:([UIColor grayColor])) range:NSMakeRange(0, attributedString.length)];
    
    [attributedString addAttribute:NSFontAttributeName value:(font?font:[UIFont systemFontOfSize:17]) range:NSMakeRange(0, attributedString.length)];
    
    self.attributedPlaceholder = attributedString;
}

@end
