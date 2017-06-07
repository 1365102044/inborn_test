//
//  YBMessageOrderNewsListTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageOrderNewsListTableViewCell.h"
#import "NSString+Extension.h"
@interface YBMessageOrderNewsListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *backview;
@property (weak, nonatomic) IBOutlet UILabel *logicticsstyleLable;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageview;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLable;
@property (weak, nonatomic) IBOutlet UILabel *orderNmuberLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *goodsNameLableContansheight;
@end

@implementation YBMessageOrderNewsListTableViewCell

- (void)setDataModel:(YBMessageOrderModel *)dataModel
{
    _dataModel  = dataModel;
    
    if (dataModel.modelType == 1) {
        [self.goodsImageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, dataModel.goodsImage)] placeholderImage:[UIImage imageNamed:@""]];
        
    }else if (dataModel.modelType == 2 || dataModel.modelType == 3){
        [self.goodsImageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, dataModel.squareImage)] placeholderImage:[UIImage imageNamed:@""]];
    }
    
    NSString *des = dataModel.msgTitle;
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:des];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, des.length)];
    self.goodsNameLable.attributedText = atter;
    
    CGFloat hei = [des ex_getSpaceLabelHeightwithSpeace:3
                                               withFont:SYSTEM_REGULARFONT(12)
                                              withWidth:(SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12*4+80))];
    self.goodsNameLable.lineBreakMode =  NSLineBreakByCharWrapping;
    
    self.logicticsstyleLable.textColor = ZJCOLOR.color_c15;
    if (dataModel.modelType == 1) {
        if (dataModel.orderStatus == 31||
            dataModel.orderStatus == 32 ||
            dataModel.orderStatus == 40) {
            
            NSString *str1 = dataModel.orderstatusStr;
            NSString *str2 = dataModel.deliveryMerchant;
            NSString *str = [NSString stringWithFormat:@"%@(%@)",str1,str2];
            self.orderNmuberLable.hidden = NO;
            
            if (dataModel.deliveryNum == nil ||
                dataModel.deliveryNum.length == 0) {
                self.orderNmuberLable.hidden = YES;
                str = str1;
            }
            NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:str];
            [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(14) range:NSMakeRange(0, str1.length)];
            [atter addAttribute:NSForegroundColorAttributeName value:
             ZJCOLOR.color_c15 range:NSMakeRange(0, str1.length)];
            [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(12) range:NSMakeRange(str1.length, str.length-str1.length)];
            [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c5 range:NSMakeRange(str1.length,str.length-str1.length)];
            self.logicticsstyleLable.attributedText = atter;
            self.logicticsstyleLable.lineBreakMode = NSLineBreakByTruncatingTail;
            
            self.orderNmuberLable.text = [NSString stringWithFormat:@"运单编号：%@",dataModel.deliveryNum];
            
            if (hei >70) {
                hei = 55;
            }
            self.goodsNameLableContansheight.constant = hei;
            
        }else{
            self.orderNmuberLable.hidden = YES;
            self.logicticsstyleLable.text = dataModel.orderstatusStr;
            self.goodsNameLableContansheight.constant = hei;
        }
    }else{
        
        self.orderNmuberLable.hidden = YES;
        self.logicticsstyleLable.text = dataModel.orderstatusStr;
        self.goodsNameLableContansheight.constant = 80;
        self.logicticsstyleLable.lineBreakMode = NSLineBreakByWordWrapping;
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backview.layer.cornerRadius = 4;
    self.backview.layer.masksToBounds = YES;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"YBMessageOrderNewsListTableViewCell" owner:nil options:nil] lastObject];
    }
    return self;
}

@end
