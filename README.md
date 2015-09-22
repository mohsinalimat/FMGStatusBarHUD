# FMGStatusBarHUD
## 一拖 一导 一调用 轻松实现
快速方便的实现公司顶部statusBar弹框，你值得拥有

##自定义提示图片
```objc
[FMGStatusBarHUD showImage:[UIImage imageNamed:@"forward"] text:@"自定义提示图片"];
```
##自定义提示图片,直接传图片名字
```objc
[FMGStatusBarHUD showImageName:@"forward" text:@"测试一下"]
```
##显示成功
```objc
[FMGStatusBarHUD showSuccess:@"加载数据成功！"];
```
##显示错误
```objc
[FMGStatusBarHUD showError:@"登录失败！"];
```
##正在登陆
```objc
[FMGStatusBarHUD showLoading:@"正在登录中..."];
```
##隐藏
```objc
[FMGStatusBarHUD hide];
```
##随便显示的文字！！！
```objc
[FMGStatusBarHUD showText:@"随便显示的文字！！！！"];
```
