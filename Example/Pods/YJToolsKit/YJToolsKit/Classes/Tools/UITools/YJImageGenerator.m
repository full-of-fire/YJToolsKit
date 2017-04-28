//
//  YJImageGenerator.m
//  IIMediaNews
//
//  Created by yj on 17/3/10.
//  Copyright © 2017年 iimedia. All rights reserved.
//

#import "YJImageGenerator.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@implementation YJImageGenerator

+ (void)imageGeneratorWithVideoURL:(NSURL*)videoURL completeHandler:(void(^)(UIImage* image))completeHandler {

    //获取视频截图
    AVAssetImageGenerator *imageGenerater = [AVAssetImageGenerator assetImageGeneratorWithAsset:[AVURLAsset assetWithURL:videoURL]];
    CMTime time = CMTimeMake(1, 1);
    NSValue *timeValue = [NSValue valueWithCMTime:time];
    [imageGenerater generateCGImagesAsynchronouslyForTimes:@[timeValue] completionHandler:^(CMTime requestedTime, CGImageRef  _Nullable image, CMTime actualTime, AVAssetImageGeneratorResult result, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (completeHandler) {
                
                completeHandler([UIImage imageWithCGImage:image]);
            }
        });
    }];

}
@end
