//
//  CSYScanViewController.h
//  QR
//
//  Created by im on 16/6/23.
//  Copyright © 2016年 广东骆驼服饰有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "QRScanView.h"

@interface CSYScanViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>

@end
