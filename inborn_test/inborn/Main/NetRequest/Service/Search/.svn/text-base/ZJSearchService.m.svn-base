//
//  ZJSearchService.m
//  inborn
//
//  Created by 郑键 on 17/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJSearchService.h"

@interface ZJSearchService()
{
    NSURLSessionTask *_searchCategoryGoodListTask;
}

@end

@implementation ZJSearchService

+ (instancetype)share{
    static dispatch_once_t t;
    static ZJSearchService *service         = nil;
    dispatch_once(&t, ^{
        service                             = [[ZJSearchService alloc] init];
    });
    return service;
}

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
                                 fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!key
        || !orderByFiled
        || !orderByType
        || !curPage) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"key":!key ? @"" : key,
                                                                        @"orderByFiled":!orderByFiled ? @"" : orderByFiled,
                                                                        @"orderByType":!orderByType ? @"" : orderByType,
                                                                        @"curPage":!curPage ? @"" : curPage}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"key":key,
                                                        @"orderByFiled":orderByFiled,
                                                        @"orderByType":orderByType,
                                                        @"curPage":curPage,
                                                        @"pageSize":[NSString stringWithFormat:@"%zd", SEVRIES_PAGESIZE]};
    
    /**
     *  请求并获取task
     */
    __weak ZJSearchService *weakSelf      = self;
    _searchCategoryGoodListTask                                   = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:SEARCH_GOODLIST_URL
                                                                                                                         requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                 parameters:params
                                                                                                                            timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                               successBlock:^(id objc, id requestInfo) {
                                                                                                                                   [weakSelf handleRequestSuccess:objc
                                                                                                                                                     requestModel:requestInfo
                                                                                                                                                         sucBlock:successBlock
                                                                                                                                                        failBlock:failBlock];
                                                                                                                               }
                                                                                                                               failureBlock:^(id error, id requestInfo) {
                                                                                                                                   [weakSelf handleRequestFailed:error
                                                                                                                                                    requestModel:requestInfo
                                                                                                                                                       failBlock:failBlock];
                                                                                                                               }];
    
}

/**
 *  取消示例网络请求
 */
- (void)cancelSearchCategoryGoodListNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_searchCategoryGoodListTask];
}

@end
