//
//  YBGoodsDeatilImageBoomStatusView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilImageBoomStatusView.h"
#import "NSString+Extension.h"
#import "UILabel+Extension.h"
#import "YBStringTool.h"

static CGFloat HEI = 44;
@interface YBGoodsDeatilImageBoomStatusView ()
@property(nonatomic,strong) UIImageView * brandImageView;
@property(nonatomic,strong) YBDefaultLabel * middleLable;
@property(nonatomic,strong) YBDefaultButton * rightBtn;
@property(nonatomic,strong) YBDefaultButton * greyBtn;
@property(nonatomic,strong) UIView * cuttimeview;
@end

@implementation YBGoodsDeatilImageBoomStatusView

/**
 btn.tag
 200        开拍提醒
 201        加一口
 202        立即付定金
 203        找客服
 204        已售罄
 205        定金购
 206        马上抢
 207        付款中
 208        继续付款
 209         找相似
 */
- (void)clickBtn:(UIButton *)sender
{
//    YBLog(@"++++btn.tag:%ld",sender.tag);
    if (self.clickBlock) {
        self.clickBlock(sender.tag);
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)setGoodsDeatilModel:(YBGoodsDeatilModel *)goodsDeatilModel
{
    _goodsDeatilModel = goodsDeatilModel;
    
    [self setGoodsDeatilImageBoomStatusViewWithType:goodsDeatilModel.boombarType dataModel:goodsDeatilModel];
    
}

- (void)setGoodsDeatilImageBoomStatusViewWithType:(BoomBarType)Type dataModel:(YBGoodsDeatilModel *)dataModel
{
    [self addSubview:self.brandImageView];
    [self.brandImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.BrandModel.brandPic] placeholderImage:ZJCURRENTIMAGE(@"", @"", ZJProjectLoadImageFillet)];
    [self.brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(44), ADJUST_PERCENT_FLOAT(44)));
        make.top.mas_equalTo(self);
    }];
    [self addSubview:self.middleLable];
    NSString *middleStr;
    NSString *rightBtnStr;
    CGFloat rightBtnW ;
    NSString *greBtnStr;
    NSInteger btntag;
    
    if (Type == startSellRemindType ||
        Type == addOnePriceType||
        Type == willStartSellType)
    {
        
        [self.cuttimeview removeFromSuperview];
        
        [self addSubview:self.rightBtn];
        if (Type == startSellRemindType) {
            middleStr   = @"起拍价：8888888";
            rightBtnStr = @"开拍提醒";
            rightBtnW   = 105;
            btntag      = 200;
            self.middleLable.text = middleStr;
        } else if (Type == addOnePriceType) {
            middleStr   = @"当前价：8888888";
            rightBtnStr = @"加一口";
            rightBtnW   = 87;
            btntag      = 201;
            self.middleLable.text = middleStr;
        }else if (Type == immidatePaymentEnsureMoneyType) {
            middleStr   = @"  预计03:20 结束\n  付尾款后15台天内发货";
            rightBtnStr = @"立即付定金";
            rightBtnW   = 130;
            btntag      = 202;
            self.middleLable.font = SYSTEM_LIGHTFONT(12);
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:middleStr];
            //调整行距
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = 5;
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [middleStr length])];
            self.middleLable.attributedText = attributedString;

        }else if (Type == willStartSellType) {
            middleStr   = @"  预售商品，欲了解商品详情\n  可与客服联系";
            rightBtnStr = @"找客服";
            rightBtnW   = 87;
            btntag      = 203;
            self.middleLable.font = SYSTEM_LIGHTFONT(12);
            
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:middleStr];
            //调整行距
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = 5;
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [middleStr length])];
            self.middleLable.attributedText = attributedString;
        }
        [self.rightBtn setTitle:rightBtnStr forState:UIControlStateNormal];
        self.rightBtn.tag = btntag;
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(rightBtnW), ADJUST_PERCENT_FLOAT(44)));
            make.top.mas_equalTo(self);
        }];
        [self.middleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.rightBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.top.mas_equalTo(self);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
        }];
        
    }else if (Type == alearySellOutType||
              Type == immediateGoBuyType||
              Type == immediateGoBuyNoEnsureMoneyType||
              Type == goodsUndershelf)
    {
        [self.cuttimeview removeFromSuperview];
        if (Type == alearySellOutType||
            Type == goodsUndershelf) {
            middleStr   = [NSString stringWithFormat:@"  ¥%@",[[YBStringTool share]strmethodCommaWith:dataModel.mallPrice]];
            if (Type == alearySellOutType) {
                greBtnStr = @"已售罄";
            }else if (Type == goodsUndershelf){
                greBtnStr = @"已下架";
            }
            rightBtnStr = @"找相似";
            rightBtnW   = 87;
//            self.rightBtn.tag = 209;
            self.greyBtn.tag = 204;
            [self addSubview:self.greyBtn];
//            [self addSubview:self.rightBtn];
            self.middleLable.text = middleStr;
            [self.greyBtn setTitle:greBtnStr forState:UIControlStateNormal];
//            [self.rightBtn setTitle:rightBtnStr forState:UIControlStateNormal];
            self.rightBtn.hidden = YES;
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:middleStr];
            [attributedString addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(12) range:NSMakeRange(0, 3)];
            [attributedString addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(18) range:NSMakeRange(3,middleStr.length-3 )];
            self.middleLable.attributedText = attributedString;
//            [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
//                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(rightBtnW), ADJUST_PERCENT_FLOAT(44)));
//                make.top.mas_equalTo(self);
//            }];
            [self.greyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(rightBtnW), ADJUST_PERCENT_FLOAT(44)));
                make.top.mas_equalTo(self);
            }];
            [self.middleLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.greyBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.top.mas_equalTo(self);
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
            }];
            
        }else if (Type == immediateGoBuyType||
                  Type == immediateGoBuyNoEnsureMoneyType) {
            middleStr   = [NSString stringWithFormat:@"  ¥%@",[[YBStringTool share]strmethodCommaWith:dataModel.mallPrice]];
            greBtnStr   = @"定金购";
            rightBtnStr = @"马上抢";
            rightBtnW   = 87;
            [self addSubview:self.greyBtn];
            [self addSubview:self.rightBtn];
            self.greyBtn.tag = 205;
            self.rightBtn.tag = 206;
            [self.greyBtn setTitle:greBtnStr forState:UIControlStateNormal];
            [self.rightBtn setTitle:rightBtnStr forState:UIControlStateNormal];
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:middleStr];
            [attributedString addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(12) range:NSMakeRange(0, 3)];
            [attributedString addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(18) range:NSMakeRange(3,middleStr.length-3 )];
            self.middleLable.attributedText = attributedString;

            [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(rightBtnW), ADJUST_PERCENT_FLOAT(44)));
                make.top.mas_equalTo(self);
            }];
            CGFloat greW = rightBtnW;
            if (Type == immediateGoBuyNoEnsureMoneyType) greW = 0;
            [self.greyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.rightBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(greW), ADJUST_PERCENT_FLOAT(44)));
                make.top.mas_equalTo(self);
            }];
            [self.middleLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.greyBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.top.mas_equalTo(self);
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
            }];
        }
        
    } else if (Type == paymentBuyingType||
               Type == continuePaymentType) {
        [self.greyBtn removeFromSuperview];
        if (Type == paymentBuyingType) {
            while (self.middleLable.subviews.lastObject != nil) {
                [self.middleLable.subviews.lastObject removeFromSuperview];
            }
            self.greyBtn.tag = 207;
            [self addSubview:self.greyBtn];
            [self.greyBtn setTitle:@"付款中" forState:UIControlStateNormal];
            
            UIView *cuntview = [self cuntimeview:@" 支付倒计时"];
            [self addSubview:cuntview];
            self.cutDownTimeview.timeInterval = _goodsDeatilModel.diffTime;
        
            
            [self.greyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(87), ADJUST_PERCENT_FLOAT(44)));
                make.top.mas_equalTo(self);
            }];
            
            [self.middleLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.greyBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.top.mas_equalTo(self);
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
            }];

            [cuntview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.greyBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.top.mas_equalTo(self);
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
            }];
            
        }else if (Type == continuePaymentType) {
            
            self.middleLable.text = nil;
            self.rightBtn.tag = 208;
            [self addSubview:self.middleLable];
            [self addSubview:self.rightBtn];
            [self.rightBtn setTitle:@"继续付款" forState:UIControlStateNormal];
            
            UIView *cuntview = [self cuntimeview:@" 支付倒计时"];
            [self addSubview:cuntview];
            self.cutDownTimeview.timeInterval = _goodsDeatilModel.diffTime;
        
            
            [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(87), ADJUST_PERCENT_FLOAT(44)));
                make.top.mas_equalTo(self);
            }];
            
            [self.middleLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.rightBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.top.mas_equalTo(self);
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
            }];
            
            [cuntview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.rightBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.left.mas_equalTo(self.brandImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
                make.top.mas_equalTo(self);
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));

            }];
        }
    }
}

/**
 倒计时view
 */
- (UIView *)cuntimeview:(NSString *)titletect
{
    UIView *view = [[UIView alloc]init];
    [view addSubview:self.cutDownTimeview];
    [self.cutDownTimeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(134));
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-10));
        make.centerY.mas_equalTo(view);
        make.height.mas_equalTo(view);
    }];
    
    YBDefaultLabel *titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12) text:titletect textColor:ZJCOLOR.color_c0];
    titlelable.backgroundColor = [UIColor clearColor];
    [view addSubview:titlelable];
    [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view);
        make.right.mas_equalTo(self.cutDownTimeview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-10));
        make.centerY.mas_equalTo(view);
        make.height.mas_equalTo(view);
    }];
    self.cuttimeview = view;
    return view;
}

- (YBGoddsDeatilCutTimeView *)cutDownTimeview {
    if (!_cutDownTimeview) {
        _cutDownTimeview = [[YBGoddsDeatilCutTimeView alloc]init];
        _cutDownTimeview.backgroundColor = [UIColor clearColor];
    }
    return _cutDownTimeview;
}



- (YBDefaultButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                titleColor:ZJCOLOR.color_c4
                                                                 titleFont:SYSTEM_LIGHTFONT(18)
                                                             imageFilePath:@""
                                                                imageNamed:@""
                                                                      type:ZJProjectButtonSetImage
                                                                    target:self
                                                                  selector:@selector(clickBtn:)];
        _rightBtn.backgroundColor = ZJCOLOR.color_c0;
    }
    return _rightBtn;
}

- (YBDefaultLabel *)middleLable {
    if (!_middleLable) {
        _middleLable = [[YBDefaultLabel alloc]init];
        _middleLable.font = SYSTEM_LIGHTFONT(18);
        _middleLable.textColor =ZJCOLOR.color_c0;
        _middleLable.backgroundColor = [UIColor blackColor];
        _middleLable.alpha = 0.6;
        _middleLable.numberOfLines = 2;
    }
    return _middleLable;
}

- (UIImageView *)brandImageView {
    if (!_brandImageView) {
        _brandImageView = [[UIImageView alloc]init];
        _brandImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_DETAIL, @"details_logo_icon", ZJProjectLoadImageDefault);
        _brandImageView.backgroundColor = ZJCOLOR.color_c0;
    }
    return _brandImageView;
}

- (YBDefaultButton *)greyBtn {
    if (!_greyBtn) {
        _greyBtn = [YBDefaultButton buttonWithTitleStringKey:@""
                                                  titleColor:ZJCOLOR.color_c0
                                                   titleFont:SYSTEM_LIGHTFONT(18)
                                                      target:self
                                                    selector:@selector(clickBtn:)];
        _greyBtn.backgroundColor = ZJCOLOR.color_c6;
        
    }
    return _greyBtn ;
}

@end
