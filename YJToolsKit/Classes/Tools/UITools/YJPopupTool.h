//
//  YJPopupTool.h
//  SVProgress的封装使用
//
//  Created by yj on 17/4/27.
//  Copyright © 2017年 yj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
@interface YJPopupTool : NSObject
#pragma mark HUD
/**
 显示加载中的...HUD
 */
+ (void)showHUDLoading;

/**
 显示提示信息并默认1.3s隐藏

 @param message 提示信息内容
 */
+ (void)showHUDInfoWithMessage:(NSString*)message;

/**
 显示提示信息并隐藏

 @param message 提示内容
 @param delay   延迟隐藏时间
 */
+ (void)showHUDInfoWithMessage:(NSString *)message hideDelay:(NSTimeInterval)delay;


/**
 显示加载进度

 @param progress 进度
 */
+ (void)showHUDProgress:(float)progress;

/**
 显示加载进度

 @param progress 进度
 @param status   进度文字描述
 */
+ (void)showHUDProgress:(float)progress status:(NSString*)status;

/**
 显示加载成功，并1.3s隐藏

 @param message 成功提示信息
 */
+ (void)showHUDSuccessWithMessage:(NSString*)message;
+ (void)showHUDSuccessWithMessage:(NSString*)message hideDelay:(NSTimeInterval)delay;



/**
 显示失败HUD，1.3s后隐藏

 @param message 失败提示信息
 */
+ (void)showHUDFailWithMessage:(NSString*)message;
+ (void)showHUDFailWithMessage:(NSString*)message hideDelay:(NSTimeInterval)delay;

/**
 隐藏
 */
+ (void)hideHUD;

/**
 延时隐藏

 @param delay 延时时间
 */
+ (void)hideHUDDelay:(NSTimeInterval)delay;

#pragma mark - Alert

/**
 显示弹窗(只支持IOS8及以上)

 @param title            标题
 @param message          信息
 @param cancleTitl       取消标题
 @param otherButtonTitle 另外标题
 @param cancleCallBack   取消
 @param sureCallBack     确定
 */
+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message cancleTitle:(NSString*)cancleTitl sureButtonTitle:(NSString*)otherButtonTitle cancleCallBack:(void(^)())cancleCallBack sureCallBack:(void(^)())sureCallBack;

/**
 显示actionSheet

 @param title             标题
 @param cancleButtonTitle 取消标题
 @param callBack          点击回调，index=0为最上面的按钮，以此类推
 @param firstButtonTitle  其他按钮参数
 */
+ (void)showActionSheetWithTitle:(NSString*)title cancelButtonTitle:(NSString*)cancleButtonTitle callBack:(void(^)(NSUInteger index))callBack otherButtonTitles:(NSString*)firstButtonTitle,... NS_REQUIRES_NIL_TERMINATION;

#pragma mark - Prompt
/**
 显示刷新提示

 @param message  提醒信息
 @param yPostion y坐标
 */
+ (void)showPromptWithMessage:(NSString*)message yPostion:(CGFloat)yPostion;

+ (void)hidePrompt;

@end
