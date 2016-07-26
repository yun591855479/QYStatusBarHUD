//
//  ViewController.m
//  QYStatusBarHUDExample
//
//  Created by 胡文宽 on 16/7/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 显示成功信息
- (IBAction)success {
    [QYStatusBarHUD showSuccess:@"加载成功"];
}
// 显示失败信息
- (IBAction)error:(id)sender {
    [QYStatusBarHUD showError:@"加载失败"];
}
//显示正在加载
- (IBAction)loading:(id)sender {
    [QYStatusBarHUD showLoading:@"正在加载"];
    
}
// 隐藏指示器
- (IBAction)hide:(id)sender {
    [QYStatusBarHUD hide];
}
// 自定义文字及图片
- (IBAction)normalText:(id)sender {
    //    [XMGStatursBarHUD showMessage:@"普通文字" image:[UIImage imageNamed:@"error"]];
    [QYStatusBarHUD showMessage:@"自定义文字" image:nil];
    
}
@end
