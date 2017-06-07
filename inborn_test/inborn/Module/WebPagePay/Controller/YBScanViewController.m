//
//  YBScanViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/5/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBScanViewController.h"
#import "ZJBaseBarButtonItem.h"
#import "User_LocalData.h"
#import "YBLoginViewController.h"
#import "ZJBaseNavigationController.h"
#import "YXScanCodePCLoginResultViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "YBImagePickerController.h"
#import "YBScanResultViewController.h"

@interface YBScanViewController ()
{
    SystemSoundID soundFileObject;
}

@property(copy,nonatomic) scanResultStrBlock scanResultStrBlock;
@property(nonatomic,assign) UseScanVcEnum  UseScanEnum;

@end

@implementation YBScanViewController

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    self.title = @"二维码／条码";
    
    ZJBaseBarButtonItem *rightItem = [ZJBaseBarButtonItem barButtonItemWithTitleStringKey:ZJSTRING(@"相册") callBack:^(id sender) {
        YBImagePickerController *pickerImage = [YBImagePickerController imagePickerControllerWithMaxCount:1 callBackBlock:^(NSArray *imageArray, NSArray *assetArray, BOOL sender) {
            [self IdentifyQRcodeWithImage:imageArray[0] scanImageResultBlock:^(NSString *scanImageResultStr) {
                [self handleQRcodeWithResult:scanImageResultStr];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self GetScancodeUrl:scanImageResultStr];
                });
            }];
        }];
        [self presentViewController:pickerImage animated:YES completion:nil];
    }];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)handleQRcodeWithResult:(NSString *)result{
//    YBLog(@"====识别的结果:%@",result);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"扫描结果"
                                                    message:result
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"确定", nil];
    [self.view addSubview:alert];
    [alert show];
    
    if ([result containsString:@"pcScan/loginAuth"]) {
        
        if (_UseScanEnum == loginScanType) {
            
            [self GetScancodeUrl:result];
            
        }else if(_UseScanEnum == webPayScanType){
            
            if (self.formePCPayurlBlock) {
                self.formePCPayurlBlock(result);
            }
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
    }else if (_UseScanEnum == logisticsScanType) {
        if (self.formePCPayurlBlock) {
            self.formePCPayurlBlock(result);
        }
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }else{
        
        [self.navigationController pushViewController:[YBScanResultViewController creatScanResultVCwthScanResult:result
                                                                                                          extend:nil]
                                             animated:YES];
    }
}

+ (instancetype)creatScanViewControllerWithUseEnum:(UseScanVcEnum)UseEnum
                                     scanResultStr:(scanResultStrBlock)scanResultStr
                                            extend:(id)extend
{
    YBScanViewController *scanVC    = [[YBScanViewController alloc]init];
    scanVC.UseScanEnum              = UseEnum;
    scanVC.scanResultStrBlock       = scanResultStr;
    return scanVC;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark <AVCaptureMetadataOutputObjectsDelegate>

/**
 扫描结果代理
 
 @param captureOutput               captureOutput
 @param metadataObjects             metadataObjects
 @param connection                  connection
 */
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection
{
    [super captureOutput:captureOutput
didOutputMetadataObjects:metadataObjects
          fromConnection:connection];
    
    /**
     *  设置界面显示扫描结果
     */
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        
        NSLog(@"metadataObjects = %@", metadataObjects);
        [self handleQRcodeWithResult:obj.stringValue];
        
        if ([obj.stringValue hasPrefix:@"https"]) {
            //                /**
            //                 添加音效
            //                 */
            //                //            [self playScanLoginSuccessVideo];
    
        } else {
        
        }
    }
}



/**
 登录扫码
 */
-(void)GetScancodeUrl:(NSString *)symbolStr{

    if(![User_LocalData getTokenId] || [User_LocalData getTokenId].length == 0)
    {
        YBLoginViewController *longin = [[YBLoginViewController alloc]init];
        ZJBaseNavigationController *nav = [[ZJBaseNavigationController alloc]initWithRootViewController:longin];
        [self presentViewController:nav animated:YES completion:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
        return;
    }
    
    YXScanCodePCLoginResultViewController *resultvc = [[YXScanCodePCLoginResultViewController alloc]init];
    resultvc.clickBlock =^(NSString *touchtype){
        
        [self handleResult:touchtype url:symbolStr];
    };
    [self presentViewController:resultvc animated:YES completion:nil];
}

-(void)handleResult:(NSString *)touchtype url:(NSString *)symbolStr
{
    if ([touchtype isEqualToString:@"login"]) {
        
        if (self.scanResultStrBlock) {
            self.scanResultStrBlock(symbolStr);
        }
    }else if ([touchtype isEqualToString:@"cancle"]){ }
    
    [self.navigationController popViewControllerAnimated:NO];
}

/**
 播放音效的
 */
-(void)playScanLoginSuccessVideo{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ScanLoginSuccess" ofType:@"wav"];
    NSURL *URL = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)URL, &soundFileObject);
    AudioServicesPlaySystemSound(soundFileObject);
}

@end
