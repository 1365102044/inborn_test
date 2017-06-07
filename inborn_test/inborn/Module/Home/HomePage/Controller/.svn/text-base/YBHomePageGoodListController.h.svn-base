//
//  YBHomePageGoodListController.h
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListController.h"
@class YBHomePageViewModel;

@interface YBHomePageGoodListController : YBGoodListController

/**
 YBHomePageViewModel
 */
@property (nonatomic, strong) YBHomePageViewModel *homePageGoodListViewModel;

/**
 条件搜索刷新数据
 
 @param sort                    price_asc,price_desc,collection_desc,browse_desc
 @param search                  搜索条件
 @param curPage                 当前页
 */
- (void)searchDataWithSort:(NSString *)sort
                    search:(NSString *)search
                   curPage:(NSString *)curPage;

@end
