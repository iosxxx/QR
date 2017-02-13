//
//  CSYShowView.h
//  QR
//
//  Created by hong chen on 2017/2/13.
//  Copyright © 2017年 广东骆驼服饰有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CSYShowAlert : NSObject

/** 显示定制的提示框
 第一个参数：要提示的信息
 第二个参数：当前控制器
 第三个参数：要执行的操作
 */
+(void)showAlert:(NSString *)message CurrentController:(UIViewController *)controller completion:(void(^)())block;

@end
