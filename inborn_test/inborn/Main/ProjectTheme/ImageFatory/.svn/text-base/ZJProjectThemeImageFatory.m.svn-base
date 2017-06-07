//
//  ZJProjectThemeImageFatory.m
//  Project
//
//  Created by 郑键 on 17/1/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJProjectThemeImageFatory.h"

@implementation ZJProjectThemeImageFatory

/**
 项目主题图片工厂方法
 
 @param image           图片
 @param type            图片样式
 @return                返回统一配置的图片
 */
+ (UIImage *)projectThemeImageFatoryWithImage:(UIImage *)image
                                    imageType:(ZJProjectLoadImageType)type
{
    /** 做项目统一配置 */
    
    UIImage *confiImage;
    
    if (type == ZJProjectViewStatusDefault) {
        confiImage = image;
    }
    
    if (type == ZJProjectLoadImageFillet) {
        confiImage = [self filletImage:image];
    }
    
    return confiImage;
}

/**
 绘制圆角图片

 @param image image
 @return 圆角图片
 */
+ (UIImage *)filletImage:(UIImage *)image
{
    return [image ex_drawCircleImage];
}

/**
 项目主题网络图片工厂方法
 
 @param URLString               图片URLString
 @param imageURLStringType      类型
 @return                        处理后统一的URL
 */
+ (NSString *)projectThemeImageFatoryWithImageURLString:(NSString *)URLString
                                     imageURLStringType:(ZJProjectImageURLStringType)imageURLStringType
{
    NSString *confiImageURLString;
    
    if (imageURLStringType == ZJProjectLoadImageDefault) {
        confiImageURLString = URLString;
    }
    
    if (imageURLStringType == ZJProjectImageURLStringWaterfallFlow) {
        confiImageURLString = [NSString stringWithFormat:@"%@?x-oss-process=style/ah450", URLString];
    }
    
    if (imageURLStringType == ZJProjectImageURLStringList) {
        confiImageURLString = URLString;
    }
    
    if (imageURLStringType == ZJProjectImageURLStringMid) {
        confiImageURLString = URLString;
    }
    
    if (imageURLStringType == ZJProjectImageURLStringLarge) {
        confiImageURLString = URLString;
    }
    if (imageURLStringType == ZJProjectImageUrlStringHeaderIcon) {
        confiImageURLString = [NSString stringWithFormat:@"%@?x-oss-process=style/ss200",URLString];
    }
    
    return confiImageURLString;
}

@end
