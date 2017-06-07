//
//  ZJBaseBarButtonItem.h
//  inborn
//
//  Created by 郑键 on 17/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBaseBarButtonItem : UIBarButtonItem

/**
 用于处理图片偏移的文字
 */
@property (nonatomic, assign) BOOL offSet;

/**
 alph
 */
@property (nonatomic, assign) CGFloat alph;

/**
 创建BarButtonItem（文字）
 
 @param titleStringKey                          title的文字Key
 @return                                        barButtonItem
 */
+ (instancetype)barButtonItemWithTitleStringKey:(NSString *)titleStringKey
                                       callBack:(ZJEventCallBackBlock)callBack;

/**
 创建BarButtonItem（图片）
 
 @param imageFilePath                           图片路径
 @param imageNamed                              图片名
 @return                                        barButtonItem
 */
+ (instancetype)barButtonItemWithImageFilePath:(NSString *)imageFilePath
                                    imageNamed:(NSString *)imageNamed
                                      callBack:(ZJEventCallBackBlock)callBack;

@end
