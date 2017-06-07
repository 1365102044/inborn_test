//
//  YBMyComposedListCell.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMyComposedListCell.h"
#import "YBGoodModel.h"
#import "YBAttributedStringLabel.h"
#import "YBStringTool.h"
#import "YBButton.h"
#import "YBFuncButtonView.h"

/**
 *  YBMyComposedListCell
 */
NSString * const YBMyComposedListCellReuseIdentifier = @"YBMyComposedListCellReuseIdentifier";

@interface YBMyComposedListCell() <YBFuncButtonViewDelegate>

/**
 倒计时
 */
@property (nonatomic, strong) YBDefaultLabel *countDownLabel;

@end

@implementation YBMyComposedListCell

- (void)countDown:(NSNotification *)no
{
    YBLog(@"%@", [self.goodModel countDownString]);
    self.countDownLabel.text = [NSString stringWithFormat:@"付款剩余：%@",
                                [self.goodModel countDownString].doubleValue <= 0 ? @"0" : [self.goodModel countDownString]];
}

#pragma mark <YBFuncButtonViewDelegate>

- (void)funcButtonView:(YBFuncButtonView *)funcButtonView button:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(myComposedListCell:button:)]) {
        [self.delegate myComposedListCell:self button:button];
    }
}

- (void)setGoodModel:(YBGoodModel *)goodModel
{
    _goodModel = goodModel;
    
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, goodModel.imgUrl)]
                          placeholderImage:nil
                                   options:SDWebImageRetryFailed
                                 completed:^(UIImage * _Nullable image,
                                             NSError * _Nullable error,
                                             SDImageCacheType cacheType,
                                             NSURL * _Nullable imageURL) {
        
    }];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@：%@",
                            ZJSTRING(@"商品编号"),
                            goodModel.customId];
    [self.goodDescLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                @"content" : goodModel.sellerDesc,
                                                                @"size" : SYSTEM_REGULARFONT(14.f),
                                                                @"lineSpacing": @(ADJUST_PERCENT_FLOAT(11.f))}]];
    self.goodDescLabel.numberOfLines = 2;
    self.goodDescLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.timeLabel.text = [NSDate ex_stringWithDateString:goodModel.createTime formatterString:@"yyyy-MM-dd HH:mm" timeZoneStr:nil];
    
    self.countDownLabel.alpha = 0;
    if ([goodModel.goodsStatus isEqualToString:@"1"]) {

        /*
         * 不符合
         */
        self.statusLabel.text = ZJSTRING(@"不符合");
        [self setupFuncButtonView:@[@{@"title":@"修改"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"10"]) {

        /*
         * 待审核
         */
        self.statusLabel.text = ZJSTRING(@"待审核");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"20"]) {

        /*
         * 待确认
         */
        self.statusLabel.text = ZJSTRING(@"待确认");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"30"]) {

        /*
         * 待付费
         */
        self.countDownLabel.alpha = 1.f;
        self.statusLabel.text = ZJSTRING(@"待付费");
        [self setupFuncButtonView:@[@{@"title":@"立即支付"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"40"]) {

        /*
         * 待鉴定
         */
        self.statusLabel.text = ZJSTRING(@"待鉴定");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"50"]) {

        /*
         * 待上架
         */
        self.statusLabel.text = ZJSTRING(@"待上架");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"60"]) {

        /*
         * 出售中
         */
        self.statusLabel.text = ZJSTRING(@"出售中");
        [self setupFuncButtonView:@[@{@"title":@"查看商品"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"61"]) {
        
        /*
         * 出售中/延期下架
         */
        self.statusLabel.text = ZJSTRING(@"出售中");
        [self setupFuncButtonView:@[@{@"title":@"延期"},
                                    @{@"title":@"更多"}]];
        
    } else if ([goodModel.goodsStatus isEqualToString:@"62"]) {
        
        /*
         * 出售中/顶一下下架
         */
        self.statusLabel.text = ZJSTRING(@"出售中");
        [self setupFuncButtonView:@[@{@"title":@"顶一下"},
                                    @{@"title":@"更多"}]];
        
    } else if ([goodModel.goodsStatus isEqualToString:@"70"]) {

        /*
         * 已出售
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"联系客服"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"71"]) {

        /*
         * 线下销售
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"联系客服"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"80"]) {

        /*
         * 已下架
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"81"]) {
        
        /*
         * 已下架/已下架退担保金
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"申请退款"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"82"]) {
        
        /*
         * 已下架/已下架退货
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"重新上架"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"90"]) {

        /*
         * 待退回
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"91"]) {
        
        /*
         * 退回中
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"预览"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"92"]) {
        
        /*
         * 已退回
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"删除"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"93"]) {
        
        /*
         * 已取消
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"删除"},
                                    @{@"title":@"更多"}]];
    } else if ([goodModel.goodsStatus isEqualToString:@"94"]) {
        
        /*
         * 未支付已取消
         */
        self.statusLabel.text = ZJSTRING(@"已下架");
        [self setupFuncButtonView:@[@{@"title":@"删除"},
                                    @{@"title":@"更多"}]];
    } else{

        self.statusLabel.text = ZJSTRING(@"未知状态");
    }
    
    //[self setupFuncButtonView:@[@""]];
}

- (void)setupFuncButtonView:(NSArray *)titleArray
{
    NSMutableArray *tempArray = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                             NSUInteger idx,
                                             BOOL * _Nonnull stop) {
    
        YBButton *button = [[YBButton alloc] init];
        button.norTitle = obj[@"title"];
        NSString *imageNamed;
        if (idx == 0) {
            imageNamed = @"public_details_btn";
        }else if ([obj[@"title"] isEqualToString:@"更多"]) {
            
        }else{
            imageNamed = @"public_details_btn";
        }
        button.imageNamed = imageNamed;
        
        [tempArray addObject:button];
    }];
    
    [self.otherFuncButtonView setButtonWithButtonArray:tempArray.copy];
}

- (void)setFrame:(CGRect)frame
{
    CGFloat inset = ADJUST_PERCENT_FLOAT(10.f);
    frame.size.height -= inset;
    frame.origin.y += inset;
    
    [super setFrame:frame];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.otherFuncButtonView.delegate = self;
        self.amontLabel.hidden = YES;
        [self.contentView addSubview:self.countDownLabel];
        [self.countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.topMarginLineView);
            make.centerY.mas_equalTo(self.otherFuncButtonView);
        }];
        
        [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(countDown:) name:COMPOSE_LISTCOUNTDOWN_NOTIFICATION object:nil];
    }
    return self;
}

- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:COMPOSE_LISTCOUNTDOWN_NOTIFICATION object:nil];
}

- (YBDefaultLabel *)countDownLabel
{
    if (!_countDownLabel) {
        
        _countDownLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                                   text:ZJSTRING(@"付款剩余:")
                                              textColor:ZJCOLOR.color_c4];
        
    }
    return _countDownLabel;
}

@end
