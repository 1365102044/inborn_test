//
//  YBSelectedListAlert.m
//  inborn
//
//  Created by 郑键 on 17/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSelectedListAlert.h"
#import "ZJBaseTableView.h"
#import "YBSelectedListAlertCell.h"
#import "YBSelectedListAlertModel.h"

@interface YBSelectedListAlert() <UITableViewDataSource, UITableViewDelegate>

/**
 alertModelArray
 */
@property (nonatomic, strong) NSArray *alertModelArray;

/**
 列表视图
 */
@property (nonatomic, strong) ZJBaseTableView *tableView;

/**
 点击回调
 */
@property (nonatomic, copy) ZJEventCallBackBlock callBackBlock;

/**
 上一次选中的模型
 */
@property (nonatomic, strong) YBSelectedListAlertModel *currentAlerModel;

/**
 topMargin
 */
@property (nonatomic, assign) CGFloat topMargin;

@end

@implementation YBSelectedListAlert

static CGFloat selectedListCellHeight = 45.f;

+ (instancetype)sharedAlert
{
    static id alertInstance                 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertInstance                       = [[self alloc] initWithFrame:CGRectMake(0,
                                                                                     0,
                                                                                     SCREEN_WIDTH,
                                                                                     SCREEN_HEIGHT)];
    });
    return alertInstance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    /**
     *  背景透明
     */
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.tableView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setAlertModelArray:(NSArray *)alertModelArray
{
    _alertModelArray = alertModelArray;
    
    [self.tableView reloadData];
}

- (void)setTopMargin:(CGFloat)topMargin
{
    _topMargin = topMargin;
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(self.topMargin);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(selectedListCellHeight * self.alertModelArray.count);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hiddenAlert];
    self.callBackBlock(nil);
}

/**
 显示顶部弹窗
 
 @param alertModelArray                             alertModelArray
 @param topMargin                                   顶部间距
 @param eventCallBackBlock                          点击事件回调
 */
- (void)showAlertWithAlertModelArray:(NSArray<YBSelectedListAlertModel *> *)alertModelArray
                           topMargin:(CGFloat)topMargin
                  eventCallBackBlock:(ZJEventCallBackBlock)eventCallBackBlock
{
    self.callBackBlock      = eventCallBackBlock;
    self.alertModelArray    = alertModelArray;
    self.alpha              = 0;
    self.topMargin          = topMargin;
    [super showAlert];
    [self startAnimation];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        YBSelectedListAlertModel *alertModel    = self.alertModelArray[0];
        alertModel.selected                     = YES;
        self.currentAlerModel.selected          = NO;
        self.currentAlerModel                   = alertModel;
        [self.tableView reloadData];
    });
}

/**
 隐藏弹窗
 */
- (void)hiddenAlert
{
    [self endAnimation];
}

- (void)startAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1.f;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        if (finished) {
            [super hiddenAlert];
        }
    }];
}

- (ZJBaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[ZJBaseTableView alloc] init];
        _tableView.separatorStyle       = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight            = selectedListCellHeight;
        _tableView.backgroundColor      = ZJCOLOR.color_c0;
        _tableView.dataSource           = self;
        _tableView.delegate             = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.alertModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBSelectedListAlertCell *alerCell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!alerCell) {
        alerCell = [[YBSelectedListAlertCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    alerCell.alertModel = self.alertModelArray[indexPath.row];
    return alerCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBSelectedListAlertModel *alertModel    = self.alertModelArray[indexPath.row];
    if (alertModel == self.currentAlerModel) {
        return;
    }
    alertModel.selected                     = YES;
    self.currentAlerModel.selected          = NO;
    self.currentAlerModel                   = alertModel;
    [tableView reloadData];
    [self hiddenAlert];
    self.callBackBlock(self.alertModelArray[indexPath.row]);
}

@end
