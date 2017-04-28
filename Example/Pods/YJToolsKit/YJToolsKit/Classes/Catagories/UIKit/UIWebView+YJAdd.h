//
//  UIWebView+YJAdd.h
//  IIMediaNews
//
//  Created by yj on 17/3/22.
//  Copyright © 2017年 iimedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (YJAdd)
- (BOOL)hasVideo;
- (NSString *)getVideoTitle;
- (double)getVideoDuration;
- (double)getVideoCurrentTime;

- (int)play;
- (int)pause;
- (int)resume;
- (int)stop;
@end
