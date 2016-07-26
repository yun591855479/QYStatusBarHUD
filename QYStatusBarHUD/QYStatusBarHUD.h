//
//  QYStatusBarHUD.h
//  QYStatusBarHUDExample
//
//  Created by 胡文宽 on 16/7/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYStatusBarHUD : NSObject
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏
 */
+ (void)hide;
/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;


@end
