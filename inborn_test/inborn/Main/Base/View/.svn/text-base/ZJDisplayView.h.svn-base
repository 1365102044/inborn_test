//
//  ZJDisplayView.h
//  inborn
//
//  Created by 郑键 on 17/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

/**
 *  文件说明：
 *  该图文混排控件继承于CTDisplayView类
 *  使用本类需要在控制器内注册图片及链接点击通知
 *  通知名：ZJDisplayViewImagePressedNotification/ZJDisplayViewLinkPressedNotification
 *  通知回调参数：CoreTextImageData *imageData/CoreTextLinkData *linkData
 *  array格式：
 *  [   {
            "type" : "img",
            "width" : 300,
            "height" : 160,
            "name" : "coretext-image-1.jpg"
        },
        { 
            "color" : "blue",
            "content" : "排版",
            "size" : 16,
            "type" : "txt"
        },
        { 
            "color" : "red",
            "content" : "内容、颜色、字体",
            "size" : 22,
            "type" : "txt"
        },
        {
            "color" : "black",
            "content" : "大小等信息。\n",
            "size" : 16,
            "type" : "txt"
        },
        { 
            "color" : "default",
            "content" : "文字。",
            "type" : "txt"
        },
        {
            "type" : "img",
            "width" : 50,
            "height" : 32,
            "name" : "coretext-image-2.jpg"
        },
        {
            "color" : "default",
            "content" : "这在这里尝试放一个参考链接：",
            "type" : "txt"
        },
        { 
            "color" : "blue",
            "content" : "链接文字",
            "url" : "http://blog.devtang.com",
            "type" : "link"
        },
        {
            "color" : "default",
            "content" : "大家可以尝试点击一下",
            "type" : "txt"
        }
    ]
 */

#import "CTDisplayView.h"

extern NSString *const ZJDisplayViewImagePressedNotification;
extern NSString *const ZJDisplayViewLinkPressedNotification;

@interface ZJDisplayView : CTDisplayView

/**
 实例化图文混排控件

 @param array                   图文混排内容
 @return                        图文混排控件
 */
+ (instancetype)displayViewWithDataArray:(NSArray *)array;

@end
