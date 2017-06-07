//
//  YBDefaultButton.m
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBDefaultButton.h"

@implementation YBDefaultButton

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
                                selector:(SEL)selector
{
    return [super buttonWithTitleStringKey:titleStringKey
                                titleColor:titleColor
                                 titleFont:titleFont
                        backgroundImageNor:nil
                        backgroundImageDis:nil
                        backgroundImageHig:nil
                                    target:target
                                  selector:selector];
}

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
                                    selector:(SEL)selector
{
    NSArray *imageArray = ZJIMAGE(imageFilePath,
                                  imageNamed,
                                  ZJProjectLoadImageDefault);
    
    return type == ZJProjectButtonSetImage ? [super buttonWithTitleStringKey:nil
                                                                  titleColor:nil
                                                                   titleFont:nil
                                                                    imageNor:imageArray.firstObject
                                                                    imageDis:imageArray[1]
                                                                    imageHig:imageArray.lastObject
                                                                      target:target
                                                                    selector:selector] :
    [super buttonWithTitleStringKey:nil
                         titleColor:nil
                          titleFont:nil
                 backgroundImageNor:imageArray.firstObject
                 backgroundImageDis:imageArray[1]
                 backgroundImageHig:imageArray.lastObject
                             target:target
                           selector:selector];
}

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
                                             selector:(SEL)selector
{
    NSArray *imageArray = ZJIMAGE(imageFilePath,
                                  imageNamed,
                                  ZJProjectLoadImageDefault);
    return type == ZJProjectButtonSetImage ? [super buttonWithTitleStringKey:titleStringKey
                                                                  titleColor:titleColor
                                                                   titleFont:titleFont
                                                                    imageNor:imageArray.firstObject
                                                                    imageDis:imageArray[1]
                                                                    imageHig:imageArray.lastObject
                                                                      target:target
                                                                    selector:selector] :
    [super buttonWithTitleStringKey:titleStringKey
                         titleColor:titleColor
                          titleFont:titleFont
                 backgroundImageNor:imageArray.firstObject
                 backgroundImageDis:imageArray[1]
                 backgroundImageHig:imageArray.lastObject
                             target:target
                           selector:selector];
}

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
                                   selector:(SEL)selector
{
    NSArray *imageArray         = [self buttonImageArrayWithImagePath:IMAGEFILEPATH_PUBLIC
                                                           imageNamed:@"public_btn_bg"
                                                                 type:ZJProjectLoadImageDefault];
    
    return [super buttonWithTitleStringKey:titleStringKey
                                titleColor:titleColor
                                 titleFont:titleFont
                        backgroundImageNor:imageArray.firstObject
                        backgroundImageDis:imageArray[1]
                        backgroundImageHig:imageArray.lastObject
                                    target:target
                                  selector:selector];
}

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
                                      selector:(SEL)selector
{
    return [super buttonWithTitleStringKey:titleStringKey
                                titleColor:titleColor
                                 titleFont:titleFont
                        backgroundImageNor:[UIImage imageWithColor:ZJCOLOR.color_c6]
                        backgroundImageDis:nil
                        backgroundImageHig:[UIImage imageWithColor:ZJCOLOR.color_c15]
                                    target:target
                                  selector:selector];
}

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
                                     selector:(SEL)selector
{
    NSArray *imageArray         = [self buttonImageArrayWithImagePath:IMAGEFILEPATH_PUBLIC
                                                           imageNamed:@"public_btn3"
                                                                 type:ZJProjectLoadImageDefault];
    
    return [super buttonWithTitleStringKey:titleStringKey
                                titleColor:titleColor
                                 titleFont:titleFont
                        backgroundImageNor:imageArray.firstObject
                        backgroundImageDis:imageArray[1]
                        backgroundImageHig:imageArray.lastObject
                                    target:target
                                  selector:selector];
}

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
                                      selector:(SEL)selector
{
    /**
     *  样式同按钮2，抽离方法，做个性处理
     */
    return [self buttonSecondWithTitleStringKey:titleStringKey
                                     titleColor:titleColor
                                      titleFont:titleFont
                                         target:target
                                       selector:selector];
}

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
                                     selector:(SEL)selector
{
    NSArray *imageArray         = [self buttonImageArrayWithImagePath:IMAGEFILEPATH_PUBLIC
                                                           imageNamed:@"public_next_btn"
                                                                 type:ZJProjectLoadImageDefault];
    
    return [super buttonWithTitleStringKey:titleStringKey
                                titleColor:titleColor
                                 titleFont:titleFont
                        backgroundImageNor:imageArray.firstObject
                        backgroundImageDis:imageArray[1]
                        backgroundImageHig:imageArray.lastObject
                                    target:target
                                  selector:selector];
}

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
                                   selector:(SEL)selector
{
    NSArray *imageArray         = [self buttonImageArrayWithImagePath:IMAGEFILEPATH_PUBLIC
                                                           imageNamed:@"public_blank_btn"
                                                                 type:ZJProjectLoadImageDefault];
    
    return [super buttonWithTitleStringKey:titleStringKey
                                titleColor:titleColor
                                 titleFont:titleFont
                        backgroundImageNor:imageArray.firstObject
                        backgroundImageDis:imageArray[1]
                        backgroundImageHig:imageArray.lastObject
                                    target:target
                                  selector:selector];
}

/**
 公共方法，处理button图片
 
 @param imagePath                           图片路径
 @param imageNamed                          图片名称
 @param type                                获取图片类型
 @return                                    图片数组
 */
+ (NSArray *)buttonImageArrayWithImagePath:(NSString *)imagePath
                                imageNamed:(NSString *)imageNamed
                                      type:(ZJProjectLoadImageType)type
{
    NSArray *imageArray         = ZJIMAGE(imagePath,
                                          imageNamed,
                                          type);
    
    CGFloat top                 = 10;
    CGFloat bottom              = 10 ;
    CGFloat left                = 10;
    CGFloat right               = 10;
    UIEdgeInsets insets         = UIEdgeInsetsMake(top,
                                                   left,
                                                   bottom,
                                                   right);
    UIImage *imageNor           = imageArray.firstObject;
    UIImage *imageDis           = imageArray[1];
    UIImage *imageHig           = imageArray.lastObject;
    
    imageNor                    = [imageNor resizableImageWithCapInsets:insets
                                                           resizingMode:UIImageResizingModeStretch];
    imageHig                    = [imageHig resizableImageWithCapInsets:insets
                                                           resizingMode:UIImageResizingModeStretch];
    imageDis                    = [imageDis resizableImageWithCapInsets:insets
                                                           resizingMode:UIImageResizingModeStretch];
    
    return @[imageNor, imageDis ? imageDis : [UIImage new], imageHig];
}

@end
