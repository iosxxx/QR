//
//  ViewController.m
//  QR
//
//  Created by im on 16/6/18.
//  Copyright © 2016年 广东骆驼服饰有限公司. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CSYShowAlert.h"

#define wwidth [UIScreen mainScreen].bounds.size.width
#define hheight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longGesture;
@property (weak, nonatomic) IBOutlet UIImageView *codeImg;
@property (weak, nonatomic) IBOutlet UITextField *codeInputTxt;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _longGesture.minimumPressDuration = 1;
    
    [_longGesture addTarget:self action:@selector(longGesture:)];
    
    
    }

// 生成二维码
- (IBAction)createCode:(id)sender {
   
    NSString * QRcodeStr = _codeInputTxt.text;
    
    if ([QRcodeStr isEqualToString:@""]) return;
    
    
    NSData * data = [QRcodeStr dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter * filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage * outputImage = filter.outputImage;
    
    CGFloat scale = CGRectGetWidth(self.codeImg.bounds);
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    CIImage * transformImg = [outputImage imageByApplyingTransform:transform];
    
    _codeImg.image = [UIImage imageWithCIImage:transformImg];
    _codeInputTxt.text = @"";
}


-(void)longGesture:(UILongPressGestureRecognizer *)longGesture
{
    if (longGesture.state == UIGestureRecognizerStateBegan) {
        //截屏
        [self ScreenShot];
    }
    
}


-(void)ScreenShot{
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0);     //设置截屏大小
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
  
    
    UIImage * viewImage = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    
    UIImage * img = [[UIImage alloc]initWithData:UIImagePNGRepresentation(viewImage)];
    
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy:CIDetectorAccuracyHigh }];
    
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:img.CGImage]];
    NSLog(@"%@",features);
    CIQRCodeFeature *feature = [features firstObject];
    if (feature) {
        
        //  加载提示栏
        [CSYShowAlert showAlert:feature.messageString CurrentController:self completion:nil];
        
    } 
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    
    NSLog(@"%s",__func__);
}
@end
