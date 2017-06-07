//
//  YBDefaultButton.h
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseButton.h"

@interface YBDefaultButton : ZJBaseButton

/**
 初始化文字按钮
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    返回黑底按钮
 */
+ (instancetype)buttonWithTitleStringKey:(NSString *)titleStringKey
                              titleColor:(UIColor *)titleColor
                               titleFont:(UIFont *)titleFont
                                  target:(id)target
                                selector:(SEL)selector;

/**
 初始化图片的按钮
 
 @param imageFilePath                       titleStringKey
 @parma imageNamed
 @param type                                图片种类类型
 @param target                              target
 @param selector                            selector
 @return                                    返回黑底按钮
 */
+ (instancetype)buttonImageWithImageFilePath:(NSString *)imageFilePath
                                  imageNamed:(NSString *)imageNamed
                                        type:(ZJProjectButtonSetImageType)type
                                      target:(id)target
                                    selector:(SEL)selector;

/**
 初始化图片及文字的按钮
 
 @param titleStringKey                      titleStringKey
 @param type                                图片种类类型
 @param target                              target
 @param selector                            selector
 @return                                    返回黑底按钮
 */
+ (instancetype)buttonImageAndTitleWithTitleStringKey:(NSString *)titleStringKey
                                           titleColor:(UIColor *)titleColor
                                            titleFont:(UIFont *)titleFont
                                        imageFilePath:(NSString *)imageFilePath
                                           imageNamed:(NSString *)imageNamed
                                                 type:(ZJProjectButtonSetImageType)type
                                               target:(id)target
                                             selector:(SEL)selector;

/**
 初始化按钮1（规范）-黑底圆角按钮
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    按钮1（规范）-黑底圆角按钮
 */
+ (instancetype)buttonDefWithTitleStringKey:(NSString *)titleStringKey
                                 titleColor:(UIColor *)titleColor
                                  titleFont:(UIFont *)titleFont
                                     target:(id)target
                                   selector:(SEL)selector;

/**
 初始化按钮2（规范）-8AB1AA底色方形按钮无禁用状态
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    按钮2（规范）-8AB1AA底色方形按钮
 */
+ (instancetype)buttonSecondWithTitleStringKey:(NSString *)titleStringKey
                                    titleColor:(UIColor *)titleColor
                                     titleFont:(UIFont *)titleFont
                                        target:(id)target
                                      selector:(SEL)selector;

/**
 初始化按钮3（规范）-FFFFFF带边框方形按钮无禁用状态
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    按钮3（规范）-FFFFFF带边框方形按钮
 */
+ (instancetype)buttonThirdWithTitleStringKey:(NSString *)titleStringKey
                                   titleColor:(UIColor *)titleColor
                                    titleFont:(UIFont *)titleFont
                                       target:(id)target
                                     selector:(SEL)selector;

/**
 初始化按钮4（规范）-8AB1AA底色方形按钮无禁用状态
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    按钮4（规范）-8AB1AA底色方形按钮
 */
+ (instancetype)buttonFourthWithTitleStringKey:(NSString *)titleStringKey
                                    titleColor:(UIColor *)titleColor
                                     titleFont:(UIFont *)titleFont
                                        target:(id)target
                                      selector:(SEL)selector;

/**
 初始化按钮5（规范）-8AB1AA底色圆角带禁用状态按钮
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    按钮5（规范）-8AB1AA底色圆角带禁用状态按钮
 */
+ (instancetype)buttonFifthWithTitleStringKey:(NSString *)titleStringKey
                                   titleColor:(UIColor *)titleColor
                                    titleFont:(UIFont *)titleFont
                                       target:(id)target
                                     selector:(SEL)selector;

/**
 初始化按钮6（规范）-8AB1AA底色圆角
 
 @param titleStringKey                      titleStringKey
 @param target                              target
 @param selector                            selector
 @return                                    按钮5（规范）-8AB1AA底色圆角带禁用状态按钮
 */
+ (instancetype)buttonSixWithTitleStringKey:(NSString *)titleStringKey
                                   titleColor:(UIColor *)titleColor
                                    titleFont:(UIFont *)titleFont
                                       target:(id)target
                                     selector:(SEL)selector;

@end
