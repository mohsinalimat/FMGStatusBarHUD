//
//  ViewController.m
//  FMGStatusBarHeaderHUDDemo
//
//  Created by XMG on 15/9/22.
//  Copyright (c) 2015年 FMG. All rights reserved.
//

#import "ViewController.h"
#import "FMGStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (IBAction)success {
    [FMGStatusBarHUD showSuccess:@"加载数据成功！"];
}

- (IBAction)error {
    [FMGStatusBarHUD showError:@"登录失败！"];
}

- (IBAction)loading {
    [FMGStatusBarHUD showLoading:@"正在登录中..."];
}

- (IBAction)hide {
    [FMGStatusBarHUD hide];
}

- (IBAction)normal {
    [FMGStatusBarHUD showText:@"随便显示的文字！！！！"];
}



@end
