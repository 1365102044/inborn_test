//
//  YBImagePickerController.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "TZImagePickerController.h"

@interface YBImagePickerController : TZImagePickerController

/**
 图片选择器
 
 @param maxCount                maxCount 最大图片数量
 @param callBackBlock           callBackBlock 回调
 @return                        图片选择器
 */
+ (instancetype)imagePickerControllerWithMaxCount:(NSInteger)maxCount
                                    callBackBlock:(ZJImagePickerCallBackBlock)callBackBlock;

@end
