//
//  YBSearchHistoryRecordViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchHistoryRecordViewController.h"
#import "YBSearchRecordTableViewCell.h"
#import "YBSearchBarView.h"
#import "User_LocalData.h"
#import "YBSearchResultListViewController.h"
#import "YBBlankpageView.h"

@interface YBSearchHistoryRecordViewController ()<UITableViewDelegate,UITableViewDataSource,removeRowDelegate>

@property(nonatomic,strong) ZJBaseView * naviBarView;
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) ZJBaseView * headerTableView;
@property(nonatomic,strong) ZJBaseView * footerTableView;
@property(nonatomic,strong) YBSearchBarView * searchBarView;
@property(nonatomic,strong) UIImageView * line;
@property(nonatomic,strong) ZJBaseButton * titleBtn;
@property(nonatomic,strong) YBDefaultButton * cancleBtn;
@property(nonatomic,strong) YBDefaultButton * footerBtn;
@property(nonatomic,strong) NSArray * searchData;
@property(nonatomic,strong) YBBlankpageView * addblankpage;

@end

@implementation YBSearchHistoryRecordViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
- (void)clickSearchBarView:(NSString *)textContent type:(searchBarType)type
{
//    YBLog(@"搜索条件+%@+%ld",textContent,(long)type);
    if (textContent.length == 0 || [textContent isEqualToString:@""]) {
        textContent = @"爱马仕";
    }else{
        if (textContent) {
            [User_LocalData saveUserSearchHistoryLocalDataWithSearchContent:textContent];
        }
    }
    [self checkIsHiddenFooterView];
    YBSearchResultListViewController *searchresultvc = [[YBSearchResultListViewController alloc]init];
    [searchresultvc loadDataViewSearchText: textContent];
    [self.navigationController pushViewController:searchresultvc animated:YES];
}

/**
  点击取消
 */
- (void)clickCancleBtn:(UIButton *)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 点击清除记录
 */
- (void)clickFooterBtn:(UIButton *)sender
{
    [User_LocalData deleteAllSearchHistoryLocalData];
    [self checkIsHiddenFooterView];
}

#pragma mark - Fourth.代理方法
/**
 点击cell上的移除
 */
- (void)removeWithTitle:(NSString *)titleStr
{
    [User_LocalData deleteSearchHistoryLoaclDataWithSearchHistoryId:titleStr];
    [self checkIsHiddenFooterView];
    
}

/**
 是否隐藏footer view
 */
- (void)checkIsHiddenFooterView
{
    self.searchData = [User_LocalData getUserSearchHigtoryLocalDataWithUserId:nil];
    [self.tableView reloadData];
    if (self.searchData.count<=0) {
        self.tableView.tableFooterView.hidden = YES;
        self.addblankpage.hidden = NO;
    } else {
        self.tableView.tableFooterView.hidden = NO;
        self.addblankpage.hidden = YES;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBSearchRecordTableViewCell *cell       = [tableView dequeueReusableCellWithIdentifier:SEARCHHISTORYRECORDIDENTIFIER];
    if (!cell) {
        cell                                = [[YBSearchRecordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SEARCHHISTORYRECORDIDENTIFIER];
    }
    cell.selectionStyle                     = UITableViewCellSelectionStyleNone;
    cell.delegate                           = self;
    cell.searchTitle                        = self.searchData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *tempStr = [self.searchData objectAtIndex:indexPath.row];
    [User_LocalData deleteSearchHistoryLoaclDataWithSearchHistoryId:tempStr];
    [User_LocalData saveUserSearchHistoryLocalDataWithSearchContent:tempStr];
    [self checkIsHiddenFooterView];
    
    YBSearchResultListViewController *searchresultvc = [[YBSearchResultListViewController alloc]init];
    [searchresultvc loadDataViewSearchText: tempStr];
    [self.navigationController pushViewController:searchresultvc animated:YES];
}

#pragma mark - Fifth.控制器生命周期

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = YES;
    [self checkIsHiddenFooterView];
    if (_searchBarView) {
        [_searchBarView becomFristResponder];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    [_searchBarView resginFristResponder];
}

/**
 初始化
 */
+ (instancetype)creatSeachHistoryRecordViewControllerExtend:(id)extend
{
    YBSearchHistoryRecordViewController *seachrecordvc = [[YBSearchHistoryRecordViewController alloc]init];
    return seachrecordvc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

#pragma mark - Sixth.界面配置
- (void)setUI
{
    [self.view addSubview:self.naviBarView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.headerTableView];
    [self.view addSubview:self.addblankpage];
    self.tableView.tableFooterView                    = self.footerTableView;
    self.tableView.tableFooterView.height             = 70;
    [self setContrans];
}

/**
 设置约束
 */
- (void)setContrans
{
    [_naviBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(STATUS_AND_NAVIGATION_HEIGHT));
    }];
    
    [_cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_naviBarView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(40),
                                        ADJUST_PERCENT_FLOAT(30)));
        make.top.mas_equalTo(_naviBarView.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(30));
    }];
    
    [_searchBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_naviBarView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.right.mas_equalTo(_cancleBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(30));
        make.centerY.mas_equalTo(_cancleBtn.mas_centerY);
    }];
    
    [_headerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_naviBarView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.left.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
    }];
    
    [_addblankpage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerTableView.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.top.mas_equalTo(_headerTableView.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(120),
                                        ADJUST_PERCENT_FLOAT(20)));
    }];
 
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_headerTableView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-1));
        make.left.mas_equalTo(_headerTableView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.right.mas_equalTo(_headerTableView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-20));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view).mas_offset(0);
        make.top.mas_equalTo(_headerTableView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(5));
    }];

    [_footerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(120),
                                        ADJUST_PERCENT_FLOAT(30)));
        make.centerX.mas_equalTo(_footerTableView.mas_centerX);
        make.bottom.mas_equalTo(_footerTableView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-5));
    }];
}

#pragma mark - Seventh.懒加载
/**
 历史搜索
 */
- (ZJBaseView *)headerTableView
{
    if (!_headerTableView) {
        _headerTableView                    = [[ZJBaseView alloc]init];
        
        self.titleBtn          =  [YBDefaultButton buttonImageAndTitleWithTitleStringKey:SEARCH_HISTORY_STRINGKEY
                                                                                           titleColor:ZJCOLOR.color_c4
                                                                                            titleFont:SYSTEM_REGULARFONT(14) imageFilePath:IMAGEFILEPATH_SEARCH
                                                                                           imageNamed:@"history_earch_icon"
                                                                                    type:ZJProjectButtonSetImage
                                                                                               target:self
                                                                                             selector:nil];
        [self.titleBtn setImage:[UIImage imageNamed:@"history_earch_icon"] forState:UIControlStateNormal];
        [_headerTableView addSubview:self.titleBtn];
        self.titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -ADJUST_PERCENT_FLOAT(20), 0, 0);
        self.line               = [[UIImageView alloc]init];
        self.line.backgroundColor = ZJCOLOR.color_c16;
        [_headerTableView addSubview:self.line];
        
    }
    return _headerTableView;
}

/**
 清除历史记录
 */
- (ZJBaseView *)footerTableView{
    if (!_footerTableView) {
        _footerTableView                        = [[ZJBaseView alloc]init];
        
        YBDefaultButton * footerBtn             = [YBDefaultButton buttonWithTitleStringKey:SEARCH_CANCELHISTORY_STRINGKEY
                                                                                 titleColor:ZJCOLOR.color_c4
                                                                                  titleFont:SYSTEM_REGULARFONT(12)
                                                                                     target:self
                                                                                   selector:@selector(clickFooterBtn:)];
        [_footerTableView addSubview:footerBtn];
        _footerBtn                              = footerBtn;
    }
    return _footerTableView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView                                  = [[UITableView alloc]init];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.rowHeight                        = 50;
        _tableView.delegate                         = self;
        _tableView.dataSource                       = self;
        _tableView.separatorStyle                   = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

/**
 搜索框
 */
- (YBSearchBarView *)searchBarView{
    if (!_searchBarView) {
        WEAKSELF(self)
        _searchBarView                              = [YBSearchBarView creatSearchBarViewWithType:canEditType textfieldPlacehodler:ZJSTRING(@"爱马仕")
                                                       clickBlock:^(NSString *textfile, searchBarType type) {
                                                           [weakself clickSearchBarView:textfile type:type];
                                                       }];
        [_searchBarView becomFristResponder];
    }
    return _searchBarView;
}

/**
 导航栏
 */
- (ZJBaseView *)naviBarView{
    if (!_naviBarView) {
        _naviBarView                                = [[ZJBaseView alloc]init];
        [_naviBarView addSubview:self.searchBarView];
        
        self.cancleBtn                     = [YBDefaultButton buttonWithTitleStringKey:@"" titleColor:ZJCOLOR.color_c2 titleFont:SYSTEM_REGULARFONT(14) target:self selector:@selector(clickCancleBtn:)];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_naviBarView addSubview:_cancleBtn];
        
           }
    return _naviBarView;
}

/**
 数据数组
 */
- (NSArray *)searchData {
    if (!_searchData) {
        _searchData = [NSArray array];
    }
    return _searchData;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)])        [cell setSeparatorInset:UIEdgeInsetsZero];
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)])         [cell setLayoutMargins:UIEdgeInsetsZero];
}
- (YBBlankpageView *)addblankpage{
    if(!_addblankpage){
        _addblankpage = [[YBBlankpageView alloc]init];
        _addblankpage.tipsText = ZJSTRING(@"你还没有任何历史搜索记录");
    }
    return _addblankpage;
}

@end
