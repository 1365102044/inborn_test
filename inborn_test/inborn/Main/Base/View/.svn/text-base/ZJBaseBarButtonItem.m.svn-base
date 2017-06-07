//
//  ZJBaseBarButtonItem.m
//  inborn
//
//  Created by 郑键 on 17/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseBarButtonItem.h"

@interface ZJBaseBarButtonItem()

/**
 当前的控件
 */
@property (nonatomic, strong) UIView *currentCustomView;

@end

@implementation ZJBaseBarButtonItem

- (void)setOffSet:(BOOL)offSet
{
    _offSet = offSet;
    
}

- (void)setAlph:(CGFloat)alph
{
    _alph = alph;
    
    self.currentCustomView.alpha = alph;
}

/**
 点击事件
 
 @param sender sender
 */
- (void)buttonClick:(UIButton *)sender
{
    self.actionBlock(sender);
}

/**
 创建BarButtonItem（文字）
 
 @param titleStringKey                          title的文字Key
 @return                                        barButtonItem
 */
+ (instancetype)barButtonItemWithTitleStringKey:(NSString *)titleStringKey
                                       callBack:(ZJEventCallBackBlock)callBack;
{
    
    YBDefaultButton *barButton              = [YBDefaultButton buttonWithTitleStringKey:titleStringKey
                                                                             titleColor:ZJCOLOR.color_c4
                                                                              titleFont:SYSTEM_REGULARFONT(14.f)
                                                                                 target:nil
                                                                               selector:nil];
    ZJBaseBarButtonItem *barButtonItem      = [[ZJBaseBarButtonItem alloc] initWithCustomView:barButton];
    barButtonItem.currentCustomView         = barButton;
    [barButton addTarget:barButtonItem
                  action:@selector(buttonClick:)
        forControlEvents:UIControlEventTouchUpInside];
    
    if (callBack) {
        [barButtonItem setActionBlock:callBack];
    }
    return barButtonItem;
}

/**
 创建BarButtonItem（图片）
 
 @param imageFilePath                           图片路径
 @param imageNamed                              图片名
 @return                                        barButtonItem
 */
+ (instancetype)barButtonItemWithImageFilePath:(NSString *)imageFilePath
                                    imageNamed:(NSString *)imageNamed
                                      callBack:(ZJEventCallBackBlock)callBack
{
    YBDefaultButton *defaultButton          = [YBDefaultButton buttonImageWithImageFilePath:imageFilePath
                                                                                 imageNamed:imageNamed
                                                                                       type:ZJProjectButtonSetBackgroundImage
                                                                                     target:nil
                                                                                   selector:nil];
    ZJBaseBarButtonItem *barButtonItem      = [[ZJBaseBarButtonItem alloc] initWithCustomView:defaultButton];
    barButtonItem.currentCustomView         = defaultButton;
    
    [defaultButton addTarget:barButtonItem
                      action:@selector(buttonClick:)
            forControlEvents:UIControlEventTouchUpInside];
    
    if (callBack) {
        [barButtonItem setActionBlock:callBack];
    }
    return barButtonItem;
}

@end
