//
//  YBGoodsDeatilHeaderView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilHeaderView.h"
#import "YBSellerInforView.h"
#import "YBStringTool.h"
#import "User_LocalData.h"
#import "YBAttributedStringLabel.h"
#import "SDPhotoBrowser.h"

/**
 商品图片的最多 9张
 */
static NSInteger GoodsImageCountMax     = 9;
static NSInteger Col                    = 3;
@interface YBGoodsDeatilHeaderView ()<UIScrollViewDelegate,SDPhotoBrowserDelegate>

{
    
    UIImageView *userHeadImageView;
    YBDefaultLabel *nameLable;
    YBSellerInforView *sellerInforView;
    YBAttributedStringLabel *priceLable;
    YBDefaultLabel *goodsDescLable;
    ZJBaseView  *imageBackView;
    CGFloat IMW;
    YBDefaultLabel *recordLable;
    YBDefaultLabel *likeLable;
    ZJBaseView  *likeBackImageView;
    CGFloat HEIGHT;
    
    
    CGFloat descHEI;
}
@property(nonatomic,strong) UIView *userHeaderBackView;
@property (nonatomic, strong) NSArray *imageArr;
@property(nonatomic,strong) NSMutableArray * likeImageArr;
@property (nonatomic, strong) NSMutableArray * likeImageIdArr;
@property(nonatomic,assign) CGFloat  likeIMW;


@property(nonatomic,strong) UIImageView * brandloginimageview;
@property(nonatomic,strong) YBDefaultLabel * brandlable;

@property(nonatomic,strong) YBDefaultButton * moreBtn;
@property(nonatomic,strong) UIImageView *likelistBGimageview;
@property(nonatomic,strong) YBDefaultButton * likebtn;
@property(nonatomic,strong) YBDefaultButton * likelistMoreBtn;
//@property(nonatomic,strong) UIScrollView * likepeopleIconBackView;
@property(nonatomic,strong) UIView * likeiconBackView;
@property(nonatomic,copy) getHeaderViewHeightBlock  HeaderViewHeightBlock;
@property(nonatomic,copy) clickHeaderBtn clickBtnBlock;

@property(nonatomic,assign) NSInteger  IScolect;
@property(nonatomic,strong) NSMutableArray * likeimageviewArr;

@property(nonatomic,assign) BOOL  isshowLikeBGview;

/**
 点击的商品图片
 */
@property(nonatomic,strong) UIImageView * selectGoodsImageView;
@property(nonatomic,strong) NSMutableArray * goodsImageArr;
@property(nonatomic,strong) NSMutableArray * goodsImageUrlArr;
@end

@implementation YBGoodsDeatilHeaderView

/**
 types 1 添加喜欢； 2 取消喜欢
 */
- (void)collectGoodsOrCancleCollectGoodsWith:(NSInteger)types
{
    
    NSString *userId = [NSString stringWithFormat:@"%@",[User_LocalData getUserData].userId];
    NSString *userIcon = [User_LocalData getUserData].headImage;
    if (types == 1) {
        if (![(NSString *)userId ex_isEmpty]) {
            [_likeImageIdArr insertObject:userId atIndex:0];
        }
        if (![userIcon ex_isEmpty]) {
            [_likeImageArr insertObject:userIcon atIndex:0];
        }
        
    }else {
        if (![(NSString *)userId ex_isEmpty]) {
            NSInteger index = [_likeImageIdArr indexOfObject:userId];
            [_likeImageIdArr removeObjectAtIndex:index];
            [_likeImageArr removeObjectAtIndex:index];
        }
    }
    [self setLikeHeaderIconLIst:2];
}

/**
 回调block
 */
- (void)headerViewGetheaderHeight:(getHeaderViewHeightBlock)HeaderViewHeightBlock clickheaderViewBtn:(clickHeaderBtn)clickBtnBlock
{
    self.clickBtnBlock = clickBtnBlock;
    self.HeaderViewHeightBlock = HeaderViewHeightBlock;
}

/**
 赋值
 */
- (void)setDataModel:(YBGoodsDeatilModel *)dataModel
{
    self.likeImageArr = [NSMutableArray array];
    self.likeImageIdArr = [NSMutableArray array];
    _dataModel = dataModel;
    _IScolect = dataModel.isCollect;
    if ([dataModel.MemberModel.headImage isEqualToString:@"default"]) {
        userHeadImageView.image = [[UIImage imageNamed:@"mine_defaultphoto_icon"] ex_drawCircleImage];
    }else {
        [userHeadImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageUrlStringHeaderIcon, dataModel.MemberModel.headImage)] placeholderImage:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
    }
    nameLable.text = dataModel.MemberModel.nickname;
    sellerInforView.dataModel = dataModel;
    
    /**
     价格
     {
     "color" : color,
     "content" : "文字内容",
     "size" : 文字大小,
     "lineSpacing": 行间距
     }
     */
    if (dataModel.boombarType == willStartSellType) {
        priceLable.text = [NSString stringWithFormat:@"¥--"];
        
    }else{
        NSString *pricestr = [[YBStringTool share] strmethodCommaWith:dataModel.mallPrice];
        if (pricestr != nil && pricestr.length != 0) {
            [priceLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c6,
                                                                @"content":@"￥",
                                                                @"size":SYSTEM_REGULARFONT(12),
                                                                @"lineSpacing":@0},
                                                              @{@"color":ZJCOLOR.color_c6,
                                                                @"content":pricestr,
                                                                @"size":SYSTEM_MEDIUMFONT(18),
                                                                @"lineSpacing":@0}]];
        }
    }
    
    priceLable.textAlignment = NSTextAlignmentRight;
    
    NSString *des = [NSString stringWithFormat:@"%@ %@",dataModel.BrandModel.brandCnName,dataModel.sellerDesc];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:des];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, des.length)];
    
    goodsDescLable.attributedText = atter;
    goodsDescLable.hidden = NO;
    
    _imageArr = dataModel.goodsImgs;
    
    for (YBGoodsImagesModel *goodsImagesModel in dataModel.goodsImgs) {
        [self.goodsImageUrlArr addObject: goodsImagesModel.imgUrl];
    }
    likeLable.text = [NSString stringWithFormat:@"%@%ld",ZJSTRING(MINE_HOMEPAGE_USER_LOVE_STRINGKEY),(long)dataModel.countCollection];
    recordLable.text =  [NSString stringWithFormat:@"%@%ld",@"浏览",(long)dataModel.countBrowse];
    descHEI = [goodsDescLable.text ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_MEDIUMFONT(13) withWidth:SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(62+57)];
    
    [self.brandloginimageview sd_setImageWithURL:[NSURL URLWithString:dataModel.BrandModel.blackPic] placeholderImage:ZJCURRENTIMAGE(@"", @"", ZJProjectLoadImageFillet)];
    self.brandlable.text = dataModel.BrandModel.brandCnName;
    
    /**
     商品图
     */
    [self setGoodsImageView];
    /**
     喜欢的人头像
     */
    [self setLikeHeaderIconLIst:1];
    
    [self layoutSubviews];
}

/**
 商品图
 */
- (void)setGoodsImageView
{
    CGFloat imageWith                   = (SCREEN_WIDTH-57-62)/3;
    if (_imageArr.count == 1) {
        imageWith = (SCREEN_WIDTH-57-62);
    }else if(_imageArr.count == 2){
        imageWith = (SCREEN_WIDTH-57-62)/2;
    }
    IMW                                 = imageWith;
    CGFloat colSpace                    = 8;
    CGFloat rowSpace                    = 8;
    NSInteger MAX                       = _imageArr.count> GoodsImageCountMax ? GoodsImageCountMax : _imageArr.count;
    for (int i= 0; i< MAX; i++) {
        UIImageView *imageview          = [[UIImageView alloc]init];
        imageview.tag                   = i+1;
        NSInteger rows                  = i/Col;
        NSInteger cols                  = i%Col;
        CGFloat IMX                     = cols*(imageWith + colSpace);
        CGFloat IMY                     = rows*(imageWith + rowSpace);
        imageview.frame                 = CGRectMake(IMX, IMY, imageWith, imageWith);
        YBGoodsImagesModel *goodsImagesModel = _imageArr[i];
        if ([goodsImagesModel.imgUrl isEqualToString:@"default"]) {
            imageview.image = ZJCURRENTIMAGE(@"", @"", ZJProjectLoadImageFillet);
        }else {
            [imageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringMid, goodsImagesModel.imgUrl)] placeholderImage:ZJCURRENTIMAGE(@"", @"", ZJProjectLoadImageFillet) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                [self.goodsImageArr addObject:imageview.image];
            }];
        }
        imageview.contentMode = UIViewContentModeScaleAspectFill;
        imageview.clipsToBounds = YES;
        imageview.tag = i ;
        imageview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickgoodsImageview:)];
        [imageview addGestureRecognizer:tap];
        [imageBackView addSubview:imageview];
        
    }
    [self layoutSubviews];
}

/**
 喜欢的头像 types 1 初始化赋值 , 2刷新赋值
 */
- (void)setLikeHeaderIconLIst:(NSInteger)types
{
    if (types == 1) {
        if (_dataModel.collections.count == 0|| _dataModel.collections == nil) {
            self.likelistBGimageview.hidden = YES;
            self.isshowLikeBGview = NO;
            [self layoutSubviews];
            return;
        }
        self.isshowLikeBGview = YES;
        for (YBGoodsCollectionsModel *model in _dataModel.collections) {
            [self.likeImageIdArr addObject:model.customId];
            [self.likeImageArr addObject:model.headImage];
        }
    }else{
        if (self.likeImageArr.count == 0) {
            self.likelistBGimageview.hidden = YES;
            self.isshowLikeBGview = NO;
            [self layoutSubviews];
            return;
        }
        self.isshowLikeBGview = YES;
        self.likelistBGimageview.hidden = NO;
    }
    
    _likeIMW                                 = ADJUST_PERCENT_FLOAT(32);
    [_likeiconBackView removeAllSubviews];
    for (int i = 0 ; i < _likeImageArr.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        if ([_likeImageArr[i] isEqualToString:@"default"]) {
            [btn setImage:[UIImage imageNamed:@"mine_defaultphoto_icon"] forState:UIControlStateNormal];
        }else{
            [btn setImageWithURL:_likeImageArr[i]
                        forState:UIControlStateNormal
                     placeholder:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
        }
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = _likeIMW/2;
        btn.clipsToBounds = YES;
        
//        if ((_likeIMW + ADJUST_PERCENT_FLOAT(6)) * i + ADJUST_PERCENT_FLOAT(6) + _likeIMW > _likeiconBackView.width) {
//            
//            return;
//        }
        
        [_likeiconBackView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_likeiconBackView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT((_likeIMW + ADJUST_PERCENT_FLOAT(6))*i + ADJUST_PERCENT_FLOAT(6)));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(_likeIMW), ADJUST_PERCENT_FLOAT(_likeIMW)));
            make.centerY.mas_equalTo(_likeiconBackView.mas_centerY);
        }];
//        
//        if ((_likeIMW + 6)*i + 6 * 2 + _likeIMW  > _likeiconBackView.width  ) {
//            
//        }
        if (_likeiconBackView.width - ((_likeIMW + 6)*i + 6) <=  _likeIMW + 12 ) {
//            return;
            i = (int)_likeImageArr.count;
        }
        
    }
    [self layoutSubviews];
}

/**
 点击商品图片
 */
- (void)clickgoodsImageview:(UITapGestureRecognizer *)tap
{
    self.selectGoodsImageView = (UIImageView *)tap.view;

    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = imageBackView; // 原图的父控件
    browser.imageCount = _goodsImageUrlArr.count; // 图片总数
    browser.currentImageIndex = tap.view.tag;
    browser.delegate = self;
    browser.isHiddenIndexLabelBool = YES;
    [browser show];

}
#pragma mark - photobrowser代理方法
// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return self.goodsImageArr[index] ;
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *urlStr = _goodsImageUrlArr[index];
    return [NSURL URLWithString:urlStr];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
        self.backgroundColor = ZJCOLOR.color_c0;
    }
    return self;
}

- (void)setUI
{
    
    [self addSubview:self.userHeaderBackView];
    
    userHeadImageView                   = [[UIImageView alloc]init];
    userHeadImageView.image             = ZJCURRENTIMAGE(@"",
                                                         @"",
                                                         ZJProjectLoadImageFillet);
    userHeadImageView.layer.masksToBounds = YES;
    userHeadImageView.layer.cornerRadius = ADJUST_PERCENT_FLOAT(17);
    [_userHeaderBackView addSubview:userHeadImageView];
    
    nameLable                           = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                                   text:@""
                                                              textColor:ZJCOLOR.color_c4];
    [self addSubview:nameLable];
    
    sellerInforView                     = [[YBSellerInforView alloc]init];
    [self addSubview:sellerInforView];
    
    priceLable                          = [YBAttributedStringLabel labelWithFont:SYSTEM_MEDIUMFONT(18)
                                                                            text:@""
                                                                       textColor:ZJCOLOR.color_c6];
    priceLable.textAlignment            = NSTextAlignmentRight;
    priceLable.backgroundColor          = [UIColor clearColor];
    [self addSubview:priceLable];
    
    goodsDescLable                      = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13)
                                                                   text:@""
                                                              textColor:ZJCOLOR.color_c4];
    goodsDescLable.numberOfLines        = 0;
    [self addSubview:goodsDescLable];
    goodsDescLable.hidden = YES;
    
    imageBackView                       = [[ZJBaseView alloc]init];
    [self addSubview:imageBackView];
    
    
    [self addSubview:self.brandloginimageview];
    [self addSubview:self.brandlable];
    
    [self addSubview:self.moreBtn];
    [self addSubview:self.likelistBGimageview];
    
    [self.likelistBGimageview addSubview:self.likebtn];
    [self.likelistBGimageview addSubview:self.likeiconBackView];
    [self.likelistBGimageview addSubview:self.likelistMoreBtn];
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _userHeaderBackView.frame = CGRectMake(ADJUST_PERCENT_FLOAT(10),
                                           ADJUST_PERCENT_FLOAT(20),
                                           ADJUST_PERCENT_FLOAT(40),
                                           ADJUST_PERCENT_FLOAT(40));
    
    userHeadImageView.frame = CGRectMake(ADJUST_PERCENT_FLOAT(3),
                                         ADJUST_PERCENT_FLOAT(3),
                                         ADJUST_PERCENT_FLOAT(34),
                                         ADJUST_PERCENT_FLOAT(34));
    
    
    
    priceLable.frame = CGRectMake(ADJUST_PERCENT_FLOAT(100),
                                  _userHeaderBackView.ex_y,
                                  SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(110),
                                  _userHeaderBackView.height);
    nameLable.frame = CGRectMake(_userHeaderBackView.right + ADJUST_PERCENT_FLOAT(ADJUST_PERCENT_FLOAT(10)),
                                 ADJUST_PERCENT_FLOAT(20),
                                 ADJUST_PERCENT_FLOAT(SCREEN_WIDTH-100-10)- _userHeaderBackView.width,
                                 ADJUST_PERCENT_FLOAT(20));
    
    sellerInforView.frame = CGRectMake(nameLable.ex_x,
                                       nameLable.bottom+ADJUST_PERCENT_FLOAT(0),
                                       nameLable.width,
                                       ADJUST_PERCENT_FLOAT(20));
    if (!descHEI) {
        descHEI = ADJUST_PERCENT_FLOAT(25);
    }
    goodsDescLable.frame = CGRectMake(ADJUST_PERCENT_FLOAT(62),
                                      _userHeaderBackView.bottom+ADJUST_PERCENT_FLOAT(10),
                                      ADJUST_PERCENT_FLOAT(SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(57+62)),
                                      descHEI);
    
    CGFloat backimageH;
    CGFloat imageWith                   = (SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(57+62))/3;
    if (_imageArr.count) {
        if (_imageArr.count<=3) {
            if (_imageArr.count == 1) {
                imageWith = (SCREEN_WIDTH-57-62);
            }else if(_imageArr.count == 2){
                imageWith = (SCREEN_WIDTH-57-62)/2;
            }
            backimageH = imageWith;
        }else if (_imageArr.count<=6){
            backimageH = imageWith*2+10;
        }else if (_imageArr.count<=9) {
            backimageH = imageWith*3+20;
        }
    }else {
        backimageH = 0;
    }
    
    imageBackView.frame = CGRectMake(goodsDescLable.ex_x,
                                     goodsDescLable.bottom+ADJUST_PERCENT_FLOAT(10),
                                     goodsDescLable.width,
                                     ADJUST_PERCENT_FLOAT(backimageH+5));
    
    self.brandloginimageview.frame = CGRectMake(imageBackView.left, imageBackView.bottom+ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(30), ADJUST_PERCENT_FLOAT(20));
    self.brandlable.frame = CGRectMake(self.brandloginimageview.right + ADJUST_PERCENT_FLOAT(10), self.brandloginimageview.ex_y, SCREEN_WIDTH - self.brandloginimageview.right - ADJUST_PERCENT_FLOAT(57) - ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(20));
    
    self.moreBtn.frame = CGRectMake(SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(30+12), self.brandloginimageview.ex_y, ADJUST_PERCENT_FLOAT(30), ADJUST_PERCENT_FLOAT(30));
    self.moreBtn.centerY = self.brandloginimageview.centerY;
    self.brandlable.centerY = self.brandloginimageview.centerY;
    
    self.likelistBGimageview.frame = CGRectMake(ADJUST_PERCENT_FLOAT(12), self.brandloginimageview.bottom+ ADJUST_PERCENT_FLOAT(22), SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12*2), ADJUST_PERCENT_FLOAT(56));
    
    self.likebtn.frame = CGRectMake(ADJUST_PERCENT_FLOAT(9), (self.likelistBGimageview.height- ADJUST_PERCENT_FLOAT(22))/2+1, ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22));
    
    self.likelistMoreBtn.frame = CGRectMake(self.likelistBGimageview.width - ADJUST_PERCENT_FLOAT(22 + 9) , self.likebtn.ex_y, ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22));
    
    self.likeiconBackView.frame = CGRectMake(self.likebtn.right+ADJUST_PERCENT_FLOAT(3), ADJUST_PERCENT_FLOAT(2), self.likelistBGimageview.width - self.likebtn.width*2 - ADJUST_PERCENT_FLOAT(30), self.likelistBGimageview.height - ADJUST_PERCENT_FLOAT(2));
    
    
    if (self.isshowLikeBGview) {
        if (self.HeaderViewHeightBlock) {
            self.likelistBGimageview.hidden = NO;
            self.HeaderViewHeightBlock(self.likelistBGimageview.bottom + ADJUST_PERCENT_FLOAT(20));
        }
    }else{
        if (self.HeaderViewHeightBlock) {
            self.likelistBGimageview.hidden = YES;
            self.HeaderViewHeightBlock(self.brandloginimageview.bottom + ADJUST_PERCENT_FLOAT(20));
        }
        
    }
}

- (void)clickBtn:(UIButton *)sender
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender);
    }
}

#pragma mark  *** 懒加载

- (UIView *)userHeaderBackView {
    if (!_userHeaderBackView) {
        _userHeaderBackView = [[UIView alloc]init];
        _userHeaderBackView.layer.cornerRadius = ADJUST_PERCENT_FLOAT(20);
        _userHeaderBackView.layer.masksToBounds = YES;
        _userHeaderBackView.layer.borderWidth = 0.5;
        _userHeaderBackView.layer.borderColor = ZJCOLOR.color_c5.CGColor;
    }
    return _userHeaderBackView;
}

- (UIImageView *)brandloginimageview {
    if (!_brandloginimageview) {
        _brandloginimageview = [[UIImageView alloc]init];
    }
    return _brandloginimageview;
}
- (YBDefaultLabel *)brandlable {
    if (!_brandlable) {
        _brandlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                               text:@""
                                          textColor:ZJCOLOR.color_c5];
    }
    return _brandlable;
}

- (YBDefaultButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn =  [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                       imageNamed:@"detailsB_moreitem"
                                                             type:ZJProjectButtonSetImage
                                                           target:self
                                                         selector:@selector(clickBtn:)];
        _moreBtn.tag = 201;
    }
    return _moreBtn;
}


- (UIImageView *)likelistBGimageview {
    if (!_likelistBGimageview) {
        _likelistBGimageview = [[UIImageView alloc]init];
        //        _likelistBGimageview.image = ZJIMAGE(IMAGEFILEPATH_DETAIL,
        //                                             @"details_likelist_bg",
        //                                             ZJProjectLoadImageDefault).lastObject;
        _likelistBGimageview.image = [UIImage imageNamed:@"details_likelist_bg"];
    }
    return _likelistBGimageview;
}

- (YBDefaultButton *)likebtn
{
    if (!_likebtn) {
        _likebtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                      imageNamed:@"details_like2"
                                                            type:ZJProjectButtonSetImage
                                                          target:self
                                                        selector:nil];
        //        _likebtn.tag = 202;
    }
    return _likebtn;
}

- (YBDefaultButton *)likelistMoreBtn {
    if (!_likelistMoreBtn) {
        _likelistMoreBtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                              imageNamed:@"details_more"
                                                                    type:ZJProjectButtonSetImage
                                                                  target:self
                                                                selector:nil];
    }
    return _likelistMoreBtn;
}

- (UIView *)likeiconBackView {
    if (!_likeiconBackView) {
        _likeiconBackView = [[UIView alloc]init];
    }
    return _likeiconBackView;
}


- (NSMutableArray *)likeImageArr {
    if (!_likeImageArr) {
        _likeImageArr = [NSMutableArray array];
    }
    return _likeImageArr;
}
- (NSMutableArray *)likeImageIdArr
{
    if (!_likeImageIdArr) {
        _likeImageIdArr = [[NSMutableArray alloc]init];
    }
    return _likeImageIdArr;
}

- (NSMutableArray *)goodsImageArr {
    if (!_goodsImageArr) {
        _goodsImageArr = [NSMutableArray array];
    }
    return _goodsImageArr;
}
- (NSMutableArray *)goodsImageUrlArr {
    if (!_goodsImageUrlArr) {
        _goodsImageUrlArr = [NSMutableArray array];
    }
    return _goodsImageUrlArr;
}
@end

