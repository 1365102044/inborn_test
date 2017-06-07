//
//  YBGoodsDeatilImageTopView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilImageTopView.h"
#import "NSString+Extension.h"
static CGFloat HEI =  44;
@interface YBGoodsDeatilImageTopView ()


@property(nonatomic,strong) UIImageView * bigimageview;

@property(nonatomic,strong) YBDefaultButton * colseBtn;
@property(nonatomic,strong) UIImageView * informBigView;
@property(nonatomic,strong) YBDefaultLabel * descLable;

@property(nonatomic,strong) UIImageView * icon;
@property(nonatomic,strong) YBDefaultLabel * nameLable;
@property(nonatomic,strong) YBDefaultButton * goodspersonBtn;
@property(nonatomic,strong) YBDefaultButton * realNameBtn;
@property(nonatomic,strong) YBDefaultButton * collectBtn;

@property(nonatomic,assign) CGFloat  DescHeight;

@end

@implementation YBGoodsDeatilImageTopView

/**
 赋值
 */
-(void)setGoodsDeatilModel:(YBGoodsDeatilModel *)goodsDeatilModel
{
    _goodsDeatilModel = goodsDeatilModel;
    if ([goodsDeatilModel.MemberModel.headImage isEqualToString:@"default"]) {

        self.icon.image = [[UIImage imageNamed:@"mine_defaultphoto_icon"] ex_drawCircleImage];
    }else {
        [self.icon sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageUrlStringHeaderIcon, goodsDeatilModel.MemberModel.headImage)] placeholderImage:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
    }
    self.nameLable.text = goodsDeatilModel.MemberModel.nickname;
    
    /**
     实名认证: 0,实名认证状态：0未认证，1认证中，2认证成功，3认证失败
     */
    if (goodsDeatilModel.MemberModel.idcardStatus == 2) {
        [self.realNameBtn setTitle:ZJSTRING(MINE_HOMEPAGE_CERTIFICATION_ALREADYREALNAME_STRINGKEY)
                          forState:UIControlStateNormal];
    }else {
        [self.realNameBtn setTitle:ZJSTRING(MINE_HOMEPAGE_CERTIFICATION_NOTREALNAME_STRINGKEY)
                          forState:UIControlStateNormal];
    }
    
    /**
     平台的隐藏
     */
    self.realNameBtn.hidden = YES;
    [self.goodspersonBtn setImage:ZJIMAGE(IMAGEFILEPATH_DETAIL, @"details_shop_icon", ZJProjectLoadImageDefault).firstObject forState:UIControlStateNormal];
    
    /**
     * 发布类型：1平台，2个人
     */
    if (goodsDeatilModel.publishType == 1) {
        [self.goodspersonBtn setTitle:ZJSTRING(@"商家")
                             forState:UIControlStateNormal];
        
    }else{
    
        /**
         会员类型： 10 普通会员， 20 普通商家
         */
        if (goodsDeatilModel.MemberModel.memberType == 10) {
            [self.goodspersonBtn setTitle:ZJSTRING(@"会员")
                                 forState:UIControlStateNormal];
            self.realNameBtn.hidden = NO;
        }else if (goodsDeatilModel.MemberModel.memberType == 20) {
            [self.goodspersonBtn setTitle:ZJSTRING(@"商家")
                                 forState:UIControlStateNormal];
        }
    }
    
    NSString *desStr = [NSString stringWithFormat:@"1/%lu %@",(unsigned long)goodsDeatilModel.goodsImgs.count,goodsDeatilModel.sellerDesc];
    NSMutableAttributedString* desc = [[NSMutableAttributedString alloc]initWithString:desStr];
    [desc addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(15) range:NSMakeRange(0, 1)];
    [desc addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(12) range:NSMakeRange(1, desc.length-1)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = 5;
    [desc addAttribute:NSAttachmentAttributeName value:style range:NSMakeRange(0, desc.length)];
    self.descLable.attributedText = desc;
    _DescHeight = [desStr ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_REGULARFONT(12) withWidth:SCREEN_WIDTH -ADJUST_PERCENT_FLOAT(30+15)];
    if (_DescHeight>=80) {
        _DescHeight = 80;
    }
    [self.descLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-30));
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.top.mas_equalTo(_tempview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
    }];
    
}

- (void)clickBtn:(UIButton *)sender
{
    if (self.clickDeatilImTopbtnBlock) {
        self.clickDeatilImTopbtnBlock();
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bigimageview = [[UIImageView alloc]initWithFrame:self.bounds];
        _bigimageview.image = [UIImage imageNamed:@"details_shadowtop_bg"];
        [self addSubview:_bigimageview];
        
        [self setUI];

        /**
         监听 图片的滚动
         */
        [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(scrollerToImageindex:) name:@"scrollerImageVCindex" object:nil];

    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.colseBtn];
    [self addSubview:self.descLable];
    self.tempview = [self setInformBigViewIcon:@"details_moments" name:@""];
    [self addSubview:_tempview];
    
}

- (void)scrollerToImageindex:(NSNotification *)noti
{
    NSInteger index = [noti.userInfo[@"scrollerindex"] integerValue] + 1;
    NSString *desStr = [NSString stringWithFormat:@"%ld/%ld %@",index,_goodsDeatilModel.goodsImgs.count,_goodsDeatilModel.sellerDesc];
    NSMutableAttributedString* desc = [[NSMutableAttributedString alloc]initWithString:desStr];
    [desc addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(15) range:NSMakeRange(0, 1)];
    [desc addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(12) range:NSMakeRange(1, desc.length-1)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = 5;
    [desc addAttribute:NSAttachmentAttributeName value:style range:NSMakeRange(0, desc.length)];
    self.descLable.attributedText = desc;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bigimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.top.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
    }];
    
    [self.colseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(35), ADJUST_PERCENT_FLOAT(35)));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(18));
    }];
    
    [_tempview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.colseBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-10));
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(22));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(HEI));
    }];
    
    if (!_DescHeight) {
        _DescHeight = 15;
    }
    [self.descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-30));
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.top.mas_equalTo(_tempview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(ADJUST_PERCENT_FLOAT(_DescHeight)));
    }];
    
    if (self.getMaxHeightBlock) {
        self.getMaxHeightBlock(self.descLable.bottom+ADJUST_PERCENT_FLOAT(0));
    }
}

/**
 背景图片的子视图
 */
- (UIImageView *)setInformBigViewIcon:(NSString *)iconName name:(NSString *)name
{
    _informBigView = [[UIImageView alloc]init];
    _informBigView.backgroundColor = [UIColor clearColor];
    _informBigView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_DETAIL, @"details_shopn_bg", ZJProjectLoadImageDefault);

    self.icon = [[UIImageView alloc]init];
    self.icon.layer.cornerRadius = 17;
    self.icon.layer.masksToBounds = YES;
    _icon.image = ZJCURRENTIMAGE(IMAGEFILEPATH_DETAIL, iconName, ZJProjectLoadImageDefault);
    
    self.nameLable = [YBDefaultLabel labelWithFont:SYSTEM_LIGHTFONT(14)
                                              text:name
                                         textColor:ZJCOLOR.color_c0];
    self.nameLable.backgroundColor = [UIColor clearColor];
    
    self.goodspersonBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                                  titleColor:ZJCOLOR.color_c0
                                                                       titleFont:SYSTEM_LIGHTFONT(12)
                                                                   imageFilePath:IMAGEFILEPATH_DETAIL
                                                                                  imageNamed:@""
                                                                            type:ZJProjectButtonSetImage
                                                                                      target:self
                                                                                    selector:nil];
    self.goodspersonBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    self.realNameBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                                  titleColor:ZJCOLOR.color_c0
                                                                    titleFont:SYSTEM_LIGHTFONT(12)
                                                                imageFilePath:IMAGEFILEPATH_DETAIL
                                                                                  imageNamed:@"details_reallyn_icon"
                                                                         type:ZJProjectButtonSetImage
                                                                                      target:self
                                                                                    selector:nil];
    self.realNameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    self.realNameBtn.hidden = YES;

    [_informBigView addSubview:_icon];
    [_informBigView addSubview:_nameLable];
    [_informBigView addSubview:_goodspersonBtn];
    [_informBigView addSubview:_realNameBtn];

    _goodspersonBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _realNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_informBigView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(34), ADJUST_PERCENT_FLOAT(34)));
        make.centerY.mas_equalTo(_informBigView.centerY);
    }];
    
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_informBigView.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.left.mas_equalTo(_icon.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.right.mas_equalTo(_informBigView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(15));
    }];
    
    [_goodspersonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(1));
        make.left.mas_equalTo(_nameLable.mas_left);
        make.bottom.mas_equalTo(_informBigView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(50));
    }];
    
    [_realNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_goodspersonBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.top.mas_equalTo(_goodspersonBtn.mas_top);
        make.bottom.mas_equalTo(_informBigView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(60));
    }];

    return _informBigView;
}

- (YBDefaultLabel *)descLable {
    if (!_descLable) {
        _descLable = [YBDefaultLabel labelWithFont:SYSTEM_LIGHTFONT(12)
                                              text:@""
                                         textColor:ZJCOLOR.color_c0];
        _descLable.backgroundColor = [UIColor clearColor];
        _descLable.numberOfLines = 0;
    }
    return _descLable;
}

- (YBDefaultButton *)colseBtn {
    if (!_colseBtn) {
        _colseBtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                       imageNamed:@"details_off"
                                                             type:ZJProjectButtonSetImage
                                                           target:self
                                                         selector:@selector(clickBtn:)];
        _colseBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
    }
    return _colseBtn;
}

@end
