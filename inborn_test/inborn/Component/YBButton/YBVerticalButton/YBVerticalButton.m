//
//  YBVerticalButton.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBVerticalButton.h"

@implementation YBVerticalButton

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

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.ex_x = self.width * 0.5 - self.imageView.width * 0.5;
    self.imageView.ex_y = 0;
    self.imageView.width = self.imageView.size.width;
    self.imageView.height = self.imageView.size.height;
    
    // 调整文字
    self.titleLabel.ex_x = 0;
    self.titleLabel.ex_y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.ex_y;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
