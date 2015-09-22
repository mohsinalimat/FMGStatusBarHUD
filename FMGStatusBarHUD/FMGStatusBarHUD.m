//
//  FMGStatusBarHUD.m
//  FMGStatusBarHUDDemo
//
//  Created by XMG on 15/9/22.
//  Copyright (c) 2015年 FMG. All rights reserved.
//

#import "FMGStatusBarHUD.h"

/**
 * 双下划线变量名为全局变量
 */

static UIWindow *__window;
static NSTimer *__timer;
/** HUD控件高度 */
static CGFloat const FMGWindowH = 20;
/** HUD控件的动画持续时间（出现/隐藏）*/
static CGFloat const FMGAnimationDuration = 0.25;
/** HUD控件的动画停留时间 */
static CGFloat const FMGHUDStayDuration = 1.5;

@implementation FMGStatusBarHUD
+ (void)showImageName:(NSString *)name text:(NSString *)text
{
    [self showImage:[UIImage imageNamed:name] text:text];
}
+ (void)showImage:(UIImage *)image text:(NSString *)text
{
    // 创建窗口
    __window = [[UIWindow alloc] init];
    __window.backgroundColor = [UIColor grayColor];
    __window.windowLevel = UIWindowLevelAlert;
    __window.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, FMGWindowH);
    __window.hidden = NO;
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = __window.bounds;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setImage:image forState:UIControlStateNormal];
    [__window addSubview:button];
    
    [UIView animateWithDuration: FMGAnimationDuration animations:^{
        CGRect frame = __window.frame;
        frame.origin.y = 0;
        __window.frame = frame;
    }];
    
    // 开启一个新的定时器
    __timer = [NSTimer scheduledTimerWithTimeInterval:FMGHUDStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
+ (void)showSuccess:(NSString *)text
{
    [self showImage:[UIImage imageNamed:@"FMGStatusBarHUD.bundle/success"] text:text];
}
+ (void)showError:(NSString *)text
{
    [self showImage:[UIImage imageNamed:@"FMGStatusBarHUD.bundle/error"] text:text];
}
+ (void)showLoading:(NSString *)text
{
    [__timer invalidate];
    __timer = nil;
    
    // 创建窗口
    __window = [[UIWindow alloc] init];
    __window.backgroundColor = [UIColor grayColor];
    __window.windowLevel = UIWindowLevelAlert;
    __window.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, FMGWindowH);
    __window.hidden = NO;
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = __window.bounds;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [__window addSubview:button];
    
    // 圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    loadingView.center = CGPointMake(button.titleLabel.frame.origin.x - 60, FMGWindowH * 0.5);
    [__window addSubview:loadingView];
    
    // 动画
    [UIView animateWithDuration:FMGAnimationDuration animations:^{
        CGRect frame = __window.frame;
        frame.origin.y =  0;
        __window.frame = frame;
    }];
    
}
+ (void)showText:(NSString *)text
{
    [self showImage:nil text:text];
}
+ (void)hide
{
    // 停止之前的定时器
    [__timer invalidate];
    __timer = nil;
    
    // 退出动画
    [UIView animateWithDuration:FMGAnimationDuration animations:^{
        CGRect rect = __window.frame;
        rect.origin.y = - FMGWindowH;
     } completion:^(BOOL finished) {
         __window = nil;
     }];
}

@end
