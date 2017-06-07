//
//  YBGoodsDeatilBoomBarView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilBoomBarView.h"
#import "YBStringTool.h"
@interface YBGoodsDeatilBoomBarView ()

@property(nonatomic,strong) ZJBaseView * lineview;
@property(nonatomic,strong) ZJBaseView *kefuAndLikeBackView;
@property(nonatomic,strong) ZJBaseView *middleBackView;
@property(nonatomic,strong) ZJBaseView *rightBackView;
@property(nonatomic,strong) YBDefaultButton *rightBtn;
@property(nonatomic,strong) YBGoodsDeatilModel * dataModel;
@property(nonatomic,strong) UIImageView * likeImageView;
@property(nonatomic,copy) clickBoomViewBtnBlock  clickBoomViewBtnBlock;
@property(nonatomic,strong) UIView * cuttimeview;

@end

@implementation YBGoodsDeatilBoomBarView

- (void)setLikeImageViewWithIscollect:(BOOL)iscollect
{
    if (iscollect) {
//        self.likeImageView.image = ZJIMAGE(IMAGEFILEPATH_DETAIL, @"", ZJProjectLoadImageDefault).firstObject;
        self.likeImageView.image  = [UIImage imageNamed:@"details_like2_h"];
        self.dataModel.isCollect = 1;
    }else{
        self.likeImageView.image = ZJIMAGE(IMAGEFILEPATH_DETAIL, @"details_like2", ZJProjectLoadImageDefault).firstObject;
        self.dataModel.isCollect = 0;
    }
}
/**
 根据类型进行控制UI
 */
- (void)setGoodsDeatilBoomBarSubviewWithType:(BoomBarType)barType dataModel:(YBGoodsDeatilModel *)dataModel clickboomviewBtnBlock:(clickBoomViewBtnBlock)clickBoomViewBtnBlock
{
    _dataModel = dataModel;
    self.clickBoomViewBtnBlock = clickBoomViewBtnBlock;
    
    if (barType == alearySellOutType ||
        barType == goodsUndershelf ||
        barType == addOnePriceType ||
        barType == startSellRemindType||
        barType == immediateGoBuyNoEnsureMoneyType) {
        [self.cuttimeview removeFromSuperview];
        [self setOnlyTwoView:barType];
    }else if (barType == immediateGoBuyType ||
              barType == willStartSellType
              ) {
        [self.cuttimeview removeFromSuperview];
        [self setThreeViewNotHaveCutTimer:barType];
    }else if (barType == paymentBuyingType||
              barType == continuePaymentType) {
        [self setThreeViewHaveCutTimerWithtype:barType];
    }
    [self setLikeImageViewWithIscollect:(dataModel.isCollect== 1 ? YES :NO)];
}

/**
 只有2个view的布局
 */
- (void)setOnlyTwoView:(BoomBarType)type
{
    [self setKefuAndLikeViewSubview];
    NSString *titlestr;
    NSString *imageName = nil;
    NSInteger btntag = 0;
    if (type == alearySellOutType) {
        titlestr = @"已售罄";
        btntag = 102;
    }
    if (type == goodsUndershelf) {
        titlestr  = @"已下架";
    }
    if (type == addOnePriceType) {
        titlestr = @"加一口";
        btntag = 103;
    }
    if (type == startSellRemindType)
    {
        btntag = 104;
        titlestr = @"开拍提醒";
        imageName = @"details_clock_icon";
    }
    if (type == immediateGoBuyNoEnsureMoneyType) {
        titlestr = @"马上抢";
        btntag = 107;
    }
    UIView *view =  [self setOnerightViewbtntitle:titlestr
                                     btnimageName:imageName
                                           btnTag:btntag];
    view.backgroundColor  = ZJCOLOR.color_c6;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.kefuAndLikeBackView.mas_right);
        make.bottom.right.equalTo(self);
        make.top.equalTo(self).offset(0);
    }];
}

/**
 马上抢， 预售，立即付定金
 */
- (void)setThreeViewNotHaveCutTimer:(BoomBarType)bartype
{
    [self setKefuAndLikeViewSubview];
    [self addSubview:self.rightBtn];
    [self addSubview:self.middleBackView];
    self.middleBackView.backgroundColor = ZJCOLOR.color_c6;
    NSString *titlestr;
    CGFloat btnW;
    NSString *middleLftStr;
    NSString *middleRightStr;
    NSInteger btntag;
    if (bartype == immediateGoBuyType) {
        titlestr = @"马上抢";
        btnW = ADJUST_PERCENT_FLOAT(87);
        middleRightStr = @"定金购";
        middleLftStr = [NSString stringWithFormat:@"  先付定金：\n  ¥%@",[[YBStringTool share] strmethodCommaWith:_dataModel.bargainMoney]];
        btntag = 105;
    }else if (bartype == willStartSellType) {
        titlestr = @"找客服";
        btnW = ADJUST_PERCENT_FLOAT(76);
        middleLftStr = @"  预售商品，欲了解商品详情\n  可联系客服";
        btntag = 106;
        [_kefuAndLikeBackView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_equalTo(self.height);
            make.top.mas_equalTo(self).mas_offset(1);
            make.left.mas_equalTo(self).mas_offset(0);
        }];
        
    }
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.top.equalTo(self).offset(1);
        make.width.mas_offset(btnW);
    }];
    
    [_middleBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_kefuAndLikeBackView.mas_right).mas_offset(0);
        make.right.mas_equalTo(self.rightBtn.mas_left);
        make.bottom.mas_equalTo(self);
        make.top.equalTo(self).offset(0);
    }];
    self.rightBtn.tag = btntag;
    [self.rightBtn setTitle:titlestr forState:UIControlStateNormal];
    [self setmiddleViewThreeNothaveCuttimerwith:bartype text:middleLftStr samllrighttext:middleRightStr];
  
}

/**
 3个view 有倒计时的布局
 */
- (void)setThreeViewHaveCutTimerWithtype:(BoomBarType)bartype
{
    [self setKefuAndLikeViewSubview];
    [self addSubview:self.rightBtn];
    [self addSubview:self.middleBackView];
    [_kefuAndLikeBackView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(84));
        make.height.mas_equalTo(self.height);
        make.top.mas_equalTo(self).mas_offset(1);
        make.left.mas_equalTo(self).mas_offset(0);
    }];
    self.middleBackView.backgroundColor = [UIColor ex_colorWithHexString:@"515151" alpha:0.9];
    UIColor *rightbtnbackcolor ;
    UIColor *textcolor;
    NSString *btntitle;
    NSInteger btntag;
    if (bartype == paymentBuyingType) {
        rightbtnbackcolor = ZJCOLOR.color_c6;
        textcolor = ZJCOLOR.color_c0;
        btntitle = @"付款中";
        btntag = 108;
    } else if (bartype == continuePaymentType) {
        rightbtnbackcolor = ZJCOLOR.color_c0;
        textcolor = ZJCOLOR.color_c4;
        btntitle = @"继续付款";
        btntag = 109;
    }
    [self.middleBackView removeAllSubviews];
    
    UIView *cutdownview = [self cuntimeview:@" 支付倒计时"];
    [self addSubview:cutdownview];
    self.cutDownTimeview.timeInterval = _dataModel.diffTime;
    
    self.rightBtn.tag =  btntag;
    self.rightBtn.backgroundColor = rightbtnbackcolor;
    [self.rightBtn setTitleColor:textcolor forState:UIControlStateNormal];
    [self.rightBtn setTitle:btntitle forState:UIControlStateNormal];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.top.equalTo(self).offset(1);
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(76));
    }];
    [self.middleBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.kefuAndLikeBackView.mas_right);
        make.right.mas_equalTo(self.rightBtn.mas_left);
        make.bottom.mas_equalTo(self);
        make.top.equalTo(self).offset(0);
    }];
    [cutdownview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.kefuAndLikeBackView.mas_right);
        make.right.mas_equalTo(self.rightBtn.mas_left);
        make.bottom.mas_equalTo(self);
        make.top.equalTo(self).offset(0);
    }];
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
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-8));
        make.centerY.mas_equalTo(view);
        make.height.mas_equalTo(view);
    }];
    
    YBDefaultLabel *titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12) text:titletect textColor:ZJCOLOR.color_c0];
    titlelable.backgroundColor = [UIColor clearColor];
    [view addSubview:titlelable];
    [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view);
        make.right.mas_equalTo(self.cutDownTimeview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.centerY.mas_equalTo(view);
        make.height.mas_equalTo(view);
    }];
    self.cuttimeview = view ;
    return view;
}

- (YBGoddsDeatilCutTimeView *)cutDownTimeview {
    if (!_cutDownTimeview) {
        _cutDownTimeview = [[YBGoddsDeatilCutTimeView alloc]init];
        _cutDownTimeview.backgroundColor = [UIColor clearColor];
    }
    return _cutDownTimeview;
}

/**
 三个view 没有倒计时，中间view的布局
 */
- (void)setmiddleViewThreeNothaveCuttimerwith:(BoomBarType)bartype
                                         text:(NSString *)text
                               samllrighttext:(NSString *)samllrighttext
{
    YBDefaultLabel *biglable = [YBDefaultLabel labelWithFont:SYSTEM_LIGHTFONT(12)
                                                        text:text
                                                   textColor:ZJCOLOR.color_c0];
    biglable.backgroundColor = [UIColor clearColor];
    biglable.numberOfLines = 2;
    [self.middleBackView addSubview:biglable];
    
    YBDefaultLabel *smallrighlable = [YBDefaultLabel labelWithFont:SYSTEM_LIGHTFONT(18)
                                                              text:samllrighttext
                                                         textColor:ZJCOLOR.color_c0];
    smallrighlable.backgroundColor = [UIColor clearColor];
    
    smallrighlable.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicdingjingou)];
    [smallrighlable addGestureRecognizer:tap];
    

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    biglable.attributedText = attributedString;

    [self.middleBackView addSubview:smallrighlable];
    
    if (bartype == willStartSellType) {
        biglable.textAlignment = NSTextAlignmentCenter;
    }
    
    if (bartype == immediateGoBuyType) {
        [smallrighlable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.middleBackView.mas_right).offset(ADJUST_PERCENT_FLOAT(-5));
            make.top.bottom.equalTo(self.middleBackView);
            make.width.mas_offset(ADJUST_PERCENT_FLOAT(60));
        }];
        [biglable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.middleBackView.mas_left).offset(ADJUST_PERCENT_FLOAT(5));
            make.right.equalTo(smallrighlable.mas_left).offset(ADJUST_PERCENT_FLOAT(5));
            make.top.bottom.equalTo(self.middleBackView);
        }];
    } else {
        [biglable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.middleBackView).offset(0);
            make.right.equalTo(self.middleBackView.mas_right).offset(ADJUST_PERCENT_FLOAT(-5));
            make.left.equalTo(self.middleBackView.mas_left).offset(ADJUST_PERCENT_FLOAT(5));
         }];
    }
}

/**
 点击事件
 100    客服
 101    喜欢
 102    已售罄
 103    加一口
 104    开拍提醒
 105    马上抢 (定金)
 106    找客服
 107    马上抢 没有定金
 108    付款中
 109    继续付款
 */
- (void)clickbtn:(UIButton *)sender
{
    YBLog(@"++tag++%ld",(long)sender.tag);
    if (self.clickBoomViewBtnBlock) {
        self.clickBoomViewBtnBlock(sender.tag);
    }
}

/**
 定金购
 */
- (void)clicdingjingou
{
    if (self.clickBoomViewBtnBlock) {
        self.clickBoomViewBtnBlock(110);
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lineview = [[ZJBaseView alloc]init];
        self.lineview.backgroundColor = [UIColor ex_colorWithHexString:@"d8d8d8" alpha:1];
        [self addSubview:self.lineview];
        [_lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
    }
    return self;
}

- (void)setMiddleViewSubviewText:(NSString *)text
                    btnImageName:(NSString *)imageName
                          btnTag:(NSInteger)btntag
{
    [self addSubview:self.rightBackView];
    UIView *onesubview = [self setOnerightViewbtntitle:text btnimageName:imageName btnTag:btntag];
    onesubview.backgroundColor = ZJCOLOR.color_c6;
    [_rightBackView addSubview:onesubview];
    
    [_rightBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kefuAndLikeBackView.mas_right).offset(0);
        make.top.bottom.right.equalTo(self).offset(0);
    }];
    
    [onesubview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(_rightBackView).offset(0);
    }];
}

/**
 找客服 付定金，付款
 */
/**
 客服和喜欢的整个view
 */
- (void)setKefuAndLikeViewSubview
{
    [self addSubview:self.kefuAndLikeBackView];
    UIView *view1 = [self setleftItemViewWithimageName:@"details_service"
                                                  font:10 text:@"客服"
                                             textcolor:ZJCOLOR.color_c4
                                               viewtag:100];
    view1.tag = 100;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(clickkefuview:)];
    [view1 addGestureRecognizer:tap];
    UIView *view2 = [self setleftItemViewWithimageName:@"details_like2"
                                                  font:10
                                                  text:@"喜欢"
                                             textcolor:ZJCOLOR.color_c4
                                               viewtag:101];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(clickkefuview:)];
    view2.tag = 101;
    [view2 addGestureRecognizer:tap2];
    [_kefuAndLikeBackView addSubview:view1];
    [_kefuAndLikeBackView addSubview:view2];

    [_kefuAndLikeBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(100));
        make.height.mas_equalTo(self.height);
        make.top.mas_equalTo(self).mas_offset(1);
        make.left.mas_equalTo(self).mas_offset(0);
    }];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(0);
        make.left.mas_equalTo(self).mas_offset(5);
        make.width.equalTo(_kefuAndLikeBackView.mas_width).multipliedBy(0.5);
        make.centerY.mas_equalTo(_kefuAndLikeBackView.mas_centerY);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(view1);
        make.top.mas_equalTo(_kefuAndLikeBackView.mas_top);
        make.left.mas_equalTo(view1.mas_right).mas_offset(-5);
    }];
}

- (void)clickkefuview:(UITapGestureRecognizer *)tap
{
    if (self.clickBoomViewBtnBlock) {
        self.clickBoomViewBtnBlock(tap.view.tag);
    }
}

/**
 客服 单个item的布局
 */
- (UIView *)setleftItemViewWithimageName:(NSString *)imageName
                                    font:(NSInteger)font
                                    text:(NSString *)text
                               textcolor:(UIColor *)color
                                 viewtag:(NSInteger)viewtag
{
    UIView *view =  [[UIView alloc]init];
    view.tag = viewtag;
    UIImageView *icon = [[UIImageView alloc]init];
    icon.image = ZJIMAGE(IMAGEFILEPATH_DETAIL, imageName, ZJProjectLoadImageDefault).firstObject;
    [view addSubview:icon];
    if (viewtag == 101) {
        self.likeImageView = icon;
    }
    YBDefaultLabel *lable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(font)
                                                     text:text
                                                textColor:color];
    lable.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lable];
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(18), ADJUST_PERCENT_FLOAT(18)));
        make.centerX.mas_equalTo(view.mas_centerX);
    }];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(icon.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.right.equalTo(view).offset(ADJUST_PERCENT_FLOAT(-5));
        make.centerX.mas_equalTo(view.mas_centerX);
    }];
 
 
    return view;
}

/**
 一共有两个：
 开拍提醒
 加一口
 已售罄
 */
- (UIView *)setOnerightViewbtntitle:(NSString *)btntitle
                       btnimageName:(NSString *)imageName
                             btnTag:(NSInteger)btnTag
{
    ZJBaseView *view = [[ZJBaseView alloc]init];
    YBDefaultButton *btn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                       titleColor:ZJCOLOR.color_c0
                                                                        titleFont:SYSTEM_REGULARFONT(18)
                                                                    imageFilePath:IMAGEFILEPATH_DETAIL
                                                                       imageNamed:imageName
                                                                             type:ZJProjectButtonSetBackgroundImage
                                                                           target:self
                                                                         selector:@selector(clickbtn:)];
    [btn setTitle:btntitle forState:UIControlStateNormal];
    btn.tag = btnTag;
    [view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(view).offset(0);
    }];
    return view;
}


/**
 懒加载
 */
- (YBDefaultButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [YBDefaultButton buttonWithTitleStringKey:@""
                                                   titleColor:ZJCOLOR.color_c4
                                                    titleFont:SYSTEM_LIGHTFONT(18)
                                                       target:self
                                                     selector:@selector(clickbtn:)];
    }
    return _rightBtn;
}

- (ZJBaseView *)kefuAndLikeBackView {
    if (!_kefuAndLikeBackView) {
        _kefuAndLikeBackView = [[ZJBaseView alloc]init];
    }
    return _kefuAndLikeBackView;
}

- (ZJBaseView *)middleBackView {
    if (!_middleBackView) {
        _middleBackView = [[ZJBaseView alloc]init];
    }
    return _middleBackView;
}

- (ZJBaseView *)rightBackView {
    if (!_rightBackView) {
        _rightBackView = [[ZJBaseView alloc]init];
    }
    return _rightBackView   ;
}

@end
