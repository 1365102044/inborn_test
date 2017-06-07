//
//  YBVersionUpgradeView.m
//  inborn
//
//  Created by 刘文强 on 2017/5/4.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBVersionUpgradeView.h"
#import "YBAttributedStringLabel.h"
@interface YBVersionUpgradeView ()

@property (strong ,nonatomic) UIButton *colseBtn;

@property(nonatomic,strong) UIView * BgBigview;

@property(nonatomic,strong) UIImageView * BgImageview;

//@property(nonatomic,strong)  YBAttributedStringLabel* versionNumberLable;

@property(nonatomic,strong) UITextView * VerSionDesc;

@property(nonatomic,strong) UIButton * NowUpdateBtn;
@end

@implementation YBVersionUpgradeView


+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static YBVersionUpgradeView *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YBVersionUpgradeView alloc]init];
    });
    return instance;
}

- (void)setVersionModle:(YBVersionModel *)versionModle
{
    _versionModle = versionModle;
    
    NSString *desc = [NSString stringWithFormat:@"当前的版本：%@\n最新版本：%@\n更新内容：\n%@",versionModle.currenVersion,versionModle.appVersion,versionModle.updateDesc];
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:desc];
    NSMutableParagraphStyle *paragraphStyledesc = [[NSMutableParagraphStyle alloc] init];
    paragraphStyledesc.lineSpacing = 8;
    [attr addAttribute:NSParagraphStyleAttributeName value:paragraphStyledesc range:NSMakeRange(0, [attr length])];
    [attr addAttribute:NSFontAttributeName value:SYSTEM_MEDIUMFONT(14) range:NSMakeRange(0, [attr length])];
    [attr addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c4 range:NSMakeRange(0, [attr length])];
    self.VerSionDesc.attributedText = attr;
    
    if (versionModle.forceUpdate == 2) {
        self.colseBtn.hidden = YES;
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        [self addSubview:self.BgBigview];
        [self addSubview:self.BgImageview];
        [self addSubview:self.colseBtn];
        
        [self.BgBigview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        
        [self.BgImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(281), ADJUST_PERCENT_FLOAT(356)));
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY).mas_offset(ADJUST_PERCENT_FLOAT(-50));
        }];
        
        [self.colseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(33), ADJUST_PERCENT_FLOAT(33)));
            make.top.mas_equalTo(self.BgImageview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(16));
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        
        
        [self.BgImageview addSubview:self.NowUpdateBtn];
        [self.NowUpdateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(44));
            make.left.mas_equalTo(self.BgImageview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(15));
            make.right.mas_equalTo(self.BgImageview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-26));
            make.bottom.mas_equalTo(self.BgImageview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-15));
        }];
        
        [self.BgImageview addSubview:self.VerSionDesc];
        [self.VerSionDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.BgImageview.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(130));
            make.left.mas_equalTo(self.BgImageview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(15));
            make.right.mas_equalTo(self.BgImageview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-15));
            make.bottom.mas_equalTo(self.NowUpdateBtn.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-15));
        }];

    }
    return self;
}

+ (instancetype )showVersionUpgradeVeiwWith:(CGRect)frame
{
    YBVersionUpgradeView *versionview = [[YBVersionUpgradeView alloc]initWithFrame:frame];
    return versionview;
}

/**
 关闭
 */
- (void)clickColseBtn
{
    [self.BgBigview removeFromSuperview];
    [self.BgImageview removeFromSuperview];
    [self.colseBtn removeFromSuperview];
}

/**
 更新btn
 */
- (void)clickNowUpdateBtn
{
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/gb/app/yi-dong-cai-bian/id1174267701?mt=8"] options:@{} completionHandler:nil];
}

#pragma mark  *** 懒加载

/**
 大的灰色背景
 */
- (UIView *)BgBigview {
    if (!_BgBigview) {
        _BgBigview = [[UIView alloc]init];
        _BgBigview.alpha = 0.6;
        _BgBigview.backgroundColor = [UIColor blackColor];
    }
    return _BgBigview;
}

/**
 背景图片
 */
- (UIImageView *)BgImageview {
    if (!_BgImageview) {
        _BgImageview = [[UIImageView alloc]init];
        _BgImageview.image = [UIImage imageNamed:@"versionupUpgrade_bg"];
        _BgImageview.userInteractionEnabled = YES;
    }
    return _BgImageview;
}

/**
 关闭
 */
- (UIButton *)colseBtn {
    if (!_colseBtn) {
        _colseBtn = [[UIButton alloc]init];
        [_colseBtn setImage:[UIImage imageNamed:@"versionUpgrade_colse"] forState:UIControlStateNormal];
        [_colseBtn addTarget:self action:@selector(clickColseBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _colseBtn;
}

/**
 更新文字说明
 */
- (UITextView *)VerSionDesc {
    if (!_VerSionDesc) {
        _VerSionDesc = [[UITextView alloc]init];
    }
    return _VerSionDesc;
}

/**
 立即更新
 */
- (UIButton *)NowUpdateBtn {
    if (!_NowUpdateBtn) {
        _NowUpdateBtn = [[UIButton alloc]init];
        [_NowUpdateBtn addTarget:self action:@selector(clickNowUpdateBtn) forControlEvents:UIControlEventTouchUpInside];
        [_NowUpdateBtn setTitle:ZJSTRING(@"立即更新") forState:UIControlStateNormal];
        [_NowUpdateBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
        _NowUpdateBtn.titleLabel.font = SYSTEM_REGULARFONT(15);
        _NowUpdateBtn.backgroundColor = ZJCOLOR.color_c6;
        _NowUpdateBtn.layer.cornerRadius = 2;
        _NowUpdateBtn.layer.masksToBounds = YES;
    }
    return _NowUpdateBtn;
}

///**
// 版本号
// */
//- (YBAttributedStringLabel *)versionNumberLable {
//    if (!_versionNumberLable) {
//        _versionNumberLable = [YBAttributedStringLabel labelWithFont:SYSTEM_MEDIUMFONT(14)
//                                                                text:@""
//                                                           textColor:ZJCOLOR.color_c4];
//    }
//    return _versionNumberLable;
//}

@end
