//
//  YBWeChatCameraViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBWeChatCameraViewController.h"

@interface YBWeChatCameraViewController ()

@end

@implementation YBWeChatCameraViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

/**
 实例化仿微信拍摄界面
 
 @param callBackBlock       回调 如果是NSUrl类型，则为视频，其他为图片
 @param sourceController    来源控制器
 @return                    仿微信拍摄界面
 */
+ (instancetype)showWeChatCameraViewControllerWithSourceController:(UIViewController *)sourceController
                                                     callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    YBWeChatCameraViewController *weChatCamerViewController = [[NSBundle mainBundle] loadNibNamed:@"HVideoViewController" owner:nil options:nil].lastObject;
    /**
     *  设置可录制最长时间
     */
    weChatCamerViewController.HSeconds = 30;
    weChatCamerViewController.takeBlock = ^(id item) {
        if ([item isKindOfClass:[NSURL class]]) {
            NSURL *videoURL = item;
            //视频url
            callBackBlock(videoURL);
        } else {
            //图片
            callBackBlock(item);
        }
    };
    weChatCamerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [sourceController presentViewController:weChatCamerViewController animated:YES completion:^{
        
    }];
    return weChatCamerViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
