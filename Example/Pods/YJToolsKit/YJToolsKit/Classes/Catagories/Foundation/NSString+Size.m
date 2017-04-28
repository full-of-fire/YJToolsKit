//
//  NSString+Size.m
//  房客
//
//  Created by yangjie on 15/12/9.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)stringHeightWithMaxWidth:(CGFloat)maxWidth andFont:(UIFont*)font  {
    __weak typeof(self) weakSelf = self;
   return  [weakSelf boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (CGSize)stringWidthWithMaxHeight:(CGFloat)maxHeight andFont:(UIFont*)font {
    __weak typeof(self) weakSelf = self;
    return  [weakSelf boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
