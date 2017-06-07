//
//  YBRightImageButton.h
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseButton.h"

@interface YBRightImageButton : ZJBaseButton

/**
 初始化图片及文字的按钮
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    图片在右侧的按钮
 */
+ (instancetype)buttonImageAndTitleWithTitleStringKey:(NSString *)titleStringKey
                                        titleColorNor:(UIColor *)titleColorNor
                                        titleColorSel:(UIColor *)titleColorSel
                                        titleColorDis:(UIColor *)titleColorDis
                                            titleFont:(UIFont *)titleFont
                                        imageFilePath:(NSString *)imageFilePath
                                           imageNamed:(NSString *)imageNamed
                                               target:(id)target
                                             selector:(SEL)selector;

@end
