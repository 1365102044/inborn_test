//
//  YBWeChatCameraViewController.h
//  inborn
//
//  Created by 郑键 on 17/4/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "HVideoViewController.h"

@interface YBWeChatCameraViewController : HVideoViewController

/**
 实例化仿微信拍摄界面

 @param callBackBlock       回调 如果是NSUrl类型，则为视频，其他为图片
 @param sourceController    来源控制器
 @return                    仿微信拍摄界面
 */
+ (instancetype)showWeChatCameraViewControllerWithSourceController:(UIViewController *)sourceController
                                                     callBackBlock:(ZJEventCallBackBlock)callBackBlock;

@end
