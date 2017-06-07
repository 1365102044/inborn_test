//
//  YBSettingViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSettingViewController.h"
#import "YBAboutUSViewController.h"
#import "YBFeedBackViewController.h"
#import "User_LocalData.h"
#import "ZJMineService.h"
#import "ZJBaseBarButtonItem.h"
#import "SDImageCache.h"
@interface YBSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) NSArray  * cellArr;
@property(nonatomic,strong) YBDefaultLabel * cacheLable;
@property(nonatomic,strong) UIButton * outLoginBtn;
@property(nonatomic,assign) double  cacheNumber;

@end

@implementation YBSettingViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 退出登录
 */
- (void)clickOutLoginBtn:(UIButton *)sender
{
    [[ZJMineService share] outLoginRequestSuccess:^(id objc, id requestInfo) {
        [User_LocalData delUserData];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"formefeedbookchangetabbarindex" object:nil userInfo:@{@"tabbarindex":@"4",
                                                                                                                @"ischangetabbar":@"YES"}];
    } fail:^(id error, id requestInfo) {
        
    }];
}

#pragma mark - Fourth.代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *indifiter = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indifiter];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indifiter];
    }else{
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    UIView *cellview = [self creatCellSubviewWith:self.cellArr[indexPath.row] indexpath:indexPath];
    cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(46));
    [cell.contentView addSubview:cellview];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)creatCellSubviewWith:(NSString *)titlestr indexpath:(NSIndexPath *)indexpath
{
    UIView *cellview = [[UIView alloc]init];
    
    YBDefaultLabel* tilelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                         text:titlestr
                                                    textColor:ZJCOLOR.color_c4];
    [cellview addSubview:tilelable];
    
    UIImageView *rightimageview = [[UIImageView alloc]init];
//    rightimageview.image = ZJIMAGE(IMAGEFILEPATH_MINE, @"details_moreitem_n", ZJProjectLoadImageDefault).firstObject;
    rightimageview.image = [UIImage imageNamed:@"details_moreitem_n"];
    [cellview addSubview:rightimageview];
    
    self.cacheLable =  [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13)
                                                text:@"(0.00M)"
                                           textColor:ZJCOLOR.color_c5];
    self.cacheLable.textAlignment = NSTextAlignmentRight;
    self.cacheLable.text = [NSString stringWithFormat:@"(%.2fM)",[self getCachesSize]];
    [cellview addSubview:self.cacheLable];
    
    UIView *lineview = [[UIView alloc]init];
    lineview.backgroundColor = ZJCOLOR.color_c16;
    [cellview addSubview:lineview];
    
    
    [tilelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cellview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.centerY.mas_equalTo(cellview.mas_centerY);
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(20)));
    }];
    
    [rightimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
        make.centerY.mas_equalTo(cellview.mas_centerY);
        make.right.mas_equalTo(cellview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
    }];
    
    [self.cacheLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(22)));
        make.centerY.mas_equalTo(cellview.mas_centerY);
        make.right.mas_equalTo(cellview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
    }];
    
    if (indexpath.row ==0 ||
        indexpath.row == 1) {
        [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(cellview.mas_bottom);
            make.left.mas_equalTo(cellview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(cellview.mas_right);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
    }
    
    if (indexpath.row == 1) {
        rightimageview.hidden = YES;
        self.cacheLable.hidden = NO;
    }else{
        rightimageview.hidden = NO;
        self.cacheLable.hidden = YES;
    }
    return cellview;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        YBAboutUSViewController *vc = [[YBAboutUSViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 1) {
        
        //清理
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *imageCachesPath = [cachesPath stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
        NSString *NetImageCachesPath = [cachesPath stringByAppendingPathComponent:@"com.bjInborn/fsCachedData"];
        NSFileManager *mgr = [[NSFileManager alloc] init];
        [mgr removeItemAtPath:imageCachesPath error:nil];
        [mgr removeItemAtPath:NetImageCachesPath error:nil];

        [SVProgressHUD showWithStatus:@"缓存清除中..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            self.cacheLable.text = @"(0.00M)";
            [self.tableview reloadData];
        });
    }else if (indexPath.row == 2){
        YBFeedBackViewController *feedbackvc = [[YBFeedBackViewController alloc]init];
        [self.navigationController pushViewController:feedbackvc animated:YES];
    }
}
#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.cellArr = @[@"关于我们",@"清除缓存",@"意见反馈"];
    
    [self.view addSubview:self.tableview];
    self.tableview.tableFooterView = [self creatfooterview];
    self.tableview.tableFooterView.height = ADJUST_PERCENT_FLOAT(66);
}

/**
 获取缓存大小
 */
- (double )getCachesSize
{
    // 获取Caches目录路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *imageCachesPath = [cachesPath stringByAppendingPathComponent:@"default/com.hackemist.SDWebImageCache.default"];
    long long fileSize = [imageCachesPath fileSize];
    self.cacheNumber = ((fileSize ) / (1000.0 * 1000.0) );
    return self.cacheNumber;
}

#pragma mark - Sixth.界面配置
- (UIView *)creatfooterview
{
    UIView *footerview = [[UIView alloc]init];
    
    self.outLoginBtn =[[UIButton alloc]init];
    self.outLoginBtn.backgroundColor = ZJCOLOR.color_c9;
    self.outLoginBtn.titleLabel.font = SYSTEM_REGULARFONT(14);
    [self.outLoginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.outLoginBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
    [footerview addSubview:self.outLoginBtn];
    self.outLoginBtn.layer.cornerRadius = 3;
    self.outLoginBtn.layer.masksToBounds = YES;
    [self.outLoginBtn addTarget:self action:@selector(clickOutLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.outLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(footerview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.right.mas_equalTo(footerview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(44));
        make.top.mas_equalTo(footerview).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.centerX.mas_equalTo(footerview.mas_centerX);
    }];
    
    return footerview;
}
#pragma mark - Seventh.懒加载
/**
 懒加载
 */
-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(46);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableview;
}

@end
