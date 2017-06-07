//
//  YBMeMainHeaderView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMeMainHeaderView.h"
#import "User_LocalData.h"
@interface YBMeMainHeaderView ()


@property(nonatomic,strong) YBDefaultButton * setBtn;
@property(nonatomic,strong) UIImageView * userIcon;
@property(nonatomic,strong) YBDefaultLabel * userLable;
@property(nonatomic,strong) YBDefaultButton * sellpersonBtn;
@property(nonatomic,strong) YBDefaultButton * realNameBtn;
@property(nonatomic,strong) YBDefaultButton * bindingPhoneBtn;
@property(nonatomic,strong) YBDefaultButton * collectBtn;
@property(nonatomic,strong) YBDefaultButton * likeNumberBtn;
@property(nonatomic,strong) YBDefaultButton * recordNumberBtn;

@end

@implementation YBMeMainHeaderView

/**
 查看个人信息
 */
- (void)clickInfortap:(UITapGestureRecognizer *)tap
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(13);
    }
}

/**
 btn.tag:
 10     喜欢
 11     足迹
 12     设置
 */
- (void)clickBtn:(UIButton *)sender
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.tag);
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

/**
 赋值
 */
- (void)setDataModel:(YBMeMainDataModel *)dataModel
{
    _dataModel = dataModel;
    self.userLable.text = dataModel.nickname;
    if ([dataModel.head_image isEqualToString:@"default"]) {
        
        self.userIcon.image = [UIImage imageNamed:@"mine_defaultphoto_icon"];
    }else {
        NSData *imagedata = [SYSTEM_USERDEFAULTS objectForKey:@"headerimagedata"];
        self.userIcon.image = [UIImage imageWithData:imagedata];
        if (imagedata.length ==0) {
            [self.userIcon sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageUrlStringHeaderIcon, dataModel.head_image)] placeholderImage:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
        }
    }
    
    [self.likeNumberBtn setTitle:[NSString stringWithFormat:@"%ld",(long)dataModel.colletionCount] forState:UIControlStateNormal];
    [self.recordNumberBtn setTitle:[NSString stringWithFormat:@"%ld",(long)dataModel.recordCount] forState:UIControlStateNormal];
    
    /**
     实名
     */
    [self.realNameBtn setTitleColor:ZJCOLOR.color_c5 forState:UIControlStateNormal];
    [_realNameBtn setImage:[UIImage imageNamed:@"mine_Noreallynblack_n"] forState:UIControlStateNormal];
    NSString *realname = ZJSTRING(MINE_HOMEPAGE_CERTIFICATION_NOTREALNAME_STRINGKEY);
    if (dataModel.idcard_status == 2) {
        [_realNameBtn setImage:[UIImage imageNamed:@"mine_reallynblack_icon_n"] forState:UIControlStateNormal];
        realname = ZJSTRING(MINE_HOMEPAGE_CERTIFICATION_ALREADYREALNAME_STRINGKEY);
        [self.realNameBtn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
    }
    [self.realNameBtn setTitle:realname forState:UIControlStateNormal];
    
    if (dataModel.memberType == 10) {
        [self.sellpersonBtn setTitle:@"会员" forState:UIControlStateNormal];
    }else if (dataModel.memberType == 20) {
        [self.sellpersonBtn setTitle:ZJSTRING(MINE_HOMEPAGE_IDENTITYMARK_BUSINESSMEN_STRINGKEY)
                            forState:UIControlStateNormal];
    }
}

- (void)setUI
{
    [self addSubview:self.setBtn];
    [self addSubview:self.userIcon];
    [self addSubview:self.userLable];
    UIView *infroView = [self inforview];
    [self addSubview:infroView];
    UIView *tempview = [self setlikeNumberAndRecordNumberView];
    [self addSubview:tempview];
    
    [self.setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(35));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-18));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(25), ADJUST_PERCENT_FLOAT(25)));
    }];
    
    [self.userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(66));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(60), ADJUST_PERCENT_FLOAT(60)));
    }];
    
    [self.userLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userIcon.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(50));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-50));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
    }];
    
    [infroView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(190), ADJUST_PERCENT_FLOAT(20)));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.userLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(5));
    }];
    
    [tempview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(75));
        make.left.right.mas_equalTo(self);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(60));
    }];
}

/**
 商家，实名认证，绑定手机号的view
 */
- (UIView *)inforview
{
    UIView *view= [[UIView alloc]init];
    [view addSubview:self.sellpersonBtn];
    [view addSubview:self.realNameBtn];
    [view addSubview:self.bindingPhoneBtn];
    
    [self.sellpersonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(50), ADJUST_PERCENT_FLOAT(20)));
    }];
    
    [self.realNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.sellpersonBtn.mas_top);
        make.left.mas_equalTo(self.sellpersonBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.height.mas_equalTo(self.sellpersonBtn.mas_height);
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(60));
    }];
    
    [self.bindingPhoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.sellpersonBtn.mas_top);
        make.left.mas_equalTo(self.realNameBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.height.mas_equalTo(self.sellpersonBtn.mas_height);
        //        make.width.mas_offset(ADJUST_PERCENT_FLOAT(70));
        make.right.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(0));
    }];
    
    
    return view;
}

/**
 喜欢， 足迹
 */
- (UIView *)setlikeNumberAndRecordNumberView
{
    UIView *view = [[UIView alloc]init];
    
    [view addSubview:self.likeNumberBtn];
    [view addSubview:self.recordNumberBtn];
    
    YBDefaultButton *likedesc = [YBDefaultButton buttonWithTitleStringKey:@""
                                                               titleColor:ZJCOLOR.color_c4
                                                                titleFont:SYSTEM_REGULARFONT(12)
                                                                   target:self
                                                                 selector:@selector(clickBtn:)];
    
    YBDefaultButton *recorddesc = [YBDefaultButton buttonWithTitleStringKey:@""
                                                                 titleColor:ZJCOLOR.color_c4
                                                                  titleFont:SYSTEM_REGULARFONT(12)
                                                                     target:self
                                                                   selector:@selector(clickBtn:)];
    likedesc.tag = 10;
    recorddesc.tag = 11;
    [likedesc setTitle:ZJSTRING(MINE_HOMEPAGE_USER_LOVE_STRINGKEY) forState:UIControlStateNormal];
    [recorddesc setTitle:ZJSTRING(MINE_HOMEPAGE_USER_HISTORYBROWSING_STRINGKEY) forState:UIControlStateNormal];
    [view addSubview:likedesc];
    [view addSubview:recorddesc];
    
    [self.likeNumberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view).multipliedBy(0.5);
        make.top.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.left.mas_equalTo(view);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(25));
    }];
    [likedesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.likeNumberBtn.mas_width);
        make.top.mas_equalTo(self.likeNumberBtn.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.left.mas_equalTo(view);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(15));
    }];
    
    [self.recordNumberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.top.height.mas_equalTo(self.likeNumberBtn);
        make.right.mas_equalTo(view);
    }];
    
    [recorddesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(likedesc.mas_width);
        make.top.mas_equalTo(likedesc.mas_top);
        make.right.mas_equalTo(view);
        make.height.mas_equalTo(likedesc.mas_height);
    }];
    
    UIView *lineview = [[UIView alloc]init];
    lineview.backgroundColor = ZJCOLOR.color_c14;
    [view addSubview:lineview];
    
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(0.5), ADJUST_PERCENT_FLOAT(30)));
        make.centerX.mas_equalTo(view.mas_centerX);
        make.centerY.mas_equalTo(view.mas_centerY);
    }];
    
    return view;
}

#pragma mark  *** 懒加载
/**
 设置
 */
- (YBDefaultButton *)setBtn {
    if (!_setBtn) {
        _setBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                              titleColor:ZJCOLOR.color_c4
                                                               titleFont:SYSTEM_LIGHTFONT(10)
                                                           imageFilePath:IMAGEFILEPATH_MINE
                                                              imageNamed:@"mine_setting"
                                                                    type:ZJProjectButtonSetImage
                                                                  target:self
                                                                selector:@selector(clickBtn:)];
        _setBtn.tag = 12;
    }
    return _setBtn;
}

/**
 用户头像
 */
- (UIImageView *)userIcon {
    if (!_userIcon) {
        _userIcon = [[UIImageView alloc]init];
        _userIcon.image = [UIImage imageNamed:@"mine_defaultphoto_icon"];
        _userIcon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickInfortap:)];
        [_userIcon addGestureRecognizer:tap];
        _userIcon.layer.masksToBounds = YES;
        _userIcon.layer.cornerRadius = ADJUST_PERCENT_FLOAT(30);
    }
    return _userIcon;
}
/**
 用户昵称
 */
- (YBDefaultLabel  *)userLable {
    if (!_userLable) {
        _userLable = [YBDefaultLabel labelWithFont:SYSTEM_LIGHTFONT(18)
                                              text:@""
                                         textColor:ZJCOLOR.color_c4];
        _userLable.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickInfortap:)];
        [_userLable addGestureRecognizer:tap];
    }
    return _userLable;
}

/**
 商户
 */
- (YBDefaultButton *)sellpersonBtn {
    if (!_sellpersonBtn) {
        _sellpersonBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:ZJSTRING(MINE_HOMEPAGE_IDENTITYMARK_BUSINESSMEN_STRINGKEY)
                                                                     titleColor:ZJCOLOR.color_c4
                                                                      titleFont:SYSTEM_LIGHTFONT(10)
                                                                  imageFilePath:IMAGEFILEPATH_MINE
                                                                     imageNamed:@"mine_shopblack_icon"
                                                                           type:ZJProjectButtonSetImage
                                                                         target:self
                                                                       selector:nil];
        _sellpersonBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0);
    }
    return _sellpersonBtn;
}

/**
 实名认证
 */
- (YBDefaultButton *)realNameBtn {
    if (!_realNameBtn) {
        _realNameBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:MINE_HOMEPAGE_CERTIFICATION_ALREADYREALNAME_STRINGKEY
                                                                   titleColor:ZJCOLOR.color_c4
                                                                    titleFont:SYSTEM_LIGHTFONT(10)
                                                                imageFilePath:IMAGEFILEPATH_MINE
                                                                   imageNamed:@"mine_reallynblack_icon"
                                                                         type:ZJProjectButtonSetImage
                                                                       target:self
                                                                     selector:nil];
        _realNameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0);
    }
    return _realNameBtn;
}

/**
 关注数
 */
- (YBDefaultButton *)collectBtn {
    if (!_collectBtn) {
        _collectBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                  titleColor:ZJCOLOR.color_c4
                                                                   titleFont:SYSTEM_LIGHTFONT(10)
                                                               imageFilePath:IMAGEFILEPATH_MINE
                                                                  imageNamed:@"mine_zhimablack_icon"
                                                                        type:ZJProjectButtonSetImage
                                                                      target:self
                                                                    selector:nil];
    }
    return _collectBtn;
}
/**
 绑定手机号
 */
- (YBDefaultButton *)bindingPhoneBtn {
    if (!_bindingPhoneBtn) {
        _bindingPhoneBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:MINE_HOMEPAGE_BIND_PHONEBIND_STRINGKEY
                                                                       titleColor:ZJCOLOR.color_c4
                                                                        titleFont:SYSTEM_LIGHTFONT(10)
                                                                    imageFilePath:IMAGEFILEPATH_MINE
                                                                       imageNamed:@"mine_phone_icon"
                                                                             type:ZJProjectButtonSetImage
                                                                           target:self
                                                                         selector:nil];
        _bindingPhoneBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _bindingPhoneBtn;
}
/**
 喜欢
 */
- (YBDefaultButton *)likeNumberBtn {
    if (!_likeNumberBtn) {
        _likeNumberBtn = [YBDefaultButton buttonWithTitleStringKey:nil
                                                        titleColor:ZJCOLOR.color_c4
                                                         titleFont:SYSTEM_REGULARFONT(18)
                                                            target:self
                                                          selector:@selector(clickBtn:)];
        _likeNumberBtn.tag = 10;
        _likeNumberBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _likeNumberBtn;
}
/**
 足迹
 */
- (YBDefaultButton  *)recordNumberBtn {
    if (!_recordNumberBtn) {
        _recordNumberBtn =  [YBDefaultButton buttonWithTitleStringKey:nil
                                                           titleColor:ZJCOLOR.color_c4
                                                            titleFont:SYSTEM_REGULARFONT(18)
                                                               target:self
                                                             selector:@selector(clickBtn:)];
        _recordNumberBtn.tag = 11;
        _recordNumberBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _recordNumberBtn;
}
@end
