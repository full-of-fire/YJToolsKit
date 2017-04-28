//
//  NSString+YJHtml.m
//  IIMediaNews
//
//  Created by yj on 16/9/5.
//  Copyright © 2016年 iimedia. All rights reserved.
//

#import "NSString+YJHtml.h"

@implementation NSString (YJHtml)

+ (NSMutableArray*)yj_filtrateImgTagWithHTMLContentString:(NSString *)htmlContentString {

    
    
    //    DDLOG_CURRENT_METHOD;
    NSString *urlPattern = @"<img[^>]+?src=[\"']?([^>'\"]+)[\"']?";
    //    NSString *urlPattern = @"src\\s*=\\s*\"?(.*?)(\"|>|\\s+)"; // 找到所有的src
    NSError *error = [NSError new];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:urlPattern options:NSRegularExpressionCaseInsensitive error:&error ];
    
    //match 这块内容非常强大
    NSUInteger count =[regex numberOfMatchesInString:htmlContentString options:NSMatchingReportCompletion range:NSMakeRange(0, [htmlContentString length])];//匹配到的次数
    
    NSMutableArray *results = [NSMutableArray array];
    
    if(count > 0){
        NSArray* matches = [regex matchesInString:htmlContentString options:NSMatchingReportCompletion range:NSMakeRange(0, [htmlContentString length])];
        
        for (NSTextCheckingResult *match in matches) {
            
            NSInteger count = [match numberOfRanges];//匹配项
            for(NSInteger index = 0;index < count;index++){
                NSRange halfRange = [match rangeAtIndex:index];
                if (index == 1) {
                    [results addObject:[htmlContentString substringWithRange:halfRange]];
                }
            }
        }//遍历后可以看到三个range，1、为整体。2、为([\\w-]+\\.)匹配到的内容。3、(/?[\\w./?%&=-]*)匹配到的内容
    }
    
    
    return results;

}

@end
