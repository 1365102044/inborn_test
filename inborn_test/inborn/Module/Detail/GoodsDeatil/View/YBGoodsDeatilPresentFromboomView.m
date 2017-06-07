//
//  YBGoodsDeatilPresentFromboomView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilPresentFromboomView.h"

static CGFloat IMAGEHEI =  425;
@interface YBGoodsDeatilPresentFromboomView ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView * scrollerview;

@property(nonatomic,strong) YBDefaultLabel *titleLable;
@property(nonatomic,strong) UIImageView *lineview;
@property(nonatomic,strong) NSString * titleStr;

@property(nonatomic,strong) UIImageView * contentImageview;

@end

@implementation YBGoodsDeatilPresentFromboomView

- (void)settitleStr:(NSString *)title
{
    self.titleLable.text = @"";
    _titleStr = title;
//    [_itemBackview removeFromSuperview];

    [self setMainsubview];
    
    if ([title isEqualToString:@"交易流程"]) {
        self.contentImageview.image = [UIImage imageNamed:@"details_deal_bg"];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setMainsubview
{
    [self addSubview:self.titleLable];
    _titleLable.text = _titleStr;

    [self addSubview:self.lineview];
    
    [self addSubview:self.scrollerview];
    
    [self.scrollerview addSubview:self.contentImageview];
    
    self.scrollerview.scrollsToTop = YES;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(150), ADJUST_PERCENT_FLOAT(30)));
    }];
    
    [_lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(1));
        make.top.mas_equalTo(_titleLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
    }];
    
    [_scrollerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self).mas_offset(0);
        make.top.mas_equalTo(_lineview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
//        make.height.mas_offset(ADJUST_PERCENT_FLOAT(IMAGEHEI));
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    [_contentImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(_scrollerview);
    }];
}

- (YBDefaultLabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                              text:@""
                                         textColor:ZJCOLOR.color_c4];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

- (UIImageView *)contentImageview {
    if (!_contentImageview) {
        _contentImageview = [[UIImageView alloc]init];
    }
    return _contentImageview;
}
- (UIImageView *)lineview {
    if (!_lineview) {
        _lineview = [[UIImageView alloc]init];
        _lineview.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC, @"publick_line", ZJProjectLoadImageDefault);
    }
    return _lineview;
}

-(UIScrollView*)scrollerview
{
    if (!_scrollerview) {
        _scrollerview = [[UIScrollView alloc]init];
        _scrollerview.contentSize = CGSizeMake(SCREEN_WIDTH, IMAGEHEI);
        _scrollerview.delegate= self;
    }
    return _scrollerview;
}
@end
