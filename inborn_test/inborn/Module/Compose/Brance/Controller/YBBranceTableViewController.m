//
//  YBBranceTableViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBBranceTableViewController.h"
#import "YBComposeService.h"
#import "YBBranceModel.h"
#import "YBBranceCell.h"
#import "ChineseString.h"

@interface YBBranceTableViewController ()

/**
 分组头数组
 */
@property (nonatomic, strong) NSArray *titleArray;

/**
 品牌数组
 */
@property (nonatomic, strong) NSArray *brandArray;

/**
 品牌模型数组
 */
@property (nonatomic, strong) NSArray *brandModelArray;

@end

@implementation YBBranceTableViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

/**
 赋值
 
 @param brandArray brandArray
 */
- (void)setBrandArray:(NSArray *)brandArray
{
    NSMutableArray *tempArrayM = [NSMutableArray array];
    for (NSInteger i = 0; i < brandArray.count; i++) {
        YBBranceModel *model = brandArray[i];
        YBLog(@"%@", model.brandName);
        [tempArrayM addObject:model.brandName];
    }
    self.titleArray = [ChineseString IndexArray:tempArrayM];
    _brandArray = [ChineseString LetterSortArray:tempArrayM];
    
    [self.tableView reloadData];
    [self hiddenMaskView];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <UITableViewDataSource>

/**
 返回组
 
 @param tableView tableView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.brandArray[section] count];
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBBranceCell *cell = [tableView dequeueReusableCellWithIdentifier:YBBranceCellReuseIdentifier];
    if (cell == nil) {
        cell = [[YBBranceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YBBranceCellReuseIdentifier];
    }
    cell.titleLabel.text = self.brandArray[indexPath.section][indexPath.row];
    if (indexPath.row == ([self.brandArray[indexPath.section] count] - 1)) {
        cell.bottomSpacingLineView.hidden = YES;
    }else{
        cell.bottomSpacingLineView.hidden = NO;
    }
    return cell;
}

/**
 返回索引内容
 
 @param tableView tableView
 
 @return return
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.titleArray;
}

/**
 组头
 
 @param tableView tableView
 @param section   section
 
 @return 分类组头
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titleArray[section];
}

/**
 回调选中的品牌
 
 @param tableView tableView
 @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"brandName == %@", self.brandArray[indexPath.section][indexPath.row]];
    NSArray *screenTempArray = [self.brandModelArray filteredArrayUsingPredicate:predicate];
    
    if ([self.selectedDelegate respondsToSelector:@selector(branceTableViewController:slectedBrandModel:)]) {
        [self.selectedDelegate branceTableViewController:self slectedBrandModel:screenTempArray.firstObject];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showMaskView];
    [self loadGoodBrand];
    //** 设置界面 */
    self.tableView.sectionIndexColor = ZJCOLOR.color_c6;
    self.navigationItem.title = @"品牌";
    self.tableView.backgroundColor = ZJCOLOR.color_c12;
    self.tableView.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
    self.tableView.sectionFooterHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.加载网络数据

/**
 加载网络数据
 */
- (void)loadGoodBrand
{
    [[YBComposeService share] getGoodBranceSuccess:^(id objc, id requestInfo) {
        NSMutableArray *tempArray = [NSMutableArray array];
        [objc[@"data"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tempArray addObject:[YBBranceModel modelWithDictionary:obj]];
        }];
        self.brandModelArray = tempArray.copy;
        self.brandArray = tempArray.copy;
    } fail:^(id error, id requestInfo) {
        
    }];
}

#pragma mark - Eighth.懒加载

@end
