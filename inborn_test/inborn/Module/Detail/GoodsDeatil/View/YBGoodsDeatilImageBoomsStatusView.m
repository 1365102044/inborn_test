//
//  YBGoodsDeatilImageBoomsStatusView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilImageBoomsStatusView.h"
#import "YBStringTool.h"
@interface YBGoodsDeatilImageBoomsStatusView ()


@property(nonatomic,strong) ZJBaseView * bigview;

@property(nonatomic,strong) UIImageView * brandImageView;
@property(nonatomic,strong) YBDefaultButton * descNotClickBtn;
@property(nonatomic,strong) YBDefaultButton * priceNotClickBtn;

@property(nonatomic,strong) YBDefaultButton * rightBtn;

@property(nonatomic,strong) YBDefaultButton * tempBtn;

@property(nonatomic,strong) UIView * cutTimeNumberView;
@property(nonatomic,strong) UIView * line1;
@property(nonatomic,strong) UIView * line2;
@property(nonatomic,strong) UIView * line3;
@end

@implementation YBGoodsDeatilImageBoomsStatusView

/**
 点击 right /tempbtn
 */
- (void)clickRightBtn:(YBDefaultButton *)sender
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.titleLabel.text);
    }
}

- (void)setGoodsDeatilModel:(YBGoodsDeatilModel *)goodsDeatilModel
{
    _goodsDeatilModel = goodsDeatilModel;
    
    [self.bigview removeAllSubviews];
    
    /**
     品牌
     */
    [self.bigview addSubview:self.brandImageView];
    [self.brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_bigview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(16));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(36), ADJUST_PERCENT_FLOAT(21)));
        make.centerY.mas_equalTo(_bigview.mas_centerY);
    }];
    
    [self.brandImageView sd_setImageWithURL:[NSURL URLWithString:goodsDeatilModel.BrandModel.whitePic] placeholderImage:ZJCURRENTIMAGE(@"", @"", ZJProjectLoadImageFillet)];
    
    if (goodsDeatilModel.boombarType == immediateGoBuyType) {
        
        [self.bigview addSubview:self.tempBtn];
        [self.bigview addSubview:self.rightBtn];
        [self.bigview addSubview:self.priceNotClickBtn];
        [self.bigview addSubview:self.line1];
        [self.bigview addSubview:self.line2];
        [self.bigview addSubview:self.line3];
        [self.rightBtn setTitle:ZJSTRING(@"马上抢") forState:UIControlStateNormal];
        [self.tempBtn setTitle:ZJSTRING(@"定金购") forState:UIControlStateNormal];
        NSString *prcestr = [NSString stringWithFormat:@"  ¥%@",[[YBStringTool share]strmethodCommaWith:goodsDeatilModel.mallPrice]];
        [self.priceNotClickBtn setTitle:ZJSTRING(prcestr) forState:UIControlStateNormal];
        
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset(ADJUST_PERCENT_FLOAT(86));
            make.height.mas_equalTo(_bigview.mas_height);
            make.right.mas_equalTo(_bigview.mas_right);
            make.top.mas_offset(ADJUST_PERCENT_FLOAT(0));
        }];
        
        [self.tempBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(_rightBtn);
            make.right.mas_equalTo(_rightBtn.mas_left);
            make.top.mas_offset(ADJUST_PERCENT_FLOAT(0));
        }];
      
        [self.priceNotClickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_bigview.mas_height);
            make.right.mas_equalTo(_tempBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0.5));
            make.left.mas_equalTo(_brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.top.mas_offset(ADJUST_PERCENT_FLOAT(0));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(8));
            make.size.mas_offset(CGSizeMake(0.5, ADJUST_PERCENT_FLOAT(18)));
            make.centerY.mas_equalTo(self.bigview.mas_centerY);
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.priceNotClickBtn.mas_right);
            make.size.mas_offset(CGSizeMake(0.5, ADJUST_PERCENT_FLOAT(18)));
            make.centerY.mas_equalTo(self.bigview.mas_centerY);
        }];
        [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tempBtn.mas_right);
            make.size.mas_offset(CGSizeMake(0.5, ADJUST_PERCENT_FLOAT(18)));
            make.centerY.mas_equalTo(self.bigview.mas_centerY);
        }];
    }else if (goodsDeatilModel.boombarType == immediateGoBuyNoEnsureMoneyType||
              goodsDeatilModel.boombarType == alearySellOutType||
              goodsDeatilModel.boombarType == startSellRemindType ||
              goodsDeatilModel.boombarType == addOnePriceType ||
              goodsDeatilModel.boombarType == paymentBuyingType ||
              goodsDeatilModel.boombarType == continuePaymentType ||
              goodsDeatilModel.boombarType == willStartSellType ||
              goodsDeatilModel.boombarType == immidatePaymentEnsureMoneyType ||
              goodsDeatilModel.boombarType == goodsUndershelf){
        
        [self.bigview addSubview:self.rightBtn];
        [self.bigview addSubview:self.priceNotClickBtn];
        [self.bigview addSubview:self.line1];
        [self.bigview addSubview:self.line2];
        NSString *desc ;
        NSString *rightstr;
        if (goodsDeatilModel.boombarType == alearySellOutType) {
            rightstr = @"已售罄";
            desc = [NSString stringWithFormat:@"  ¥%@",[[YBStringTool share]strmethodCommaWith:goodsDeatilModel.mallPrice]];
            
        }else if (goodsDeatilModel.boombarType == immediateGoBuyNoEnsureMoneyType){
            rightstr = @"马上抢";
            desc = [NSString stringWithFormat:@"  ¥%@",[[YBStringTool share]strmethodCommaWith:goodsDeatilModel.mallPrice]];
            
        }else if (goodsDeatilModel.boombarType == startSellRemindType){
            rightstr = @"开拍提醒";
            [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            desc = [NSString stringWithFormat:@"  起拍价：¥%@",[[YBStringTool share]strmethodCommaWith:goodsDeatilModel.mallPrice]];
        }else if (goodsDeatilModel.boombarType == addOnePriceType){
            rightstr = @"加一口";
            desc = [NSString stringWithFormat:@"  当前价：¥%@",[[YBStringTool share]strmethodCommaWith:goodsDeatilModel.mallPrice]];
        }else if (goodsDeatilModel.boombarType == paymentBuyingType){
            desc = nil;
            rightstr = @"付款中";
            [self.bigview addSubview:self.cutTimeNumberView];
            self.cutDownTimeview.timeInterval = _goodsDeatilModel.diffTime;
            
        }else if (goodsDeatilModel.boombarType == continuePaymentType){
            desc = nil;
            rightstr = @"继续付款";
            [self.bigview addSubview:self.cutTimeNumberView];
            self.cutDownTimeview.timeInterval = _goodsDeatilModel.diffTime;
            
        }else if (goodsDeatilModel.boombarType == willStartSellType){
            rightstr = @"找客服";
            desc = @" 预售商品，欲了解商品详情可与客服联系";
            self.priceNotClickBtn.titleLabel.font = SYSTEM_LIGHTFONT(11);
        }else if (goodsDeatilModel.boombarType == immidatePaymentEnsureMoneyType){
            desc = @"  预计03:20 23:30结束付尾款后15日内发货";
            rightstr = @"立即付定金";
            self.priceNotClickBtn.titleLabel.font = SYSTEM_LIGHTFONT(11);
        }else if (goodsDeatilModel.boombarType == goodsUndershelf){
            rightstr = @"已下架";
            desc = [NSString stringWithFormat:@"  ¥%@",[[YBStringTool share]strmethodCommaWith:goodsDeatilModel.mallPrice]];
        }
        
        [self.rightBtn setTitle:ZJSTRING(rightstr) forState:UIControlStateNormal];
        [self.priceNotClickBtn setTitle:ZJSTRING(desc) forState:UIControlStateNormal];
    
        CGFloat rightW = ADJUST_PERCENT_FLOAT(86);
        if (goodsDeatilModel.boombarType == startSellRemindType) {
            rightW = ADJUST_PERCENT_FLOAT(100);
        }
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset(rightW);
            make.height.mas_equalTo(_bigview.mas_height);
            make.right.mas_equalTo(_bigview.mas_right);
            make.top.mas_offset(0);
        }];
    
        [self.priceNotClickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_bigview.mas_height);
            make.right.mas_equalTo(_rightBtn.mas_left);
            make.left.mas_equalTo(_brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.top.mas_offset(0);
        }];
        
        if (goodsDeatilModel.boombarType == continuePaymentType ||
            goodsDeatilModel.boombarType == paymentBuyingType) {
            [self.cutTimeNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(_bigview.mas_height);
                make.right.mas_equalTo(_rightBtn.mas_left);
                make.left.mas_equalTo(_brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
                make.top.mas_equalTo(_bigview).mas_offset(0);
            }];
        }
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(8));
            make.size.mas_offset(CGSizeMake(0.5, ADJUST_PERCENT_FLOAT(18)));
            make.centerY.mas_equalTo(self.bigview.mas_centerY);
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.priceNotClickBtn.mas_right);
            make.size.mas_offset(CGSizeMake(0.5, ADJUST_PERCENT_FLOAT(18)));
            make.centerY.mas_equalTo(self.bigview.mas_centerY);
        }];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *backImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"details_allbtn_bg"]];
        [self addSubview:backImageview];
        [backImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        
        [self addSubview:self.bigview];
        [self.bigview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
    }
    return self;
}

/**
 倒计时view
 */
- (UIView *)cutTimeNumberView {
    if (!_cutTimeNumberView) {
        _cutTimeNumberView = [[UIView alloc]init];
        
        [_cutTimeNumberView addSubview:self.cutDownTimeview];
        [self.cutDownTimeview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset(ADJUST_PERCENT_FLOAT(134));
            make.right.mas_equalTo(_cutTimeNumberView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-8));
            make.top.mas_equalTo(_cutTimeNumberView).mas_offset(0);
            make.height.mas_equalTo(_cutTimeNumberView.mas_height);
        }];
        
        YBDefaultLabel *titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                                              text:ZJSTRING(@"  支付倒计时")
                                                         textColor:ZJCOLOR.color_c0];
        titlelable.backgroundColor = [UIColor clearColor];
        [_cutTimeNumberView addSubview:titlelable];
        [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_cutTimeNumberView.mas_left);
            make.right.mas_equalTo(_cutDownTimeview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
            make.top.mas_equalTo(_cutTimeNumberView).mas_offset(0);
            make.height.mas_equalTo(_cutTimeNumberView.mas_height);
        }];
        
        _cutTimeNumberView.backgroundColor = [UIColor clearColor];
    }
    return _cutTimeNumberView;
}


#pragma mark+++++++ 懒加载 +++++

- (ZJBaseView *)bigview {
    if (!_bigview) {
        _bigview = [[ZJBaseView alloc]init];
//        _bigview.layer.masksToBounds = YES;
//        _bigview.layer.cornerRadius = ADJUST_PERCENT_FLOAT(14);
//        _bigview.layer.borderColor = ZJCOLOR.color_c0.CGColor;
//        _bigview.layer.borderWidth = 0.5;
        _bigview.backgroundColor = [UIColor clearColor];
        
     
    }
    return _bigview;
}

- (YBDefaultButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [[YBDefaultButton alloc]init];
        _rightBtn.titleLabel.font = SYSTEM_LIGHTFONT(14);
        [_rightBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.backgroundColor = [UIColor clearColor];
    }
    return _rightBtn;
}

- (YBDefaultButton *)tempBtn {
    if (!_tempBtn) {
        _tempBtn = [[YBDefaultButton alloc]init];
        _tempBtn.titleLabel.font = SYSTEM_LIGHTFONT(14);
        [_tempBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
        [_tempBtn addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
//        _tempBtn.layer.borderColor = ZJCOLOR.color_c0.CGColor;
//        _tempBtn.layer.borderWidth = 0.5;
//        [_tempBtn setTitleShadowColor:[UIColor redColor] forState:UIControlStateHighlighted];
        _tempBtn.backgroundColor = [UIColor clearColor];
    }
    return _tempBtn;
}

/**
 描述 (不能点击)
 */
- (YBDefaultButton *)descNotClickBtn {
    if (!_descNotClickBtn) {
        _descNotClickBtn = [[YBDefaultButton alloc]init];
        _descNotClickBtn.titleLabel.font = SYSTEM_LIGHTFONT(11);
        [_descNotClickBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
    }
    return _descNotClickBtn;
}

/**
  价格
 */
- (YBDefaultButton *)priceNotClickBtn {
    if (!_priceNotClickBtn) {
        _priceNotClickBtn = [[YBDefaultButton alloc]init];
        _priceNotClickBtn.titleLabel.font = SYSTEM_LIGHTFONT(14);
        [_priceNotClickBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
        _priceNotClickBtn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentLeft;
//        _priceNotClickBtn.layer.borderColor = ZJCOLOR.color_c0.CGColor;
//        _priceNotClickBtn.layer.borderWidth = 0.5;
        _priceNotClickBtn.backgroundColor = [UIColor clearColor];
    }
    return _priceNotClickBtn;
}

/**
 品牌图标
 */
- (UIImageView *)brandImageView {
    if (!_brandImageView) {
        _brandImageView = [[UIImageView alloc]init];
        _brandImageView.backgroundColor = [UIColor clearColor];
    }
    return _brandImageView;
}

- (YBGoddsDeatilCutTimeView *)cutDownTimeview
{
    if (!_cutDownTimeview) {
        _cutDownTimeview = [[YBGoddsDeatilCutTimeView alloc]init];
        _cutDownTimeview.backgroundColor = [UIColor clearColor];
    }
    return _cutDownTimeview;
}

- (UIView *)line1 {
    if (!_line1) {
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = ZJCOLOR.color_c22;
    }
    return _line1;
}
- (UIView *)line2 {
    if (!_line2) {
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = ZJCOLOR.color_c22;
    }
    return _line2;
}
- (UIView *)line3 {
    if (!_line3) {
        _line3 = [[UIView alloc]init];
        _line3.backgroundColor = ZJCOLOR.color_c22;
    }
    return _line3;
}
@end
