//
//  YBMySellOutStatusViewTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMySellOutStatusViewTableViewCell.h"
#import "YBMySelloutTopstatusImageView.h"
#import "YBTimerManager.h"

@interface YBMySellOutStatusViewTableViewCell ()

@property(nonatomic,strong) YBMySelloutTopstatusImageView * TopStatusImageView;

@property(nonatomic,strong) UILabel * descLable;

@property(nonatomic,assign) double  diffTime;

@end

@implementation YBMySellOutStatusViewTableViewCell

- (void)setDataModel:(YBMySellOutModel *)dataModel
{
    _dataModel = dataModel;
    self.descLable.text = @"";
    self.TopStatusImageView.selloutdeatilModel = dataModel;
    
//    if (dataModel.saleShowStatus == 60||
//        dataModel.saleShowStatus == 61 ||
//        dataModel.saleShowStatus == 62 ||
//        dataModel.saleShowStatus == 63) {
//        
//    }else{
//        self.TopStatusImageView.hidden = NO;
//    }
    
    NSString *str1 = dataModel.statusTitleArr[0];
    NSString *str2;
    if (dataModel.saleShowStatus == 40 ||
        dataModel.saleShowStatus == 41) {
        
        [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(cutdownTimeNumber:)
                                          name:TIMER_NOTIFICATION
                                        object:nil];
        
        self.diffTime = [_dataModel.diffTime doubleValue];
        [[YBTimerManager shareTimer] startTimerWithTimeInterVal:1.0f];
        NSString *str3 =  [self gettimestrWithdifftime:_diffTime];
        str2 = [NSString stringWithFormat:@"买家还有%@来完成本次交易的“确认收货” \n如果期间买家没有“确认收货”，本次交易将自动完成，\n平台将把货款支付给你",str3];
        NSString *str = [NSString stringWithFormat:@"%@\n%@",str1,str2];
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:str];
        NSMutableParagraphStyle *stylepage = [[NSMutableParagraphStyle alloc]init];
        stylepage.lineSpacing = 10;
        [atter addAttribute:NSParagraphStyleAttributeName value:stylepage range:NSMakeRange(0, str.length)];
        [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(22) range:NSMakeRange(0, str1.length)];
        [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(14) range:NSMakeRange(str1.length+1, str2.length)];
        [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c5 range:NSMakeRange(str1.length+5, str3.length)];
        self.descLable.attributedText = atter;
        if (str.length ==0) {
            self.descLable.text = @"";
            return;
        }
    }else if (dataModel.saleShowStatus == 30){
        
        if (dataModel.statusTitleArr.count>0) {
            str2 =  [NSString stringWithFormat:@"已通过%@将商品邮寄给买家",dataModel.deliveryMerchant];
        }
        NSString *str = [NSString stringWithFormat:@"%@\n%@",str1,str2];
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:str];
        NSMutableParagraphStyle *stylepage = [[NSMutableParagraphStyle alloc]init];
        stylepage.lineSpacing = 10;
        [atter addAttribute:NSParagraphStyleAttributeName value:stylepage range:NSMakeRange(0, str.length)];
        [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(22) range:NSMakeRange(0, str1.length)];
        [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(14) range:NSMakeRange(str1.length+1, str2.length)];
        self.descLable.attributedText = atter;
        if (str.length ==0) {
            self.descLable.text = @"";
            return;
        }
    }else{
        
        if (dataModel.statusTitleArr.count>0) {
            str2 = dataModel.statusTitleArr[1];
        }
        NSString *str = [NSString stringWithFormat:@"%@\n%@",str1,str2];
        
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:str];
        NSMutableParagraphStyle *stylepage = [[NSMutableParagraphStyle alloc]init];
        stylepage.lineSpacing = 10;
        [atter addAttribute:NSParagraphStyleAttributeName value:stylepage range:NSMakeRange(0, str.length)];
        [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(22) range:NSMakeRange(0, str1.length)];
        [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(14) range:NSMakeRange(str1.length+1, str2.length)];
        self.descLable.attributedText = atter;
        if (str1.length == 0 || str1 == nil) {
            self.descLable.text = @"";
            return;
        }
    }
    self.TopStatusImageView.hidden = dataModel.isHiddenTopImagBool;
    self.descLable.textAlignment = NSTextAlignmentCenter;
    self.descLable.hidden = NO;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.TopStatusImageView];
        [self addSubview:self.descLable];
    }
    return self;
}

/**
 倒计时通知事件
 */
- (void)cutdownTimeNumber:(NSNotification *)noti
{
    self.diffTime = self.diffTime - 1000;
    NSString *str1 = _dataModel.statusTitleArr[0];
    NSString *str2;
    NSString *str3 =  [self gettimestrWithdifftime:self.diffTime];
    str2 = [NSString stringWithFormat:@"买家还有%@来完成本次交易的“确认收货” \n如果期间买家没有“确认收货”，本次交易将自动完成，\n平台将把货款支付给你",str3];
    NSString *str = [NSString stringWithFormat:@"%@\n%@",str1,str2];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:str];
    NSMutableParagraphStyle *stylepage = [[NSMutableParagraphStyle alloc]init];
    stylepage.lineSpacing = 10;
    [atter addAttribute:NSParagraphStyleAttributeName value:stylepage range:NSMakeRange(0, str.length)];
    [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(22) range:NSMakeRange(0, str1.length)];
    [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(14) range:NSMakeRange(str1.length+1, str2.length)];
    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c5 range:NSMakeRange(str1.length+5, str3.length)];
    self.descLable.attributedText = atter;
    self.descLable.textAlignment = NSTextAlignmentCenter;
    if (self.diffTime <= 0) {
        if (self.refreshDataBlck) {
            self.refreshDataBlck();
        }
        [[YBTimerManager shareTimer] stopTimer];
    }
}

- (NSString *)gettimestrWithdifftime:(double)difftime
{
    //天数
    NSString *days = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60/60/24)];
    //小时数
    NSString *hours = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60/60)%24];
    //分钟数
    NSString *minute = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60)%60];
    //秒数
    //    NSString *second = [NSString stringWithFormat:@"%02ld", ((NSInteger)(difftime))/1000%60];
    
    return [NSString stringWithFormat:@"%@天%@小时%@分",days,hours,minute];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.TopStatusImageView.hidden == YES) {
        self.descLable.frame = CGRectMake(ADJUST_PERCENT_FLOAT(12), 0, SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(24), self.height );
    }else{
        self.TopStatusImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(85));
        self.descLable.frame = CGRectMake(0, self.TopStatusImageView.bottom, SCREEN_WIDTH, self.height - ADJUST_PERCENT_FLOAT(96));
    }
}

- (YBMySelloutTopstatusImageView *)TopStatusImageView {
    if (!_TopStatusImageView) {
        _TopStatusImageView = [YBMySelloutTopstatusImageView loaddeatilTopStatusImageView];
    }
    return _TopStatusImageView;
}

- (UILabel *)descLable {
    if (!_descLable) {
        _descLable = [[UILabel alloc]init];
        _descLable.textColor = ZJCOLOR.color_c4;
        _descLable.numberOfLines = 0;
        _descLable.text = @"";
    }
    return _descLable;
}
- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:@"cutdownTimeNumber" object:nil];
}
@end
