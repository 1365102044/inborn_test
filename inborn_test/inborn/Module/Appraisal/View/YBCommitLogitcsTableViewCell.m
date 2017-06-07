//
//  YBCommitLogitcsTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCommitLogitcsTableViewCell.h"
#import "YBStringTool.h"
@interface YBCommitLogitcsTableViewCell ()

@property(nonatomic,strong)  UIImageView *goodsImageview;
@property(nonatomic,strong) UILabel * goodsName;
@property(nonatomic,strong) UILabel *goodsDesc;

@property(nonatomic,strong) UIView * line;

@end

@implementation YBCommitLogitcsTableViewCell

- (void)setAppraisalModel:(YBAppraisalModel *)appraisalModel
{
    _appraisalModel  = appraisalModel;
    
    NSString *des;
    if (appraisalModel.VCType == CommitLogitcsType ||
        appraisalModel.VCType == SendAppraisalType ||
        appraisalModel.VCType == DeliverGoodsType) {
        
        [self.goodsImageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, appraisalModel.goodsImage)] placeholderImage:nil];
        des = [NSString stringWithFormat:@"%@",appraisalModel.goodsName];
        
        
    }else if (appraisalModel.VCType == ApplyReturnType){
        _line.hidden = YES;
        [self.goodsImageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, appraisalModel.squareImage)] placeholderImage:nil];
        des = [NSString stringWithFormat:@"%@",appraisalModel.sellerDesc];
    }
    if(des){
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:des];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
        style.lineSpacing = 5;
        [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, des.length)];
        self.goodsName.attributedText = atter;
    }
    
    
    CGFloat goodsNameHei = [self.goodsName.text ex_getSpaceLabelHeightwithSpeace:5
                                                                        withFont:SYSTEM_MEDIUMFONT(14)
                                                                       withWidth:SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(66+12*3)];
    if (goodsNameHei > 50) {
        goodsNameHei = 50;
    }else if (goodsNameHei< 20){
        goodsNameHei = 20;
    }
    [self.goodsName mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(goodsNameHei));
    }];
    
    if (appraisalModel.VCType == AppraisalOrderType) {
        self.goodsDesc.hidden = NO;
        self.goodsDesc.text = [NSString stringWithFormat:@"入库时间: %@",[[YBStringTool share] returnTimeStrformeTimestr: appraisalModel.inDepotTime timestyle:@"yyyy.MM.dd HH:mm"]];
    }
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.goodsImageview = [[UIImageView alloc]init];
        [self addSubview:self.goodsImageview];
        
        self.goodsName = [[UILabel alloc]init];
        self.goodsDesc = [[UILabel alloc]init];
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = ZJCOLOR.color_c16;
        [self addSubview:self.goodsDesc];
        [self addSubview:self.goodsName];
        [self addSubview:self.line];
        self.goodsName.numberOfLines = 2;
        self.goodsName.textColor = ZJCOLOR.color_c4;
        self.goodsDesc.textColor = ZJCOLOR.color_c5;
        self.goodsName.font = SYSTEM_REGULARFONT(14);
        self.goodsDesc.font = SYSTEM_REGULARFONT(12);
        
        [self.goodsImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(12);
            make.top.mas_equalTo(self.mas_top).mas_offset(12);
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(66), ADJUST_PERCENT_FLOAT(66)));
        }];
        [self.goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.goodsImageview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.top.mas_equalTo(self.goodsImageview.mas_top);
            make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
        }];
        
        [self.goodsDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.goodsImageview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.bottom.mas_equalTo(self.goodsImageview.mas_bottom);
            make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(15));
        }];
        
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.bottom.mas_equalTo(self.mas_bottom);
            make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_offset(0.5);
        }];
    }
    return self;
}

@end
