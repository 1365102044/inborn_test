//
//  YBAddressAndPickListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAddressAndPickListViewController.h"
#import "YBAddressViewOrPickpersonView.h"
#import "ZJBaseBarButtonItem.h"
#import "YBAddNewAddressOrPickpersonViewController.h"
#import "YBAddressAndPickpersonService.h"
#import "YBAddressAndPickPersonModel.h"
#import "YBBlankpageView.h"
#import "YBCommitLogitcsViewController.h"
static NSInteger MAXPage = 8;
static NSString *ADDRESSANDPICKPERSINCELLINDIFITER = @"ADDRESSANDPICKPERSINCELLINDIFITER";
@interface YBAddressAndPickListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign) CGFloat  cellHEI;

@property(nonatomic,assign) ViewControllerType  VcType;
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * dataModleArr;
@property(nonatomic,strong) YBAddressBaseModel * dataBaseModel;
@property(nonatomic,assign) NSInteger  cureenPage;
@property(nonatomic,assign) NSInteger  tolalPage;

@property(nonatomic,strong) YBBlankpageView * blankPageView;

/**
 来源控制器
 */
@property (nonatomic, weak) UIViewController *sourceController;

@property(nonatomic,assign) NSInteger  selectIndexDefalut;

@end

@implementation YBAddressAndPickListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark  *** 网络请求

/**
 请求列表数据
 addressType 地址类型：1收货人，2提货人
 */
- (void)loadListdatawithType
{
    self.cureenPage = 1;
    NSString *addressTypestr;
    if (_VcType == addressType) {
        addressTypestr = @"1";
    }else if (_VcType == pickPersonType){
        addressTypestr = @"2";
    }
    
    [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:self.cureenPage pageSize:MAXPage addressType:addressTypestr Success:^(id objc, id requestInfo) {
        self.dataBaseModel = [YBAddressBaseModel modelWithDictionary:objc[@"data"]];
        if (self.dataBaseModel.totalRows ==0 || !self.dataBaseModel.totalRows) {
            
            self.tableView.tableHeaderView = self.blankPageView;
            self.tableView.tableHeaderView.height = SCREEN_HEIGHT;
            self.tableView.mj_footer.hidden = YES;
            
        }else{
            [self.blankPageView removeFromSuperview];
            self.tableView.tableHeaderView.height = 0;
            self.tableView.mj_footer.hidden = NO;
        }
        if (self.dataBaseModel.totalRows <= MAXPage) {
            self.tableView.mj_footer.hidden = YES;
        }else{
            self.tableView.mj_footer.hidden = NO;
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer resetNoMoreData];
        [self.tableView reloadData];
    } fail:^(id error, id requestInfo) {
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 上啦加载
 */
- (void)loadMoreListdatawithType
{
    self.cureenPage ++;
    if(self.dataBaseModel.totalRows%MAXPage==0)
    {
        self.tolalPage = self.dataBaseModel.totalRows/MAXPage;
    }else{
        self.tolalPage = self.dataBaseModel.totalRows/MAXPage+1;
    }
    if (self.cureenPage >self.tolalPage) {
        
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView.mj_footer endEditing:YES];
        return;
    }else{
        [self.tableView.mj_footer resetNoMoreData];
    }
    NSString *addressTypestr;
    if (_VcType == addressType) {
        addressTypestr = @"1";
    }else if (_VcType == pickPersonType){
        addressTypestr = @"2";
    }
    
    [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:self.cureenPage pageSize:MAXPage addressType:addressTypestr Success:^(id objc, id requestInfo) {
        YBAddressBaseModel *modelarr = [YBAddressBaseModel modelWithDictionary:objc[@"data"]];
        NSMutableArray *temparr = self.dataBaseModel.dataModelArr;
        [temparr addObjectsFromArray:modelarr.dataModelArr];
        self.dataBaseModel.dataModelArr = temparr;
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    } fail:^(id error, id requestInfo) {
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - Third.点击事件
/**
 tag:
 10             默认
 11             编辑
 12             删除
 13             添加
 */
- (void)clickcellSubviewBtn:(NSInteger )tag dataModel:(YBAddressAndPickPersonModel *)dataModel selectIndexDefalut:(NSInteger)selectIndexDefalut
{
    if (tag == 13) {
        /**
         没有数据的时候 增加才设为默认
         */
        if (self.dataBaseModel.totalRows == 0 ) {
            YBAddNewAddressOrPickpersonViewController *addvc = [YBAddNewAddressOrPickpersonViewController creatAddNewViewControllerWith:_VcType  Extend:@{@"addFrist":@"addFrist"}];
            [self.navigationController pushViewController:addvc animated:YES];
            return;
        }
        YBAddNewAddressOrPickpersonViewController *addvc = [YBAddNewAddressOrPickpersonViewController creatAddNewViewControllerWith:_VcType  Extend:nil];
        [self.navigationController pushViewController:addvc animated:YES];
    }else if (tag == 11){
        YBAddNewAddressOrPickpersonViewController *addvc = [YBAddNewAddressOrPickpersonViewController creatAddNewViewControllerWith:_VcType Extend:@{@"isedit":@"isedit"}];
        addvc.dataModel = dataModel;
        [self.navigationController pushViewController:addvc animated:YES];
    }else if (tag == 10){
        [[YBAddressAndPickpersonService share] setDefaultAddressOrPickpersonInfoWithcustomId:dataModel.customId
                                                                                     Success:^(id objc, id requestInfo) {
//                                                                                         [self loadListdatawithType];
                                                                                         [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"changeDefalutBtnImage" object:nil];
                                                                                         
                                                                                         self.selectIndexDefalut = selectIndexDefalut + 1;
                                                                                         [self.tableView reloadData];
                                                                                     } fail:^(id error, id requestInfo) { }];
    }else if (tag == 12)
    {
        NSString *alearStr;
        if (_VcType == addressType) {
            alearStr = @"确定删除提货人信息?";
        }else if (_VcType == pickPersonType)
        {
            alearStr = @"确定删除收货地址?";
        }
        
        
        //创建AlertController对象 preferredStyle可以设置是AlertView样式或者ActionSheet样式
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:alearStr message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        //创建取消按钮
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleCancel
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
                                                        }];
        
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"确定删除"
                                                          style:UIAlertActionStyleDestructive
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            [[YBAddressAndPickpersonService share] deleteAddressOrPickpersonInfoWithcustomId:dataModel.customId
                                                                                                                                     Success:^(id objc, id requestInfo) {
                                                                                                                                         [self loadListdatawithType];
                                                                                                                                     } fail:^(id error, id requestInfo) {
                                                                                                                                         
                                                                                                                                     }];
                                                        }];
        //添加按钮
        [alertC addAction:action1];
        [alertC addAction:action3];
        //显示
        [self presentViewController:alertC animated:YES completion:nil];
        
    }
}

#pragma mark - Fourth.代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataBaseModel.dataModelArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    YBAddressViewOrPickpersonView* publicCellView = [[YBAddressViewOrPickpersonView alloc]init];
    [publicCellView setCellViewWith:_VcType];
    publicCellView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _cellHEI);
    [cell addSubview:publicCellView];
    YBAddressAndPickPersonModel *model = self.dataBaseModel.dataModelArr[indexPath.section];
    if (_VcType == addressType) model.modelType = @"addre";
    else if (_VcType == pickPersonType) model.modelType = @"pick";
    [publicCellView setModel:model vctype:_VcType isselectindex:self.selectIndexDefalut indexRow:indexPath.section];
    WEAKSELF(self)
    publicCellView.clickBlock = ^(NSInteger tag, YBAddressAndPickPersonModel *dataModel, NSInteger indexrow) {
        
        [weakself clickcellSubviewBtn:tag dataModel:dataModel selectIndexDefalut:indexrow];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBLog(@"--");
    
    /**
     *  选中地址回调
     */
    if (self.delegate
        && [self.delegate respondsToSelector:@selector(addressAndPickListViewController:addressModel:)]) {
        YBLog(@"%@", self.dataBaseModel.dataModelArr[indexPath.section]);
        [self.delegate addressAndPickListViewController:self addressModel:self.dataBaseModel.dataModelArr[indexPath.section]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Fifth.控制器生命周期
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadListdatawithType];
    self.selectIndexDefalut = -1;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_back"
                                                                                                     callBack:^(id sender) {
                                                                                                         if ([self.delegate respondsToSelector:@selector(addressAndPickListViewController:addressModel:)]
                                                                                                             && self.delegate) {
                                                                                                             if ([self.sourceController isKindOfClass:[YBCommitLogitcsViewController class]]) {
                                                                                                                 if (self.dataBaseModel.dataModelArr.count==0) {
                                                                                                                     [self.delegate addressAndPickListViewController:self addressModel:nil];
                                                                                                                 }else{
                                                                                                                     
                                                                                                                     [self.delegate addressAndPickListViewController:self addressModel:self.dataBaseModel.dataModelArr[0]];
                                                                                                                 }
                                                                                                                 [self.navigationController popViewControllerAnimated:YES];
                                                                                                                 return ;
                                                                                                             }
                                                                                                             /**
                                                                                                              *  传入nil时，后面会发送请求校验是否含上一次选中的地址
                                                                                                              */
                                                                                                             [self.delegate addressAndPickListViewController:self addressModel:nil];
                                                                                                         }
                                                                                                         [self.navigationController popViewControllerAnimated:YES];
                                                                                                     }];
    self.navigationItem.leftBarButtonItem               = backButtonItem;
}

/**
 初始化
 */
+ (instancetype)creatAddressAndPickPersonViewControllerWithType:(ViewControllerType)VcType
                                                         Extend:(id)entend
{
    YBAddressAndPickListViewController *viewcontroller = [[YBAddressAndPickListViewController alloc]init];
    viewcontroller.sourceController                    = (UIViewController *)entend;
    viewcontroller.VcType                               = VcType;
    return viewcontroller;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.VcType == addressType) {
        self.title = ZJSTRING(@"地址管理");
        _cellHEI = ADJUST_PERCENT_FLOAT(164);
    }else if (self.VcType == pickPersonType){
        self.title = ZJSTRING(@"提货人管理");
        _cellHEI = ADJUST_PERCENT_FLOAT(120);
    }
    
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadListdatawithType)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreListdatawithType)];
    ZJBaseBarButtonItem *rightitem = [ZJBaseBarButtonItem barButtonItemWithTitleStringKey:@"添加" callBack:^(id sender) {
        [self clickcellSubviewBtn:13 dataModel:nil selectIndexDefalut:-1];
    }];
    self.navigationItem.rightBarButtonItem = rightitem;
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.rowHeight = _cellHEI;
        UIView *footerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(30))];
        _tableView.tableFooterView = footerview;
        _tableView.tableFooterView.height = ADJUST_PERCENT_FLOAT(30);
    }
    return _tableView;
}

- (YBBlankpageView *)blankPageView{
    //    if (!_blankPageView) {
    _blankPageView = [[YBBlankpageView alloc]initWithFrame:self.view.bounds];
    //    }
    return _blankPageView;
}
@end
