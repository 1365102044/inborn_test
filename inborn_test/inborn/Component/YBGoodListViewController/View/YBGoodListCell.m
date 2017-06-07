//
//  YBGoodListCell.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListCell.h"
#import "YBAttributedStringLabel.h"
#import "YBGoodListGoodModel.h"

@interface YBGoodListCell()

/**
 <#descrption#>
 */
@property (nonatomic, strong) ZJBaseView *bgView;

/**
 图片
 */
@property (nonatomic, strong) ZJBaseImageView *goodImageView;

/**
 商品名称
 */
@property (nonatomic, strong) ZJBaseLabel *titleLabel;

/**
 描述Label
 */
@property (nonatomic, strong) YBAttributedStringLabel *detailAttributedStringLabel;

/**
 文字区父视图
 */
@property (nonatomic, strong) ZJBaseView *textSuperView;

/**
 loveButton
 */
@property (nonatomic, strong) YBDefaultButton *loveButton;

/**
 <#descrption#>
 */
@property (nonatomic, strong) ZJBaseImageView *soldIconImageView;

@end

@implementation YBGoodListCell

- (void)refreshCollectionStatus:(NSNotification *)no
{
    self.loveButton.selected = self.goodModel.goodListCollectionModel.status;
}

- (void)loveButtonClick:(UIButton *)sender
{
    /**
     *  喜欢按钮点击事件
     */
    if ([self.delegate respondsToSelector:@selector(goodListCell:button:)]) {
        
        [self.delegate goodListCell:self button:sender];
    }
}

- (void)setGoodModel:(YBGoodListGoodModel *)goodModel
{
    _goodModel = goodModel;
    
    /**
     *  界面赋值
     */
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringWaterfallFlow,
                                                                                 goodModel.rectangleImage)]
                          placeholderImage:nil
                                   options:SDWebImageRetryFailed];
    
    self.titleLabel.text = goodModel.brandName;
    
    [self.detailAttributedStringLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                              @"content" : goodModel.goodsName,
                                                                              @"size" : SYSTEM_LIGHTFONT(12.f),
                                                                              @"lineSpacing": @(ADJUST_PERCENT_FLOAT(6))}]];
    self.detailAttributedStringLabel.numberOfLines = 2;
    self.detailAttributedStringLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    /**
     *  设置布局
     */
    [self.textSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.bgView);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(self.goodModel.textAreHeight));
    }];
    
    if (goodModel.goodListCollectionModel) {
        self.loveButton.selected = goodModel.goodListCollectionModel.status;
    }else{
        self.loveButton.selected = NO;
    }
    
    if ([goodModel.goodsStatus isEqualToString:@"70"]
        || [goodModel.goodsStatus isEqualToString:@"71"]) {
        
        self.soldIconImageView.alpha = 1.f;
    }else{
        
        self.soldIconImageView.alpha = 0.f;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupCustomUI];
        
        [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                      selector:@selector(refreshCollectionStatus:)
                                          name:PUBLIC_GOODLISTCOLLECTION_NOTIFICATION
                                        object:nil];
    }
    return self;
}

- (void)setupCustomUI
{
    self.bgView.layer.cornerRadius = 3;
    self.bgView.layer.masksToBounds = YES;
    self.layer.shadowColor          = [UIColor blackColor].CGColor;
    self.layer.masksToBounds        = NO;
    self.layer.contentsScale        = [UIScreen mainScreen].scale;
    self.layer.shadowOpacity        = 0.06f;
    self.layer.shadowRadius         = 3.0f;
    self.layer.shadowOffset         = CGSizeMake(0,0);
    self.layer.shouldRasterize      = YES;
    self.layer.rasterizationScale   = [UIScreen mainScreen].scale;
    
    
    ZJBaseView *bottomView                  = [[ZJBaseView alloc] init];
    _textSuperView                          = bottomView;
    
    [bottomView addSubview:self.titleLabel];
    [bottomView addSubview:self.detailAttributedStringLabel];
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.soldIconImageView];
    [self.bgView addSubview:self.goodImageView];
    [self.bgView addSubview:bottomView];
    
    //[self.contentView addSubview:self.loveButton];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.bgView);
        make.bottom.mas_equalTo(bottomView.mas_top);
    }];
    
    [self.soldIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.goodImageView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bottomView).mas_offset(ADJUST_PERCENT_FLOAT(8.f));
        make.right.mas_equalTo(bottomView).mas_offset(ADJUST_PERCENT_FLOAT(-8.f));
        make.top.mas_equalTo(bottomView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
    }];
    
    [self.detailAttributedStringLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.left.right.mas_equalTo(self.titleLabel);
    }];
    
    //    [self.loveButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.right.mas_equalTo(self.goodImageView).mas_offset(ADJUST_PERCENT_FLOAT(-10.f));
    //        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(24.f));
    //    }];
}

- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:PUBLIC_GOODLISTCOLLECTION_NOTIFICATION object:nil];
}

- (ZJBaseImageView *)soldIconImageView
{
    if (!_soldIconImageView) {
        
        _soldIconImageView = [[ZJBaseImageView alloc] init];
        _soldIconImageView.backgroundColor = [UIColor clearColor];
        _soldIconImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_HOMEPAGE, @"home_sold_icon", ZJProjectLoadImageDefault);
        _soldIconImageView.alpha = 0;
        
    }
    return _soldIconImageView;
}

- (ZJBaseView *)bgView
{
    if (!_bgView) {
        
        _bgView = [[ZJBaseView alloc] init];
        
    }
    return _bgView;
}

- (YBDefaultButton *)loveButton
{
    if (!_loveButton) {
        
        _loveButton = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_HOMEPAGE
                                                         imageNamed:@"home_like"
                                                               type:ZJProjectButtonSetImage
                                                             target:self
                                                           selector:@selector(loveButtonClick:)];
        
    }
    return _loveButton;
}

- (YBAttributedStringLabel *)detailAttributedStringLabel
{
    if (!_detailAttributedStringLabel) {
        _detailAttributedStringLabel        = [[YBAttributedStringLabel alloc] init];
    }
    return _detailAttributedStringLabel;
}

- (ZJBaseLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel                         = [[ZJBaseLabel alloc] init];
        _titleLabel.font                    = SYSTEM_MEDIUMFONT(14.f);
        _titleLabel.textColor               = ZJCOLOR.color_c4;
    }
    return _titleLabel;
}

- (ZJBaseImageView *)goodImageView
{
    if (!_goodImageView) {
        _goodImageView                      = [[ZJBaseImageView alloc] init];
        _goodImageView.backgroundColor      = ZJCOLOR.color_c0;
    }
    return _goodImageView;
}


@end
