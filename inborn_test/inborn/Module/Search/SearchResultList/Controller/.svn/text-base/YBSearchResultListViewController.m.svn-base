//
//  YBSearchResultListViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchResultListViewController.h"
#import "YBSearchResultListViewModel.h"
#import "YBSearchResultListController.h"
#import "YBSearchBarView.h"

@interface YBSearchResultListViewController ()

/**
 视图模型
 */
@property (nonatomic, strong) YBSearchResultListViewModel *goodListViewModel;

/**
 用户输入内容
 */
@property (nonatomic, copy) NSString *searchContentText;

@end

@implementation YBSearchResultListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setGoodListViewModel:(YBSearchResultListViewModel *)goodListViewModel
{
    _goodListViewModel                                  = goodListViewModel;
    
    /**
     *  创建商品列表视图
     */
    
    /**
     *  创建商品列表视图
     */
    [self.view insertSubview:self.contentScrollView atIndex:0];
    YBSearchResultListController *goodListController            = [[YBSearchResultListController alloc] init];
    goodListController.searchResultGoodListViewModel            = goodListViewModel;
    [self.goodListControllersArray addObject:goodListController];
    [self setupSubGoodListControllersWithScrollView:self.contentScrollView];
    [self addChildViewController:goodListController];
}

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    if (sender.tag == 1001) {
        
        /**
         *  返回
         */
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark <YBGoodListControllerDelegate>

- (void)goodListController:(YBGoodListController *)goodListController
             contentOffSet:(CGPoint)contentOffset
{
    //    YBLog(@"%@\n%f", NSStringFromCGPoint(contentOffset), self.navigationController.navigationBar.ex_y);
    //    /**
    //     *  上滑，品牌分类悬停并修改为条件筛选、NavigationBar隐藏、tabBar隐藏
    //     *  下滑，条件筛选改为品牌分类、NavigationBar显示、tabBar显示
    //     */
    //
    //    /**
    //     *  上滑&&控件为显示状态下
    //     */
    //    if (self.currentOffsetY < contentOffset.y
    //        && self.categoriesController.collectionView.ex_y == STATUS_AND_NAVIGATION_HEIGHT
    //        && self.currentOffsetY > 100.f) {
    //
    //        YBLog(@"上滑动");
    //
    //        [self.categoriesController.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
    //            make.left.right.mas_equalTo(self.view);
    //            make.top.mas_equalTo(STATUS_BAR_HEIGHT);
    //            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(goodListConditionalScreeningViewHeight));
    //        }];
    //
    //        [UIView animateWithDuration:0.25 animations:^{
    //
    //            /**
    //             *  上滑动画体
    //             */
    //            self.navigationController.navigationBar.ex_y        = -self.navigationController.navigationBar.height + STATUS_BAR_HEIGHT;
    //            [self changeNavigationSubViewsAlpha:0.01];
    //            [self.view layoutIfNeeded];
    //
    //        } completion:^(BOOL finished) {
    //
    //        }];
    //    }
    //
    //    /**
    //     *  下滑&&控件为隐藏状态
    //     */
    //    if (self.currentOffsetY > contentOffset.y
    //        && self.categoriesController.collectionView.ex_y == STATUS_BAR_HEIGHT
    //        && self.currentOffsetY < goodListController.collectionView.contentSize.height - 1000) {
    //
    //        YBLog(@"下滑动");
    //
    //        [self.categoriesController.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
    //            make.left.right.mas_equalTo(self.view);
    //            make.top.mas_equalTo(self.view).mas_offset(STATUS_AND_NAVIGATION_HEIGHT);
    //            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(goodListConditionalScreeningViewHeight));
    //        }];
    //
    //        [UIView animateWithDuration:0.25 animations:^{
    //
    //            /**
    //             *  下滑动画体
    //             */
    //            self.navigationController.navigationBar.ex_y        = STATUS_BAR_HEIGHT;
    //            [self changeNavigationSubViewsAlpha:1.0];
    //            [self.view layoutIfNeeded];
    //
    //        } completion:^(BOOL finished) {
    //
    //        }];
    //    }
    //
    //    /**
    //     *  记录当前的偏移量
    //     */
    //    self.currentOffsetY                                         = contentOffset.y;
}

#pragma mark - Fifth.控制器生命周期

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _goodListViewModel                                          = [[YBSearchResultListViewModel alloc] init];
    
    [self setupCustomNavigation];
    [self setupCustomUI];
    [self loadData];
}

#pragma mark - Sixth.界面配置

/**
 配置Navigation
 */
- (void)setupCustomNavigation
{
    [super setupCustomNavigation];
    
    
    /**
     *  左侧按钮
     */
    YBDefaultButton *leftButton                 = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                     imageNamed:@"public_back"
                                                                                           type:ZJProjectButtonSetBackgroundImage
                                                                                         target:self
                                                                                       selector:@selector(buttonClick:)];
    leftButton.tag                              = 1001;
    
    /**
     *  中间搜索框
     */
    YBSearchBarView *searchBarView              = [YBSearchBarView creatSearchBarViewWithType:notEditType
                                                                         textfieldPlacehodler:ZJSTRING(_searchContentText)
                                                                                   clickBlock:^(NSString *textfile, searchBarType type) {
                                                                                       
                                                                                       /**
                                                                                        *  跳转搜索界面
                                                                                        */
                                                                                       [self.navigationController popViewControllerAnimated:YES];
                                                                                   }];
    
    [self.translucentBgView addSubview:leftButton];
    [self.translucentBgView addSubview:searchBarView];
    
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.translucentBgView).mas_offset(12.f);
        make.top.mas_equalTo(self.translucentBgView).mas_offset(28.f);
        make.width.height.mas_equalTo(28.f);
    }];
    
    [searchBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftButton.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(4.f));
        make.right.mas_equalTo(self.translucentBgView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.top.bottom.mas_equalTo(leftButton);
    }];
}

/**
 配置UI界面
 */
- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.categoriesController.type                                  = YBGoodListViewConditionalScreening;
    
    [self.categoriesController.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(STATUS_AND_NAVIGATION_HEIGHT);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(goodListConditionalScreeningViewHeight));
    }];
}

#pragma mark - Seventh.懒加载

#pragma mark - Eight.LoadData

/**
 加载数据
 
 @param searchText searchText
 */
- (void)loadDataViewSearchText:(NSString *)searchText
{
    self.searchContentText = searchText;
}

- (void)loadData
{
    WEAKSELF(self);
    [self.goodListViewModel searchCategoryGoodListWithKey:self.searchContentText
                                             orderByFiled:@""
                                              orderByType:@""
                                                  curPage:@"1"
                                                  success:^(id model) {
                                                      weakself.goodListViewModel                              = (YBSearchResultListViewModel *)model;
                                                      
                                                      if (!self.goodListViewModel.goodListArray
                                                          || self.goodListViewModel.goodListArray.count == 0) {
                                                          [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                                    tipsString:@"暂无数据"
                                                                                   buttonTitle:nil];
                                                      }else{
                                                          [self hiddenMaskView];
                                                      }
                                                      
                                                  } faileBlock:^(id error) {
                                                      
                                                      if (!self.goodListViewModel.goodListArray
                                                          || self.goodListViewModel.goodListArray.count == 0) {
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
