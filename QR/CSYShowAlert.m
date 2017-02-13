//
//  CSYShowView.m
//  QR
//
//  Created by hong chen on 2017/2/13.
//  Copyright © 2017年 广东骆驼服饰有限公司. All rights reserved.
//

#import "CSYShowAlert.h"

@implementation CSYShowAlert

/** 显示定制的提示框
 第一个参数：要提示的信息
 第二个参数：当前控制器
 第三个参数：要执行的操作
 */
+(void)showAlert:(NSString *)message CurrentController:(UIViewController *)controller completion:(void(^)())block{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        //  执行块
        if (block) {
            block();
        }
    
        //  判断是否是个网址
        NSRange range = [message rangeOfString:@"http://weixin."];
        
        if (range.location == NSNotFound)   return ;
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://"] options:@{} completionHandler:nil];
        
    }]];
  
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
