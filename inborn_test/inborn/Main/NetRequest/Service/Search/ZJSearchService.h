//
//  ZJSearchService.h
//  inborn
//
//  Created by 郑键 on 17/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface ZJSearchService : ZJBaseService

/**
 *  根据条件搜索商品（方法内部配置页面发小）
 *
 *  @param key                     搜索的关键词
 *  @param orderByFiled            1综合排序 2热度 3喜欢 4价格 5商户自营
 *  @param orderByType             1为升序ASC 2为降序DESC
 *  @param curPage                 当前页
 *  @param successBlock             successCallBack
 */
- (void)searchCategoryGoodListWithKey:(NSString *)key
                         orderByFiled:(NSString *)orderByFiled
                          orderByType:(NSString *)orderByType
                              curPage:(NSString *)curPage
                              success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消示例网络请求
 */
- (void)cancelSearchCategoryGoodListNetRequest;

@end
