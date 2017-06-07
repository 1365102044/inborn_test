//
//  YBBlankpageView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/13.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBBlankpageView.h"

@interface YBBlankpageView()

@property (nonatomic, strong) UIImageView *logImageView;
@property (nonatomic, strong) UILabel *tipsLabel;
@property(nonatomic,strong) UIView * headerView;
@end

@implementation YBBlankpageView

- (void)setLogImageNamed:(NSString *)logImageNamed
{
    _logImageNamed = logImageNamed;
    self.logImageView.image = [UIImage imageNamed:logImageNamed];
    
}

- (void)setTipsText:(NSString *)tipsText
{
    _tipsText = tipsText;
    self.tipsLabel.text = tipsText;
    if ([tipsText isEqualToString:@"你还没有任何历史搜索记录"]) {
        [self.logImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self).mas_offset(-ADJUST_PERCENT_FLOAT(120));
        }];
        [self.tipsLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self.logImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(20));
        }];
    }else if ([tipsText isEqualToString:@"抱歉，未找到该商品！"]){
        self.bounces = NO;
//        self.tableHeaderView = self.headerView;
//        self.tableHeaderView.height = 1;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        UIImageView *logImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_tempDataAddressLog"]];
        logImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_BLANK,
                                                  @"blank_blank_bg",
                                                  ZJProjectLoadImageDefault);
        [self addSubview:logImageView];
        _logImageView = logImageView;
        
        UILabel *tipsLabel = [[UILabel alloc] init];
        tipsLabel.text = @"暂无数据";
        tipsLabel.font = SYSTEM_MEDIUMFONT(14);
        tipsLabel.textColor = ZJCOLOR.color_c4;
        [tipsLabel sizeToFit];
        [self addSubview:tipsLabel];
        _tipsLabel = tipsLabel;
        
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}

- (void)setMJheaderSelector:(SEL)headerRefresh mjfooterSelector:(SEL)footerLoadMore
{
    self.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:headerRefresh];
    self.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:footerLoadMore];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.logImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).mas_offset(-ADJUST_PERCENT_FLOAT(110));
    }];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.logImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(20));
    }];
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = ZJCOLOR.color_c16;
    }
    return _headerView;
}
@end
