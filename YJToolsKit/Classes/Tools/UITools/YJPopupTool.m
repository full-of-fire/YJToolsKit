//
//  YJPopupTool.m
//  SVProgress的封装使用
//
//  Created by yj on 17/4/27.
//  Copyright © 2017年 yj. All rights reserved.
//

#import "YJPopupTool.h"

#import <UIKit/UIKit.h>
@interface YJPromptLabel : UILabel

@end

@implementation YJPromptLabel


+ (instancetype)sharedLabel {

    static YJPromptLabel *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        instance.backgroundColor  =[UIColor colorWithRed:212/255.0 green:233/255.0 blue:246/255.0 alpha:1.0];
        instance.textAlignment = NSTextAlignmentCenter;
        instance.textColor = [UIColor colorWithRed:61/255.0 green:132/255.0 blue:182/255.0 alpha:1.0];
        instance.font = [UIFont systemFontOfSize:14];
    });
    
    return instance;
}

@end


@implementation YJPopupTool

+ (void)load {

    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}

+ (void)showHUDLoading {

    [SVProgressHUD show];
}

+ (void)showHUDInfoWithMessage:(NSString *)message {

    [self showHUDInfoWithMessage:message hideDelay:1.0];
}

+ (void)showHUDInfoWithMessage:(NSString *)message hideDelay:(NSTimeInterval)delay {

    [SVProgressHUD showInfoWithStatus:message];
    
    [SVProgressHUD dismissWithDelay:delay];
    
}

+ (void)showHUDProgress:(float)progress {

    [self showHUDProgress:progress status:nil];
}

+ (void)showHUDProgress:(float)progress status:(NSString*)status {

    [SVProgressHUD showProgress:progress status:status];
}

+ (void)showHUDSuccessWithMessage:(NSString *)message {

    
    [self showHUDSuccessWithMessage:message hideDelay:1.3];
}

+ (void)showHUDSuccessWithMessage:(NSString *)message hideDelay:(NSTimeInterval)delay {

    [SVProgressHUD showSuccessWithStatus:message];
    [SVProgressHUD dismissWithDelay:delay];
}


+ (void)showHUDFailWithMessage:(NSString *)message {

    [self showHUDFailWithMessage:message hideDelay:1.3];
}

+ (void)showHUDFailWithMessage:(NSString*)message hideDelay:(NSTimeInterval)delay {

    [SVProgressHUD showErrorWithStatus:message];
    [SVProgressHUD dismissWithDelay:delay];
}

+ (void)hideHUD {

    [SVProgressHUD dismiss];
}
+ (void)hideHUDDelay:(NSTimeInterval)delay {

    [SVProgressHUD dismissWithDelay:delay];
}

+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message cancleTitle:(NSString*)cancleTitl sureButtonTitle:(NSString*)otherButtonTitle cancleCallBack:(void(^)())cancleCallBack sureCallBack:(void(^)())sureCallBack {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancnelAction =[UIAlertAction actionWithTitle:cancleTitl style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       
        if (cancleCallBack) {
            
            cancleCallBack();
        }
    }];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        if (sureCallBack) {
            
            sureCallBack();
        }
    }];
    
    [alertController addAction:cancnelAction];
    [alertController addAction:sureAction];
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}


+ (void)showActionSheetWithTitle:(NSString*)title cancelButtonTitle:(NSString*)cancleButtonTitle callBack:(void(^)(NSUInteger index))callBack otherButtonTitles:(NSString*)firstButtonTitle,... NS_REQUIRES_NIL_TERMINATION  {

    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSMutableArray *argArray = [NSMutableArray array];
    
    
    
    if(firstButtonTitle&&firstButtonTitle.length>0){
        
        [argArray addObject:firstButtonTitle];
    }
    
    va_list args;
    va_start(args, firstButtonTitle);
    NSString *arg;
    if (firstButtonTitle) {
        
        while ((arg = va_arg(args, NSString*))) {
            
            [argArray addObject:arg];
        }
    }
    
    va_end(args);
    
    [argArray addObject:cancleButtonTitle];
    [argArray enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        
        UIAlertActionStyle style;
        if(idx == argArray.count - 1){
        
            style = UIAlertActionStyleCancel;
        }
        else{
        
            style = UIAlertActionStyleDefault;
        }
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           
            if(callBack){
            
                callBack(idx);
            }
        }];
        
        [actionSheetController addAction:action];
        
    }];
    
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:actionSheetController animated:YES completion:nil];


}


+ (void)showPromptWithMessage:(NSString*)message yPostion:(CGFloat)yPostion {

    
    
    YJPromptLabel *promptLabel =[YJPromptLabel sharedLabel];
    CGRect frame = promptLabel.frame;
    
    frame.origin.y = yPostion;
    promptLabel.frame = frame;
    promptLabel.text = message;
    promptLabel.alpha = 0.0;
    
    [[[UIApplication sharedApplication].windows lastObject] addSubview:promptLabel];
    

    promptLabel.transform = CGAffineTransformMakeScale(0.8, 0.8);
    
    [UIView animateWithDuration:1.3 delay:0.0 usingSpringWithDamping:0.4 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       
        promptLabel.alpha = 1.0;
       
        promptLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
        
    } completion:^(BOOL finished) {
        
        promptLabel.transform = CGAffineTransformIdentity;
        promptLabel.alpha = 0.0;
        [promptLabel removeFromSuperview];
        
    }];
    
    
    
}

+ (void)hidePrompt {

    [[YJPromptLabel sharedLabel] removeFromSuperview];
}


@end
