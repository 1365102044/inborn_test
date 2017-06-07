//
//  YBGoodsDeatilImageBoomBtnView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilImageBoomBtnView.h"

static CGFloat ImageH       =       26;
static CGFloat TOP          =       10;
static CGFloat  Booms       =       12;
@interface YBGoodsDeatilImageBoomBtnView ()

@property(nonatomic,strong) YBDefaultButton * switchBtn;
@property(nonatomic,strong) YBDefaultButton * kefuBtn;
@property(nonatomic,strong) YBDefaultButton * shareBtn;
@property(nonatomic,strong) ZJBaseView * likeBtnView;
/**
 记录的是 未关注为基数
 */
@property(nonatomic,assign) NSInteger  currentLikeNumber;

@end

@implementation YBGoodsDeatilImageBoomBtnView
- (void)setIsCollectChangeNumber:(BOOL)iscollect
{
    NSInteger cureentnumber;
    if (iscollect) {
        cureentnumber = self.currentLikeNumber +1;
          [self.likebtn setImage:[UIImage imageNamed:@"details_like2_h"] forState:UIControlStateNormal];
        [self.numberBtn setTitle:[NSString stringWithFormat:@"%ld",(long)cureentnumber] forState:UIControlStateNormal];
        self.goodsDeatilModel.isCollect = 1;
    }else{
        cureentnumber = self.currentLikeNumber;
        [self.likebtn setImage:[UIImage imageNamed:@"detailsA_like_n"] forState:UIControlStateNormal];
        [self.numberBtn setTitle:[NSString stringWithFormat:@"%ld",(long)cureentnumber] forState:UIControlStateNormal];
        self.goodsDeatilModel.isCollect = 0;
    }
}

/**
 改变显示的喜欢数
 */
- (void)changeLikeNumber:(NSNotification *)noti
{
    NSInteger iscollect = [noti.userInfo[@"isCollect"] integerValue];
    NSString *cureentnumber;
    cureentnumber = [NSString stringWithFormat:@"%ld",_goodsDeatilModel.countCollection ];
    if (iscollect ==1) {
    }else{
        //cureentnumber = [NSString stringWithFormat:@"%ld",_goodsDeatilModel.countCollection -1];
    }
    [self.numberBtn setTitle:[NSString stringWithFormat:@"%@",cureentnumber] forState:UIControlStateNormal];
}

/**
 赋值
 */
- (void)setGoodsDeatilModel:(YBGoodsDeatilModel *)goodsDeatilModel
{
    _goodsDeatilModel = goodsDeatilModel;
    
    /**
     商品关注数
     */
    [self.numberBtn setTitle:[NSString stringWithFormat:@"%ld",(long)goodsDeatilModel.countCollection] forState:UIControlStateNormal];
    
    if (goodsDeatilModel.isCollect == 1) {
        [self.likebtn setImage:[UIImage imageNamed:@"details_like2_h"] forState:UIControlStateNormal];
        self.currentLikeNumber = goodsDeatilModel.countCollection -1;
    }else{
        [self.likebtn setImage:[UIImage imageNamed:@"detailsA_like_n"] forState:UIControlStateNormal];
        self.currentLikeNumber = goodsDeatilModel.countCollection;
    }
}

/**
 btn.tag:
 1          切换详情界面
 2          客服
 3          分享
 4          喜欢
 */
- (void)clickBtn:(UIButton *)sender
{
    if (sender.tag == 4) {
        //先将未到时间执行前的任务取消。
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(clicLikeBtn:) object:sender];
        [self performSelector:@selector(clicLikeBtn:) withObject:sender afterDelay:0.2f];

        return;
    }
    if (self.clickDeatilImBoomBtnViewBlock) {
        self.clickDeatilImBoomBtnViewBlock(sender.tag);
    }
}

- (void)clicLikeBtn:(UIButton *)sender{
    if (self.clickDeatilImBoomBtnViewBlock) {
        self.clickDeatilImBoomBtnViewBlock(sender.tag);
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.switchBtn];
    [self addSubview:self.kefuBtn];
    [self addSubview:self.shareBtn];
    [self addSubview:self.likebtn];
//    ZJBaseView *tempview = [self setLikeBtnViewNumber:@"32"];
//    [self addSubview:tempview];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(ImageH), ADJUST_PERCENT_FLOAT(ImageH)));
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(16));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-ADJUST_PERCENT_FLOAT(Booms));
    }];
    
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(ImageH), ADJUST_PERCENT_FLOAT(ImageH)));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.centerY.mas_equalTo(_shareBtn.mas_centerY);
    }];
    
    [self.likebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(ImageH), ADJUST_PERCENT_FLOAT(ImageH)));
        make.right.mas_equalTo(_switchBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-11));
        make.centerY.mas_equalTo(_shareBtn.mas_centerY);
    }];
    
    [self.kefuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.shareBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(11));
        make.right.mas_equalTo(_likebtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-7));
        make.centerY.mas_equalTo(_shareBtn.mas_centerY);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(ImageH));
    }];
    

    /**
     监听 点击喜欢图标 改变数字
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLikeNumber:) name:@"CHANGEGOODSDEATILIMAGELIKENUMBER" object:nil];
    
}

/**
 喜欢 有数字的 （暂时没有用到）
 */
- (ZJBaseView *)setLikeBtnViewNumber:(NSString *)number
{
    ZJBaseView *view = [[ZJBaseView alloc]init];
    YBDefaultButton *likebtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                                  imageNamed:@"details_like"
                                                                        type:ZJProjectButtonSetBackgroundImage
                                                                      target:self
                                                                    selector:@selector(clickBtn:)];
    likebtn.tag  = 4;
    [view addSubview:likebtn];
    self.likebtn = likebtn;
    YBDefaultButton *numberbtn = [YBDefaultButton buttonWithTitleStringKey:@""
                                                                titleColor:ZJCOLOR.color_c0
                                                                 titleFont:SYSTEM_LIGHTFONT(11)
                                                                    target:self
                                                                  selector:@selector(clickBtn:)];
    self.numberBtn = numberbtn;
    numberbtn.backgroundColor = ZJCOLOR.color_c6;
    [view addSubview:numberbtn];
    numberbtn.tag  = 4;
    [likebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(ADJUST_PERCENT_FLOAT(TOP));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(ImageH), ADJUST_PERCENT_FLOAT(ImageH)));
        make.left.mas_equalTo(view);
    }];
    [numberbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(ADJUST_PERCENT_FLOAT(1));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(ImageH-2), ADJUST_PERCENT_FLOAT(15)));
        make.left.mas_equalTo(view).mas_offset(1);
    }];
    numberbtn.layer.cornerRadius = 7;
    numberbtn.layer.masksToBounds = YES;
    [numberbtn setTitle:number forState:UIControlStateNormal];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

/**
 分享
 */
- (YBDefaultButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn       = [YBDefaultButton buttonImageWithImageFilePath:@""
                                                             imageNamed:@""
                                                                   type:ZJProjectButtonSetBackgroundImage
                                                                 target:self
                                                               selector:@selector(clickBtn:)];
        _shareBtn.tag   = 3;
        [_shareBtn setImage:[UIImage imageNamed:@"detailsA_share_n"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}
/**
 喜欢
 */
- (YBDefaultButton *)likebtn {
    if (!_likebtn) {
        _likebtn       = [YBDefaultButton buttonImageWithImageFilePath:@""
                                                             imageNamed:@""
                                                                   type:ZJProjectButtonSetBackgroundImage
                                                                 target:self
                                                               selector:@selector(clickBtn:)];
        _likebtn.tag   = 4;
        [_likebtn setImage:[UIImage imageNamed:@"detailsA_like_n"] forState:UIControlStateNormal];
    }
    return _likebtn;
}
/**
 客服
 */
- (YBDefaultButton *)kefuBtn {
    if (!_kefuBtn) {
        _kefuBtn                            = [YBDefaultButton buttonWithTitleStringKey:@""
                                                                             titleColor:ZJCOLOR.color_c0
                                                                              titleFont:SYSTEM_LIGHTFONT(10)
                                                                                 target:self
                                                                               selector:@selector(clickBtn:)];
        
        _kefuBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _kefuBtn.layer.masksToBounds        = YES;
        _kefuBtn.layer.cornerRadius         = ImageH/2;
        _kefuBtn.layer.borderColor          = ZJCOLOR.color_c0.CGColor;
        _kefuBtn.layer.borderWidth          = 1;
        _kefuBtn.tag                        = 2;
        [_kefuBtn setTitle:@"    心动了吗？找贵宾顾问聊聊?" forState:UIControlStateNormal];
    }
    return _kefuBtn;
}
/**
 旋转按钮
 */
- (YBDefaultButton *)switchBtn {
    if (!_switchBtn) {
        _switchBtn          = [YBDefaultButton buttonImageWithImageFilePath:@""
                                                                 imageNamed:@""
                                                                       type:ZJProjectButtonSetBackgroundImage
                                                                     target:self
                                                                   selector:@selector(clickBtn:)];
        [_switchBtn setImage:[UIImage imageNamed:@"detailsA_shelf_n"] forState:UIControlStateNormal];
        _switchBtn.tag      = 1;
    }
    return _switchBtn;
}
@end

