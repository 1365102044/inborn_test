//
//  YBShareView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBShareView.h"
//#import "YBShareManger.h"

static CGFloat SHAREVIEWHEIHT  = 350;

@interface YBShareView ()

@property(nonatomic,copy) clickShareBtnBlock  clickshareBlock;

@property(nonatomic,strong) UIWindow * mywindow;
/**
 灰色的背景
 */
@property(nonatomic,strong) ZJBaseView * backBigView;

/**
 视图
 */
@property(nonatomic,strong) ZJBaseView * shareView;

@property(strong,nonatomic) YBDefaultLabel *titleLable;
@property(nonatomic,strong) UIImageView * lineview;
@property(nonatomic,strong) ZJBaseView * itemBackview;
@property(nonatomic,strong) ZJBaseView * lineTwo;
@property(nonatomic,strong) UIView * row1view;

@end

@implementation YBShareView

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static YBShareView *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YBShareView alloc]init];
    });
    return instance;
}

/**
 弹出视图
 */
- (void)showShareViewWithclickBlcok:(clickShareBtnBlock)clickItemBlcok
{
    self.clickshareBlock = clickItemBlcok;
    self.mywindow =  [UIApplication sharedApplication].keyWindow;
    
    [_mywindow addSubview:self.backBigView];
    [_mywindow addSubview:self.shareView];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backBigView.alpha = 0.3;
        self.shareView.ex_y = SCREEN_HEIGHT - SHAREVIEWHEIHT;
        
    } completion:^(BOOL finished) {
        [self setMainsubview];
    }];
}

/**
 移除视图
 */
- (void)dismissShareView
{
    [UIView animateWithDuration:0.25 animations:^{
        self.backBigView.alpha = 0.0;
        self.shareView.ex_y = SCREEN_HEIGHT + SHAREVIEWHEIHT;
    } completion:^(BOOL finished) {
        [self.backBigView removeFromSuperview];
        [self.shareView removeFromSuperview];
    }];
}

/**
 添加整体控件
 */
- (void)setMainsubview
{
    [_shareView addSubview:self.titleLable];
    [_shareView addSubview:self.lineview];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_shareView);
        make.top.mas_equalTo(_shareView).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(150), ADJUST_PERCENT_FLOAT(30)));
    }];
    
    [_lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(_shareView).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(1));
        make.top.mas_equalTo(_titleLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
    }];

    [self shareViewSubview];
}

/**
 分享控件
 */
- (void)shareViewSubview
{
    NSArray * shareItemArr = @[@"微信",@"朋友圈",@"微博",@"复制粘贴",@"短信",@"邮件"];
    NSArray * shareItemIconArr = @[@"details_wechat",@"details_moments",@"details_weibo",@"details_links",@"details_message",@"details_email"];
    _itemBackview = [[ZJBaseView alloc]init];
    _itemBackview.frame = CGRectMake(0, ADJUST_PERCENT_FLOAT(60), SCREEN_WIDTH, _shareView.height-_lineview.bottom-ADJUST_PERCENT_FLOAT(10));
    [_shareView addSubview:_itemBackview];

    NSInteger Col = 3;
    CGFloat imageWith = SCREEN_WIDTH/3;
    for (int i =0 ; i <shareItemArr.count; i++) {
        UIView *itemview = [self itemviewWithTitle:shareItemArr[i] imagename:shareItemIconArr[i] tag:i+1];
        NSInteger rows                  = i/Col;
        NSInteger cols                  = i%Col;
        CGFloat IMX                     = cols*(imageWith );
        CGFloat IMY                     = rows*(imageWith+20);
        itemview.frame                 = CGRectMake(IMX, IMY, imageWith, imageWith);
        if (i==1) {
            self.row1view = itemview;
        }
        [_itemBackview addSubview:itemview];
    }
    
    _lineTwo = [[ZJBaseView alloc]init];
    _lineTwo.backgroundColor = ZJCOLOR.color_c16;
    [_itemBackview addSubview:_lineTwo];
    _lineTwo.frame = CGRectMake(ADJUST_PERCENT_FLOAT(10), self.row1view.bottom+5, SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(20), 1);
}

/**
 分享itemtview
 */
- (UIView *)itemviewWithTitle:(NSString *)title imagename:(NSString *)imagename tag:(NSInteger)tag
{
    UIView *view = [[UIView alloc]init];
    
    UIButton *imageveiw = [[UIButton alloc]init];
    [imageveiw setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_n",imagename]] forState:UIControlStateNormal];
    [imageveiw setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_h",imagename]] forState:UIControlStateSelected];
    [view addSubview:imageveiw];
    
    YBDefaultLabel *lable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12) text:title textColor:ZJCOLOR.color_c4];
    lable.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lable];
    
    
    [imageveiw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(61), ADJUST_PERCENT_FLOAT(61)));
        make.centerX.mas_equalTo(view.centerX);
        make.top.mas_equalTo(view).mas_offset(10);
    }];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(imageveiw.mas_width);
        make.left.mas_equalTo(imageveiw.mas_left);
        make.top.mas_equalTo(imageveiw.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(15));
    }];
    
    imageveiw.centerX = view.centerX;
    lable.centerX = view.centerX;
    
//    imageveiw.userInteractionEnabled = YES;
//    lable.userInteractionEnabled = YES;
    
    view.tag = tag;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickshareItem:)];
    [view addGestureRecognizer:tap];
    
    return view;
}

/**
 点击事件
 */
- (void)clickshareItem:(UITapGestureRecognizer *)tap
{
    [self dismissShareView];
    if (self.clickshareBlock) {
        self.clickshareBlock(tap.view.tag);
    }
}

/**
 点击背景
 */
- (void)clickbackBigView
{
    [self dismissShareView];
}

- (YBDefaultLabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                               text:@"分享"
                                          textColor:ZJCOLOR.color_c4];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

- (UIImageView *)lineview {
    if (!_lineview) {
        _lineview = [[UIImageView alloc]init];
        _lineview.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC, @"publick_line", ZJProjectLoadImageDefault);
    }
    return _lineview;
}

/**
 视图
 */
- (ZJBaseView *)shareView {
    if (!_shareView) {
        _shareView = [[ZJBaseView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT + SHAREVIEWHEIHT, SCREEN_WIDTH, SHAREVIEWHEIHT)];
    }
    return _shareView;
}

/**
 灰色的背景
 */
- (ZJBaseView *)backBigView {
    if (!_backBigView) {
        _backBigView = [[ZJBaseView alloc]init];
        _backBigView.alpha = 0.0;
        _backBigView.backgroundColor = [UIColor blackColor];
        _backBigView.frame = self.mywindow.bounds;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickbackBigView)];
        [_backBigView addGestureRecognizer:tap];
        
    }
    return _backBigView;
}
@end
