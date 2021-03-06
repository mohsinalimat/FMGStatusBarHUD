//
//  FMGStatusBarHUD.h
//  FMGStatusBarHUDDemo
//
//  Created by XMG on 15/9/22.
//  Copyright (c) 2015年 FMG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMGStatusBarHUD : NSObject


/**
 * 显示图片+文字信息
 */
+ (void)showImage:(UIImage *)image text:(NSString *)text;

/**
 * 显示图片+文字信息
 */
+ (void)showImageName:(NSString *)name text:(NSString *)text;

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)text;
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)text;
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)text;

/**
 * 显示普通信息
 */
+ (void)showText:(NSString *)text;

/**
 * 隐藏
 */
+ (void)hide;
@end
