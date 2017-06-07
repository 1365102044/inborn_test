//
//  ZJBaseViewModel.m
//  Project
//
//  Created by 郑键 on 17/3/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseViewModel.h"

@implementation ZJBaseViewModel

/**
 *  请求数据业务逻辑成功的处理（带分页）
 *
 *  @param obj       响应体
 */
- (void)handleRequestObj:(id)obj
{
    self.pageDataModel = [YBPageDataModel modelWithDictionary:obj[@"pageData"]];
}

/**
 *  请求数据业务逻辑失败后的处理
 *
 *  @param error     请求失败后返回Error对象
 */
- (void)handleRequestFailed:(NSError *)error
{
    YBLog(@"%@", error);
}

@end
