//
//  ZJDisplayView.m
//  inborn
//
//  Created by 郑键 on 17/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJDisplayView.h"
#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"
#import "CoreTextLinkData.h"


NSString *const ZJDisplayViewImagePressedNotification = @"ZJDisplayViewImagePressedNotification";
NSString *const ZJDisplayViewLinkPressedNotification = @"ZJDisplayViewLinkPressedNotification";

@implementation ZJDisplayView

/**
 实例化图文混排控件
 
 @param array                   图文混排内容
 @return                        图文混排控件
 */
+ (instancetype)displayViewWithDataArray:(NSArray *)array;
{
    ZJDisplayView *displayView                  = [[ZJDisplayView alloc] init];
    CTFrameParserConfig *config                 = [[CTFrameParserConfig alloc] init];
    config.width                                = displayView.width;
    CoreTextData *data                          = [CTFrameParser parseContentArray:array config:config];
    displayView.data                            = data;
    displayView.height                          = data.height;
    displayView.backgroundColor                 = [UIColor whiteColor];
    return displayView;
}

@end
