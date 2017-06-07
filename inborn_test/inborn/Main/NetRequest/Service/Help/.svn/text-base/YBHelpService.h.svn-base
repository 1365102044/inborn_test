//
//  YBHelpService.h
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBHelpService : ZJBaseService

/**
 *  帮助中心列表请求
 *
 *  @param alias               别名
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)getHelpListWithAlias:(NSString *)alias
                     success:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消示例网络请求
 */
- (void)cancelHelpListNetRequest;

@end
