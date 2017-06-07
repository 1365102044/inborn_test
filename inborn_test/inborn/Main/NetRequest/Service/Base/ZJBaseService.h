//
//  ZJBaseService.h
//  Project
//
//  Created by 郑键 on 17/2/15.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJBaseService : NSObject

/**
 *  单例
 */
+ (instancetype)share;

/**
 *  请求数据成功的处理
 *
 *  @param dictionary   请求回来的数据
 *  @param requestInfoModel      请求task
 *  @param sucBlock  如果一切正常则会执行该block
 *  @param failBlock 出现其它错误时执行(例如:请求虽然成功,但出现必填参数为空)
 */
- (void)handleRequestSuccess:(NSDictionary *)dictionary
                requestModel:(ZJProjectNetRequestInfo *)requestInfoModel
                    sucBlock:(ZJNetRequestSuccessBlock)sucBlock
                   failBlock:(ZJNetRequestFailureBlock)failBlock;

/**
 *  请求数据失败后的处理
 *
 *  @param error     请求失败后返回Error对象
 */
- (void)handleRequestFailed:(NSError *)error
               requestModel:(ZJProjectNetRequestInfo *)requestInfoModel
                  failBlock:(ZJNetRequestFailureBlock)failBlock;

@end
