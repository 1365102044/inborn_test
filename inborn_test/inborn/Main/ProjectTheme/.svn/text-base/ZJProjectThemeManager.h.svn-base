//
//  ZJProjectThemeManager.h
//  Project
//
//  Created by 郑键 on 17/1/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJProjectThemeColorFatory.h"

@interface ZJProjectThemeManager : NSObject

#pragma mark - 配置颜色

/**
 项目用颜色主题工厂
 */
@property (nonatomic, strong) ZJProjectThemeColorFatory *themeColorFatory;

#pragma mark - 初始化

/**
 获取项目主题管理单利
 
 @return 对象
 */
+ (instancetype)sharedManager;

#pragma mark - 配置图片

/**
 加载普通和高亮图片
 
 @param fileName        bundle内 模块图片文件夹名称, 如有多层文件夹嵌套写多层文件夹
 @param imageNamed      图片名
 @param type            图片样式（具体参见ZJProjectLoadImageType注释）
 
 @return                返回图片数组，firstObject普通图片/lastObject高亮图片
 */
- (NSArray *)loadImageWithFileName:(NSString *)fileName
                        imageNamed:(NSString *)imageNamed
                         imageType:(ZJProjectLoadImageType)type;

/**
 加载单张图片
 
 @param fileName        bundle内 模块图片文件夹名称, 如有多层文件夹嵌套写多层文件夹
 @param imageNamed      图片名
 @param type            图片样式（具体参见ZJProjectLoadImageType注释）
 
 @return                返回图片数组，firstObject普通图片/lastObject高亮图片
 */
- (UIImage *)loadCurrentImageWithFileName:(NSString *)fileName
                               imageNamed:(NSString *)imageNamed
                                imageType:(ZJProjectLoadImageType)type;

/**
 加载网络图片URL处理
 
 @param imageURLStringType  ZJProjectImageURLStringType
 @param URLString           图片的URLString
 @return                    处理好的URL
 */
- (NSString *)resetImageURLStringWithImageType:(ZJProjectImageURLStringType)imageURLStringType
                                     URLString:(NSString *)URLString;

#pragma mark - 字体配置


@end
