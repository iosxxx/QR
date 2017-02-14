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
    
        //  判断否是微信二维码
        //NSRange range = ;
        
        if ([message rangeOfString:@"http://weixin."].location != NSNotFound){
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://"] options:@{} completionHandler:nil];
        }
        
        
        // 判断是否是网址
        BOOL isUrl = false;
        
        NSString * regulaStr = @"\\b(https|http)?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
        
        NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:nil];
        
        NSArray * arrofAllMatches = [regex matchesInString:message options:0 range:NSMakeRange(0,message.length)];
        
        for (NSTextCheckingResult * match in arrofAllMatches) {
            NSLog(@"xxxxxxxx");
            NSString * substringForMatch = [message substringWithRange:match.range];
            isUrl = YES;
        }
        
        if (isUrl) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:message] options:@{} completionHandler:nil];
        }
        
        /*
        //  判断是否是网址
        if ([message rangeOfString:@""].location) {
            <#statements#>
        }
        */
    }]];
  
    [controller presentViewController:alert animated:YES completion:nil];
}


/** 正则判断网址 */
-(BOOL)urlValidation:(NSString *)string {

    
    
    return NO;
}

@end
