//
//  YBHomePageGoodListController.m
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBHomePageGoodListController.h"
#import "YBHomePageViewModel.h"
#import "YBSearchResultListViewModel.h"

@interface YBHomePageGoodListController ()

@end

@implementation YBHomePageGoodListController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setHomePageGoodListViewModel:(YBHomePageViewModel *)homePageGoodListViewModel
{
    _homePageGoodListViewModel  = homePageGoodListViewModel;
    self.viewModel              = homePageGoodListViewModel;
    
    /**
     *  配置界面
     */
    
    /**
     数据数组
     */
    self.goodDataArray          = homePageGoodListViewModel.goodListArray;
    
    /**
     广告数据
     */
    self.adsArray               = homePageGoodListViewModel.adsArray;
    
    /**
     广告图片url数组
     */
    self.adsImageUrlStrings     = homePageGoodListViewModel.adsImageUrlStrings;
    
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView reloadData];
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)setGetNewData:(BOOL)getNewData
{
    /**
     *  不保存数据，第一次刷新界面
     */
    if (!self.goodDataArray
        || self.goodDataArray.count == 0) {
        
        [self loadNewData];
    }
}

#pragma mark - Third.点击事件

/**
 加载新数据
 */
- (void)loadNewData
{
    [self.collectionView.mj_footer resetNoMoreData];
    
    /**
     *  根据分类获取数据
     */
    self.collectionView.userInteractionEnabled = NO;
    YBHomePageViewModel *homePageViewModel = self.homePageGoodListViewModel;
    self.adsArray = nil;
    self.adsImageUrlStrings = nil;
    [homePageViewModel getCategoryGoodListWithTabId:self.categoriesModel.customId
                                            curPage:@"1"
                                               sort:homePageViewModel.sort
                                             search:homePageViewModel.serach
                                            success:^(id model) {
                                                
                                                [self.collectionView.mj_header endRefreshing];
                                                self.collectionView.userInteractionEnabled = YES;
                                                
                                                if (!self.homePageGoodListViewModel.goodListArray
                                                    || self.homePageGoodListViewModel.goodListArray.count == 0) {
                                                    [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                              tipsString:@"暂无数据"
                                                                             buttonTitle:nil];
                                                }else{
                                                    [self hiddenMaskView];
                                                }
                                                self.homePageGoodListViewModel = (YBHomePageViewModel *)model;
                                                
                                            } faileBlock:^(id error) {
                                                
                                                [self.collectionView.mj_header endRefreshing];
                                                self.collectionView.userInteractionEnabled = YES;
                                                
                                                if (!self.homePageGoodListViewModel.goodListArray
                                                    || self.homePageGoodListViewModel.goodListArray.count == 0) {
                                                    [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                              tipsString:@"暂无数据"
                                                                             buttonTitle:nil];
                                                }
                                                
                                                /**
                                                 *  如果errorCode == -1009 无网络
                                                 */
                                                if ([error code] == -1009
                                                    || [error code] == -1001) {
                                                    [self showTempViewWithLogoImageNamed:@"blank_net_bg"
                                                                              tipsString:@"糟糕，网络好像出问题了"
                                                                             buttonTitle:nil];
                                                }
                                            }];
}

/**
 加载更多
 */
- (void)loadMoreData
{
    if ([self.homePageGoodListViewModel.pageDataModel.pageNum integerValue] + 1 > [self.homePageGoodListViewModel.pageDataModel.pages integerValue]) {
        
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    
    /**
     *  根据分类获取数据
     */
    YBHomePageViewModel *homePageViewModel = self.homePageGoodListViewModel;
    [homePageViewModel getCategoryGoodListWithTabId:self.categoriesModel.customId
                                            curPage:[NSString stringWithFormat:@"%zd", [self.homePageGoodListViewModel.pageDataModel.pageNum integerValue] + 1]
                                               sort:homePageViewModel.sort
                                             search:homePageViewModel.serach
                                            success:^(id model) {
                                                [self.collectionView.mj_footer endRefreshing];
                                                self.homePageGoodListViewModel = (YBHomePageViewModel *)model;
                                            } faileBlock:^(id error) {
                                                [self.collectionView.mj_footer endRefreshing];
                                            }];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _homePageGoodListViewModel                                          = [[YBHomePageViewModel alloc] init];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

#pragma mark - Eight.LoadData

/**
 条件搜索刷新数据
 
 @param sort                    price_asc,price_desc,collection_desc,browse_desc
 @param search                  搜索条件
 @param curPage                 当前页
 */
- (void)searchDataWithSort:(NSString *)sort
                    search:(NSString *)search
                   curPage:(NSString *)curPage
{
    /**
     *  配置搜索参数
     */
    self.homePageGoodListViewModel.sort = sort;
    self.homePageGoodListViewModel.serach = search;
    
    [self loadNewData];
}

@end
