//
//  ZJScanningController.h
//  Project
//
//  Created by 郑键 on 17/2/28.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJScanningManager.h"

/**
 识别图片结果
 */
typedef void(^identifyQRcodeWithImageResultBlock)(NSString * scanImageResultStr);

@interface ZJScanningController : UIViewController
/**
 扫描结果代理
 
 @param captureOutput               captureOutput
 @param metadataObjects             metadataObjects
 @param connection                  connection
 */
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection;

- (void)IdentifyQRcodeWithImage:(UIImage *)Image
           scanImageResultBlock:(identifyQRcodeWithImageResultBlock)scanImageResultBlock;
@end
