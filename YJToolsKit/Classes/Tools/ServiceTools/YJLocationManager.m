//
//  YJLocationManager.m
//  爆料功能Demo
//
//  Created by yj on 17/3/3.
//  Copyright © 2017年 yj. All rights reserved.
//

#import "YJLocationManager.h"
#import <MapKit/MapKit.h>
@interface YJLocationManager()<CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager *locationManger;

@property (copy,nonatomic) void (^locationSuccessBlock)(NSArray<CLLocation*> *locations);
@property (copy,nonatomic) void (^locationFailBlock)(NSError*error,YJLocationState statue);

@property (weak,nonatomic) UIViewController *showInController;
@end

@implementation YJLocationManager
+ (instancetype)sharedLocationManger {

    static YJLocationManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locationManger = [[CLLocationManager alloc] init];
        _locationManger.delegate = self;
        _locationManger.desiredAccuracy = kCLLocationAccuracyBest;
        _state = YJLocationStateOrigin;
    }
    return self;
}


- (void)startLocationInController:(UIViewController*)locationController success:(void(^)(NSArray<CLLocation*> *locations))success fail:(void (^)(NSError*error,YJLocationState statue))fail{

    
    self.locationSuccessBlock = [success copy];
    self.locationFailBlock = [fail copy];

    if (![CLLocationManager locationServicesEnabled]) {
        
        _state = YJLocationStateUnenable;
        
        if (fail) {
            
            fail(nil,YJLocationStateUnenable);
        }
        
        return;
    }
    
   

     _showInController = locationController;
    CLAuthorizationStatus authorizationStauts =  [CLLocationManager authorizationStatus];
    switch (authorizationStauts) {
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusNotDetermined:
        {
            
            //请求授权
            [_locationManger requestWhenInUseAuthorization];
        }
            
            break;
        case kCLAuthorizationStatusDenied:{
            
            
            
            _state = YJLocationStateUserDeni;
            
            if (self.locationFailBlock) {
                
                self.locationFailBlock(nil,YJLocationStateUserDeni);
            }
            //拒绝授权，这样可以弹出窗口跳到设置界面去
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否开启定位" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancleAction  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //定位服务设置界面
                NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
                if([[UIApplication sharedApplication] canOpenURL:url])
                {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }];
            
            [alert addAction:cancleAction];
            [alert addAction:sureAction];
            
            
            [_showInController presentViewController:alert animated:YES completion:nil];
            
            
        }
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:{
            
            //开始定位
            [_locationManger startUpdatingLocation];
        }
            break;
        
        default:
            break;
    }

    
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {

    
    CLAuthorizationStatus authorizationStauts =  [CLLocationManager authorizationStatus];
    switch (authorizationStauts) {
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusNotDetermined:
        {
            
            //请求授权
            [_locationManger requestWhenInUseAuthorization];
        }
            
            break;
        case kCLAuthorizationStatusDenied:{
            
            
            
            _state = YJLocationStateUserDeni;
            
            if (self.locationFailBlock) {
                
                self.locationFailBlock(nil,YJLocationStateUserDeni);
            }
            //拒绝授权，这样可以弹出窗口跳到设置界面去
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否开启定位" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancleAction  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                //定位服务设置界面
                NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
                if([[UIApplication sharedApplication] canOpenURL:url])
                {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }];
            
            [alert addAction:cancleAction];
            [alert addAction:sureAction];
            
            
            [_showInController presentViewController:alert animated:YES completion:nil];
            
            
        }
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:{
            
            //开始定位
            [_locationManger startUpdatingLocation];
        }
            break;
        default:
            break;
    }

    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {

    NSLog(@"获取定位错误");
    _state = YJLocationStateError;
    if (self.locationFailBlock) {
        
        self.locationFailBlock(error,YJLocationStateError);
    }
    [_locationManger stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    NSLog(@"定位成功");
    _state = YJLocationStateSuccess;
    if (self.locationSuccessBlock) {
        
        self.locationSuccessBlock(locations);
    }
    [_locationManger stopUpdatingLocation];
}

@end
