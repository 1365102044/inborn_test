//
//  YBWeChatPhotoBrowserViewController.m
//  inborn
//
//  Created by 郑键 on 17/5/9.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBWeChatPhotoBrowserViewController.h"
#import "YBUploadImageModel.h"

@interface YBWeChatPhotoBrowserViewController ()

@end

@implementation YBWeChatPhotoBrowserViewController

/**
 This init method just for previewing photos / 用这个初始化方法以预览图片
 
 @param uploadImageModelArray   selectedAssets
 @param index                   index
 @param callBackBlock           callBackBlock 回调
 @return                        图片浏览器
 */
+ (void)showPhotoBroswerWithUploadImageModelArray:(NSArray *)uploadImageModelArray
                                 sourceController:(UIViewController *)sourceController
                                       sourceView:(UIView *)sourceView
                                            index:(NSInteger)index
                                    callBackBlock:(ZJImagePickerCallBackBlock)callBackBlock
{
    [PhotoBroswerVC show:sourceController type:PhotoBroswerVCTypePush index:index photoModelBlock:^NSArray *{
        
        NSMutableArray *modelsM = [NSMutableArray arrayWithCapacity:uploadImageModelArray.count];
        for (NSUInteger i = 0; i< uploadImageModelArray.count; i++) {
            
            YBUploadImageModel *uploadImageModel = uploadImageModelArray[i];
            
            if (!uploadImageModel.isSystemButton) {
                PhotoModel *pbModel=[[PhotoModel alloc] init];
                pbModel.mid = i + 1;
                pbModel.image = uploadImageModel.originalImage ? uploadImageModel.originalImage : uploadImageModel.placeholderImage;
                pbModel.image_HD_U = uploadImageModel.imgUrl ? uploadImageModel.imgUrl : @"";
                
                //源frame
                pbModel.sourceImageView = (UIImageView *)sourceView;
                
                [modelsM addObject:pbModel];
            }
        }
        return modelsM;
    }];
}

@end
