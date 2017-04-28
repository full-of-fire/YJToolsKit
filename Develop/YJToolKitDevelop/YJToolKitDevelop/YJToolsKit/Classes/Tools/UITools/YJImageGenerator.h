//
//  YJImageGenerator.h
//  IIMediaNews
//
//  Created by yj on 17/3/10.
//  Copyright © 2017年 iimedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YJImageGenerator : NSObject
+ (void)imageGeneratorWithVideoURL:(NSURL*)videoURL completeHandler:(void(^)(UIImage* image))completeHandler;
@end
