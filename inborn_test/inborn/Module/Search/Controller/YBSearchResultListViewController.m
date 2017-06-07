//
//  YBSearchResultListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchResultListViewController.h"
#import "YBSearchBarView.h"
#import "YBSearchHistoryRecordViewController.h"
@interface YBSearchResultListViewController ()

@property(nonatomic,strong) YBSearchBarView * searchBarView;

@end

@implementation YBSearchResultListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
- (void)clickSearchBarViewInResultList:(NSString *)textContent type:(searchBarType)type
{
    if (type == notEditType) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

/**
 搜索框
 */
- (YBSearchBarView *)searchBarView{
    if (!_searchBarView) {
        WEAKSELF(self)
        _searchBarView                              = [YBSearchBarView creatSearchBarViewWithType:canEditType textfieldPlacehodler:@"请输入(test)"];
        _searchBarView.clickBlock                   = ^(NSString *textConten,searchBarType type){
            [weakself clickSearchBarViewInResultList:textConten type:type];
        };
    }
    return _searchBarView;
}
@end
