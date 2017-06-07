//
//  YBSearchResultListController.h
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListController.h"
@class YBSearchResultListViewModel;

@interface YBSearchResultListController : YBGoodListController

/**
 YBSearchResultListViewModel
 */
@property (nonatomic, strong) YBSearchResultListViewModel *searchResultGoodListViewModel;

/**
 条件搜索刷新数据
 
 @param key                     关键字
 @param orderByFiled            1综合排序 2热度 3喜欢 4价格 5商户自营
 @param orderByType             1为升序ASC 2为降序DESC
 @param curPage                 当前页
 */
- (void)searchDataWithKey:(NSString *)key
             orderByFiled:(NSString *)orderByFiled
                       orderByType:(NSString *)orderByType
                           curPage:(NSString *)curPage;

@end
