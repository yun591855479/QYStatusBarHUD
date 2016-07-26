//
//  QYStatusBarHUD.m
//  QYStatusBarHUDExample
//
//  Created by 胡文宽 on 16/7/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYStatusBarHUD.h"
#define XMGMessageFont [UIFont systemFontOfSize:12]
// 消息的停留时间
static CGFloat const XMGMessageDuration = 2.0;
// 消息显示/隐藏的动画时间
static CGFloat const XMGAnimationDuration = 0.25;

@implementation QYStatusBarHUD

/**
 *  全局的窗口
 */
static UIWindow *window_;

/**
 *  定时器
 */
static NSTimer *timer_;
/**
 *  显示窗口
 */
+ (void)showWindow{
    //    frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //    显示数据
    //    为避免频繁创建窗口的窗口残留，先隐藏之前的窗口
    window_.hidden = YES;
    //    新窗口创建
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor  = [UIColor colorWithRed:100 green:100 blue:100 alpha:0.9];
    //    选择最高级别的窗口
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    //    动画
    frame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image{
    [self showWindow];
    
    //    停止定时器
    [timer_ invalidate];
    //    也可以将 timer_ = nil; 但由于下面又将time_ 重新赋值，所以此处可以略去
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    如果没有图片，就无需设置图片相关信息
    if (image) {
        [button setImage:image
                forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    [button setTitle:msg forState:UIControlStateNormal];
    button.frame = window_.bounds;
    button.titleLabel.font = XMGMessageFont;
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [window_ addSubview:button];
    
    //    NSLog(@"%@",NSStringFromCGRect(window_.frame));
    
    
    //    定时器
    //     无需重复做什么，repeats的参数为NO。
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"QYStatusBarHUD.bundle/check"]];
}




/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"QYStatusBarHUD.bundle/error"]];
}

/**
 *  显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg{
    [self showWindow];
    
    //     正在加载无需两秒后隐藏，则取消定时器
    [timer_ invalidate];
    timer_ = nil;
    
    UILabel *lbl = [[UILabel alloc] init];
    lbl.font = XMGMessageFont;
    lbl.frame = window_.bounds;
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.text = msg;
    lbl.textColor = [UIColor darkGrayColor];
    [window_ addSubview:lbl];
    
    CGFloat lblW = [msg sizeWithAttributes:@{NSFontAttributeName : XMGMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - lblW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = CGPointMake(centerX, centerY);
    
    [indicator startAnimating];
    [window_ addSubview:indicator];
}

/**
 *  隐藏
 */
+ (void)hide{
    
    [UIView animateWithDuration:XMGMessageDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        if (finished) {
            window_ = nil;
            timer_ = nil;
        }
    }];
    
    
}

@end
