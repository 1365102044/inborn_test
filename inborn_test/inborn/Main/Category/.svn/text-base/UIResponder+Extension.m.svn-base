//
//  UIResponder+Extension.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "UIResponder+Extension.h"

@implementation UIResponder (Extension)

/**
 *  发送一个路由器消息, 对eventName感兴趣的 UIResponsder 可以对消息进行处理
 *
 *  @param eventName 发生的事件名称
 *  @param userInfo  传递消息时, 携带的数据, 数据传递过程中, 会有新的数据添加
 *
 */
- (void)ex_routerEventWithName:(NSString *)eventName
                      userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] ex_routerEventWithName:eventName
                                        userInfo:userInfo];
}

@end
