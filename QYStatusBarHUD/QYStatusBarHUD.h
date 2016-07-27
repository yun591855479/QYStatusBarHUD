//
//  QYStatusBarHUD.h
//  QYStatusBarHUDExample
//
//  Created by 胡文宽 on 16/7/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//
//  使用提示：由于本指示器是一个窗口，在没有设置其rootViewController时，不要在viewDidLoad方法里直接调用本框架的方法。可以选择在一个button的点击事件或者点击屏幕的事件中调用本框架的方法。

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
