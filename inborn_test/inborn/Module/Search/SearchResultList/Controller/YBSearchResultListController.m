//
//  YBSearchResultListController.m
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchResultListController.h"
#import "YBSearchResultListViewModel.h"

@interface YBSearchResultListController ()

@end

@implementation YBSearchResultListController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setSearchResultGoodListViewModel:(YBSearchResultListViewModel *)searchResultGoodListViewModel
{
    _searchResultGoodListViewModel  = searchResultGoodListViewModel;
    self.viewModel                  = searchResultGoodListViewModel;
    
    /**
     *  配置界面
     */
    
    /**
     数据数组
     */
    self.goodDataArray          = searchResultGoodListViewModel.goodListArray;
    
    /**
     广告数据
     */
    self.adsArray               = searchResultGoodListViewModel.adsArray;
    
    /**
     广告图片url数组
     */
    self.adsImageUrlStrings     = searchResultGoodListViewModel.adsImageUrlStrings;
    
    [self.collectionView reloadData];
}

#pragma mark - Third.点击事件

/**
 加载新数据
 */
- (void)loadNewData
{
    [self.collectionView.mj_footer resetNoMoreData];
    
    /**
     *  搜索时获取数据
     */
    
    [self searchDataWithKey:self.searchResultGoodListViewModel.key
               orderByFiled:self.searchResultGoodListViewModel.orderByFiled
                orderByType:self.searchResultGoodListViewModel.orderByType
                    curPage:@"1"];
}

/**
 加载更多
 */
- (void)loadMoreData
{
    if ([self.searchResultGoodListViewModel.pageDataModel.pageNum integerValue] + 1 > [self.searchResultGoodListViewModel.pageDataModel.pages integerValue]) {
        
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    
    /**
     *  搜索时获取数据
     */
    [self searchDataWithKey:self.searchResultGoodListViewModel.key
               orderByFiled:self.searchResultGoodListViewModel.orderByFiled
                orderByType:self.searchResultGoodListViewModel.orderByType
                    curPage:[NSString stringWithFormat:@"%zd", [self.searchResultGoodListViewModel.pageDataModel.pageNum integerValue] + 1]];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchResultGoodListViewModel                                      = [[YBSearchResultListViewModel alloc] init];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

#pragma mark - Eight.LoadData

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
                  curPage:(NSString *)curPage
{
    [self.searchResultGoodListViewModel searchCategoryGoodListWithKey:key ? key : self.searchResultGoodListViewModel.key
                                                         orderByFiled:orderByFiled
                                                          orderByType:orderByType
                                                              curPage:curPage
                                                              success:^(id model) {
                                                                  
                                                                  self.searchResultGoodListViewModel = (YBSearchResultListViewModel *)model;
                                                                  [self.collectionView.mj_header endRefreshing];
                                                                  [self.collectionView.mj_footer endRefreshing];
                                                                  
                                                                  if (!self.searchResultGoodListViewModel.goodListArray
                                                                      || self.searchResultGoodListViewModel.goodListArray.count == 0) {
                                                                      [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                                                tipsString:@"暂无数据"
                                                                                               buttonTitle:nil];
                                                                  }else{
                                                                      [self hiddenMaskView];
                                                                  }
                                                                  
                                                              } faileBlock:^(id error) {
                                                                  
                                                                  [self.collectionView.mj_header endRefreshing];
                                                                  [self.collectionView.mj_footer endRefreshing];
                                                                  
                                                                  if (!self.searchResultGoodListViewModel.goodListArray
                                                                      || self.searchResultGoodListViewModel.goodListArray.count == 0) {
                                                                      [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                                                tipsString:@"暂无数据"
                                                                                               buttonTitle:nil];
                                                                  }
                                                                  
                                                                  /**
                                                                   *  如果errorCode == -1009 无网络
                                                                   */
                                                                  if ([error code] == -1009) {
                                                                      [self showTempViewWithLogoImageNamed:@"blank_net_bg"
                                                                                                tipsString:@"糟糕，网络好像出问题了"
                                                                                               buttonTitle:nil];
                                                                  }
                                                              }];
}

@end
