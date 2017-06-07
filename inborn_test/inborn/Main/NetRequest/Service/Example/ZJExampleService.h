//
//  ZJExampleService.h
//  Project
//
//  Created by 郑键 on 17/2/16.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseService.h"

@interface ZJExampleService : ZJBaseService

/**
 *  示例网络请求
 *
 *  @param example1            参数1
 *  @param example2            参数2
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)exampleNetRequestWithExample1:(id)example1
                             example2:(id)example2
                              success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消示例网络请求
 */
- (void)cancelExampleNetRequest;

@end
