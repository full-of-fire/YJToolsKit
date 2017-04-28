//
//  YJLocationManager.h
//  爆料功能Demo
//
//  Created by yj on 17/3/3.
//  Copyright © 2017年 yj. All rights reserved.
// 注意这个定位需要iOS8以及以上

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
typedef NS_ENUM(NSUInteger,YJLocationState){

    YJLocationStateOrigin, // 原始状态，
    YJLocationStateUnenable, //定位服务不可用
    YJLocationStateUserDeni, // 用户拒绝定位
    YJLocationStateError, // 定位错误
    YJLocationStateSuccess, //  定位成功
    
    
};

@interface YJLocationManager : NSObject

@property (assign,nonatomic,readonly) YJLocationState state;

+ (instancetype)sharedLocationManger;

- (void)startLocationInController:(UIViewController*)locationController success:(void(^)(NSArray<CLLocation*> *locations))success fail:(void (^)(NSError*error,YJLocationState statue))fail;
@end
