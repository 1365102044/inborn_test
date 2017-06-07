//
//  YBGoodsDeatilImgeMoreItemView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilImgeMoreItemView.h"


@interface YBGoodsDeatilImgeMoreItemView ()

@property(nonatomic,strong) ZJBaseView * backBigView;
@property(nonatomic,assign) DeatilBMoreItemType  moreItemType;

@property(nonatomic,assign) CGSize  currenSize;
@property(nonatomic,assign) CGPoint  currenOrgin;


@property(nonatomic,strong) UIView *verline1;
@property(nonatomic,strong) UIView *verline2;
@property(nonatomic,strong) UIView * levelline;

@property(nonatomic,strong) YBDefaultButton * likeBtn;
@property(nonatomic,strong) YBDefaultButton * consulationBtn;
@property(nonatomic,strong) YBDefaultButton * dingjinBuyBtn;
@property(nonatomic,strong) YBDefaultButton * rightoffBuyBtn;
@property(nonatomic,copy) clickItemBlcok   clickItemBtnBlock;

/**
 关注的状态 1 已关注 0 未关注
 */
@property (nonatomic, assign) NSInteger collectStatus;
@property(nonatomic,strong) UIButton * lastSelectBtn;
@end

@implementation YBGoodsDeatilImgeMoreItemView

- (void)clickBtn:(UIButton *)sender
{
    if (self.clickItemBtnBlock) {
        [self dismissItemMoreView];
        self.clickItemBtnBlock(sender.titleLabel.text);
    }
}

- (void)dismiss
{
    [self dismissItemMoreView];
}
- (void)dismissItemMoreView{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backBigView.frame = CGRectMake(_currenOrgin.x, _currenOrgin.y, 0, _currenSize.height);
    } completion:^(BOOL finished) {
        
        NSArray *result=[self.backBigView subviews];
        for (UIView *view in result) {
            [view removeFromSuperview];
            [view removeAllSubviews];
        }
        [self removeFromSuperview];
    }];
}

- (void)showItemMoreView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    self.backBigView.frame = CGRectMake(_currenOrgin.x, _currenOrgin.y, 0, _currenSize.height);
    [UIView animateWithDuration:0.25 animations:^{
        self.backBigView.frame = CGRectMake(_currenOrgin.x - _currenSize.width , _currenOrgin.y, ADJUST_PERCENT_FLOAT(164), _currenSize.height);
    }];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

+ (instancetype)creatMoreItemViewWith:(DeatilBMoreItemType)moreItemType currenOrgin:(CGPoint)currenOrgin collectStatus:(NSInteger)collectStatus clickItemBtn:(clickItemBlcok)clickItemBtnBlock{
    YBGoodsDeatilImgeMoreItemView *view = [[YBGoodsDeatilImgeMoreItemView alloc]initWithFrame:SCREEN_RECT];
    view.currenOrgin                    = currenOrgin;
    view.moreItemType                   = moreItemType;
    view.clickItemBtnBlock              =  clickItemBtnBlock;
    view.collectStatus                  = collectStatus;
    [view setconstans];
    return view;
}

- (void)setMoreItemType:(DeatilBMoreItemType)moreItemType
{
    _moreItemType = moreItemType;
    if (moreItemType == TwoType) {
        self.currenSize = CGSizeMake( ADJUST_PERCENT_FLOAT(164), ADJUST_PERCENT_FLOAT(37));
    }else if (moreItemType == FourType){
        self.currenSize = CGSizeMake( ADJUST_PERCENT_FLOAT(164), ADJUST_PERCENT_FLOAT(73));
    }
    self.currenOrgin = CGPointMake(self.currenOrgin.x,  self.currenOrgin.y - self.currenSize.height/2);
}
- (void)setconstans{
    
    [self addSubview:self.backBigView];
    self.backBigView.frame = CGRectMake(_currenOrgin.x, _currenOrgin.y + _currenSize.height/2, 0, _currenSize.height);
    
    [_backBigView addSubview:self.likeBtn];
    if (_collectStatus == 1) {
        [_likeBtn setTitle:ZJSTRING(@"取消") forState:UIControlStateNormal];
    }else if(_collectStatus == 0){
        [_likeBtn setTitle:ZJSTRING(@"喜欢") forState:UIControlStateNormal];
    }
    [_backBigView addSubview:self.consulationBtn];
    if (_moreItemType == TwoType) {
        
        [_backBigView addSubview:self.verline1];
        
        [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(_backBigView);
            make.width.mas_offset(_currenSize.width/2);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(_currenSize.height));
        }];
        
        [_consulationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_likeBtn.mas_right).mas_offset(0);
            make.top.width.height.mas_equalTo(_likeBtn);
        }];
        
        [self.verline1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(_currenSize.height - ADJUST_PERCENT_FLOAT(10));
            make.width.mas_offset(0.5);
            make.top.mas_equalTo(_backBigView.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(5));
            make.left.mas_equalTo(_likeBtn.mas_right);
        }];
        
    }else if (_moreItemType == FourType){
        
        
        [_backBigView addSubview:self.dingjinBuyBtn];
        [_backBigView addSubview:self.rightoffBuyBtn];
        
        [_backBigView addSubview:self.levelline];
        [_backBigView addSubview:self.verline2];
        [_backBigView addSubview:self.verline1];
        
        [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(_backBigView);
            make.height.mas_offset(_currenSize.height/2 - 0);
            make.width.mas_offset(_currenSize.width/2);
        }];
        
        [_consulationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_likeBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.top.mas_equalTo(_backBigView.mas_top);
            make.width.height.mas_equalTo(_likeBtn);
        }];
        
        [_dingjinBuyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.left.width.mas_equalTo(_likeBtn);
            make.top.mas_equalTo(_likeBtn.mas_bottom).mas_offset(0);
        }];
        
        [_rightoffBuyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.left.mas_equalTo(_consulationBtn);
            make.top.mas_equalTo(_dingjinBuyBtn.mas_top);
        }];
        
        [self.levelline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(0.5);
            make.width.mas_offset(_currenSize.width - ADJUST_PERCENT_FLOAT(20));
            make.centerY.mas_equalTo(self.backBigView.mas_centerY);
            make.centerX.mas_equalTo(self.backBigView.mas_centerX);
        }];
        
        [self.verline1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(_currenSize.height/2 - ADJUST_PERCENT_FLOAT(10*2));
            make.width.mas_offset(0.5);
            make.top.mas_equalTo(_likeBtn.mas_top).mas_offset(10);
            make.centerX.mas_equalTo(self.backBigView.mas_centerX);
        }];
        
        [self.verline2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_verline1.mas_height);
            make.width.mas_offset(0.5);
            make.top.mas_equalTo(_likeBtn.mas_bottom).mas_offset(10);
            make.centerX.mas_equalTo(self.backBigView.mas_centerX);
        }];
    }
}
#pragma mark  *** 懒加载
- (ZJBaseView *)backBigView {
    if (!_backBigView) {
        _backBigView = [[ZJBaseView alloc]init];
        _backBigView.backgroundColor = ZJCOLOR.color_c4;
        _backBigView.layer.cornerRadius = 4;
        _backBigView.layer.masksToBounds = YES;
    }
    return _backBigView;
}
- (UIView *)levelline {
    if (!_levelline) {
        _levelline = [[UIView alloc]init];
        _levelline.backgroundColor = ZJCOLOR.color_c21;
    }
    return _levelline;
}

- (UIView *)verline1 {
    if (!_verline1) {
        _verline1 = [[UIView alloc]init];
        _verline1.backgroundColor = ZJCOLOR.color_c21;
    }
    return _verline1;
}
- (UIView *)verline2 {
    if (!_verline2) {
        _verline2 = [[UIView alloc]init];
        _verline2.backgroundColor = ZJCOLOR.color_c21;
    }
    return _verline2;
}

/**
 咨询
 */
- (YBDefaultButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"喜欢")
                                                  titleColor:ZJCOLOR.color_c0
                                                   titleFont:SYSTEM_REGULARFONT(14)
                                                      target:self
                                                    selector:@selector(clickBtn:)];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_n"] forState:UIControlStateNormal];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_h"] forState:UIControlStateHighlighted];
        _likeBtn.tag                                = 50;
    }
    return _likeBtn;
}

/**
 咨询
 */
- (YBDefaultButton *)consulationBtn {
    if (!_consulationBtn) {
        _consulationBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"咨询")
                                                  titleColor:ZJCOLOR.color_c0
                                                   titleFont:SYSTEM_REGULARFONT(14)
                                                      target:self
                                                    selector:@selector(clickBtn:)];
        [_consulationBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_n"] forState:UIControlStateNormal];
        [_consulationBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_h"] forState:UIControlStateHighlighted];
        _consulationBtn.tag                                = 51;
    }
    return _consulationBtn;
}

/**
 定金购
 */
- (YBDefaultButton *)dingjinBuyBtn {
    if (!_dingjinBuyBtn) {
        _dingjinBuyBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"定金购")
                                                  titleColor:ZJCOLOR.color_c0
                                                   titleFont:SYSTEM_REGULARFONT(14)
                                                      target:self
                                                    selector:@selector(clickBtn:)];
        
        [_dingjinBuyBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_n"] forState:UIControlStateNormal];
        [_dingjinBuyBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_h"] forState:UIControlStateHighlighted];
        _dingjinBuyBtn.tag                                = 52;
    }
    return _dingjinBuyBtn;
}

/**
 马上抢
 */
- (YBDefaultButton *)rightoffBuyBtn {
    if (!_rightoffBuyBtn) {
        _rightoffBuyBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"马上抢")
                                                  titleColor:ZJCOLOR.color_c0
                                                   titleFont:SYSTEM_REGULARFONT(14)
                                                      target:self
                                                    selector:@selector(clickBtn:)];
        [_rightoffBuyBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_n"] forState:UIControlStateNormal];
        [_rightoffBuyBtn setBackgroundImage:[UIImage imageNamed:@"detailsB_MoreItem_btn_bg_h"] forState:UIControlStateHighlighted];
        _rightoffBuyBtn.tag                                = 53;
    }
    return _rightoffBuyBtn;
}



@end
