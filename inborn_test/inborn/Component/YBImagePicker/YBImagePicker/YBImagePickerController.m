//
//  YBImagePickerController.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBImagePickerController.h"
#import "TZPhotoPreviewController.h"
#import "YBUploadImageModel.h"
#import <Photos/Photos.h>
#import "PhotoBroswerVC.h"

@interface YBImagePickerController ()

@end

@implementation YBImagePickerController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

/**
 图片选择器
 
 @param maxCount                maxCount 最大图片数量
 @param callBackBlock           callBackBlock 回调
 @return                        图片选择器
 */
+ (instancetype)imagePickerControllerWithMaxCount:(NSInteger)maxCount
                                    callBackBlock:(ZJImagePickerCallBackBlock)callBackBlock
{
    YBImagePickerController *imageController = [[YBImagePickerController alloc] initWithMaxImagesCount:maxCount columnNumber:4 delegate:nil];
    [imageController setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> * imageArrays, NSArray * array, BOOL isBool) {
        callBackBlock(imageArrays, array, isBool);
    }];
    
    imageController.sortAscendingByModificationDate = NO;
    imageController.allowTakePicture = NO;
    imageController.barItemTextColor = ZJCOLOR.color_c4;
    imageController.navigationBar.barStyle = UIBarStyleDefault;
    imageController.barItemTextFont = SYSTEM_REGULARFONT(16.f);
    imageController.oKButtonTitleColorNormal = ZJCOLOR.color_c6;
    imageController.oKButtonTitleColorDisabled = [ZJCOLOR.color_c6 colorWithAlphaComponent:0.4];
    
    return imageController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
