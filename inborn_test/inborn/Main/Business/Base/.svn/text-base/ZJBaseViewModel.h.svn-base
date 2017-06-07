//
//  ZJBaseViewModel.h
//  Project
//
//  Created by 郑键 on 17/3/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBPageDataModel.h"

@interface ZJBaseViewModel : NSObject

/**
 当前请求数据页面信息
 */
@property (nonatomic, strong) YBPageDataModel *pageDataModel;

/**
 *  请求数据业务逻辑成功的处理（带分页）
 *
 *  @param obj       响应体
 */
- (void)handleRequestObj:(id)obj;

/**
 *  请求数据业务逻辑失败后的处理
 *
 *  @param error     请求失败后返回Error对象
 */
- (void)handleRequestFailed:(NSError *)error;

@end
