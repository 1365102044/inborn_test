//
//  YBLogisticsTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLogisticsTableViewCell.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "YBStringTool.h"

@interface YBLogisticsTableViewCell ()

@property(strong,nonatomic) YBDefaultLabel *titleLable;
@property(nonatomic,strong) UILabel * descLable;
@property(nonatomic,strong) YBDefaultLabel * timeLable;
@property(nonatomic,strong) UIImageView * leftImageView;
@property(nonatomic,strong) NSIndexPath * cutreenIndexPath;
@property(nonatomic,assign) NSInteger  dataCount;
@property(nonatomic,assign) CGFloat  descHeight;

@end
@implementation YBLogisticsTableViewCell


- (void)setDataRoutsModel:(YBLogitcsRoutesModle *)dataRoutsModel
{
    _dataRoutsModel = dataRoutsModel;
    NSString *descStr;
    if (dataRoutsModel.address) {
        descStr = [NSString stringWithFormat:@"【%@】%@",dataRoutsModel.address,dataRoutsModel.remark];
    }else{
        descStr = [NSString stringWithFormat:@"%@",dataRoutsModel.remark];
    }
    NSData *data = [descStr dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSMutableAttributedString *html = [[NSMutableAttributedString alloc]initWithData:data
                                                               options:options
                                                    documentAttributes:nil
                                                                 error:nil];
    NSMutableParagraphStyle *styleParag = [[NSMutableParagraphStyle alloc]init];
    styleParag.lineSpacing = 5;
    [html addAttribute:NSParagraphStyleAttributeName value:styleParag range:NSMakeRange(0, html.length)];
    
    NSString *phonestr;
    @try {
        if ([descStr containsString:@"联系电话："]) {
            NSRange range = [descStr rangeOfString:@"联系电话："];
            NSInteger index = range.location+range.length;
            phonestr = [descStr substringWithRange:NSMakeRange(index, 11)];
            if ([phonestr ex_isMobileNumber]) {
                [html addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(index, 11)];
                [html addAttribute:NSUnderlineColorAttributeName value:ZJCOLOR.color_c6 range:NSMakeRange(index, 11)];
                [html addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c6 range:NSMakeRange(index, 11)];
            }
        }else if([descStr containsString:@"电话:"]){
            NSRange range = [descStr rangeOfString:@"电话:"];
            NSInteger index = range.location+range.length;
            phonestr = [descStr substringWithRange:NSMakeRange(index, 11)];
            if ([phonestr ex_isMobileNumber]) {
                [html addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(index, 11)];
                [html addAttribute:NSUnderlineColorAttributeName value:ZJCOLOR.color_c6 range:NSMakeRange(index, 11)];
                [html addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c6 range:NSMakeRange(index, 11)];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    self.descLable.attributedText = html;
    self.descLable.font = SYSTEM_REGULARFONT(14);
    self.descHeight =  dataRoutsModel.descHeight;
    self.timeLable.text = dataRoutsModel.time;
    
    if ([phonestr ex_isMobileNumber]) {
        [self.descLable yb_addAttributeTapActionWithStrings:@[phonestr] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
            if (self.clickPhoneBlock) {
                self.clickPhoneBlock(phonestr);
            }
        }];
    }
    if (_cutreenIndexPath.row == 0) {
        self.titleLable.textColor = ZJCOLOR.color_c4;
    }else if (_cutreenIndexPath.row == 1) {
        self.descLable.textColor = ZJCOLOR.color_c6;
    }else{
        self.descLable.textColor = ZJCOLOR.color_c5;
    }
    
    [self layoutSubviews];
}

+ (instancetype)cellwithTableview:(UITableView *)tableView  indexPath:(NSIndexPath *)indexPath dataCount:(NSInteger)dataCount
{
    NSString *ID = [NSString stringWithFormat:@"logictsInformationList%ld",(long)[indexPath row]];
    YBLogisticsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        
        cell = [[YBLogisticsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID indexPath:indexPath dataCount:dataCount];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        while (cell.subviews.lastObject != nil) {
            [cell.subviews.lastObject removeFromSuperview];
        }
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)indexPath dataCount:(NSInteger)dataCount
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        _cutreenIndexPath = indexPath;
        _dataCount = dataCount;
        
        self.titleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                   text:@"物流进度"
                                              textColor:ZJCOLOR.color_c6];
        [self addSubview:self.titleLable];
        
        self.descLable = [[UILabel alloc]init];
        self.descLable.textColor = ZJCOLOR.color_c5;
        self.descLable.font = SYSTEM_REGULARFONT(14);
        self.descLable.numberOfLines = 0;
        [self addSubview:self.descLable];
        
        self.timeLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                   text:@"2012-12-12"
                                              textColor:ZJCOLOR.color_c5];
        [self addSubview:self.timeLable];
        
        self.leftImageView = [[UIImageView alloc]init];
        [self addSubview:self.leftImageView];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = ZJCOLOR.color_c16;
        [self addSubview:self.line];
        
        
        if (indexPath.row == 0) {
            self.titleLable.hidden = NO;
            self.descLable.hidden = YES;
            self.leftImageView.hidden = YES;
            self.timeLable.hidden = YES;
            
            [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
                make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(13));
                make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
                make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            }];
        }else{
    
            self.titleLable.hidden = YES;
            self.descLable.hidden = NO;
            self.leftImageView.hidden = NO;
            self.timeLable.hidden = NO;
            if (indexPath.row == 1) {
                _leftImageView.image = [UIImage imageNamed:@"refund_radio_icon_h"];
            }else{
                _leftImageView.image = [UIImage imageNamed:@"refund_radio_icon_n"];
            }
      
        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
    }];
    
    
    [self.descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_leftImageView.mas_top);
        make.left.mas_equalTo(_leftImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(14));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(_descHeight));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
    }];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_descLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.left.mas_equalTo(_descLable.mas_left);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
    }];
    CGFloat lineLeft = 15;
    if (_cutreenIndexPath.row > 0) {
        lineLeft = _leftImageView.right + ADJUST_PERCENT_FLOAT(14);
    }
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(lineLeft));
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-0.5));
    }];
}

-(void)drawRect:(CGRect)rect
{
    if (_cutreenIndexPath.row==0) {
        return;
    }

    /**
     下端线
     */
    CGFloat topOrginY ;
    CGFloat orginX = _leftImageView.width/2+_leftImageView.left;;
    UIColor *color = ZJCOLOR.color_c12;
    [color set];
     if (_cutreenIndexPath.row >= 1 && _cutreenIndexPath.row < _dataCount){
         topOrginY = _leftImageView.bottom - 5;

         UIBezierPath *path = [UIBezierPath bezierPath];
         path.lineWidth = 0.5;
         [path moveToPoint:CGPointMake(orginX, topOrginY)];
         [path addLineToPoint:CGPointMake(orginX, self.bottom)];
         [path stroke];
    }
    
    /**
     上端线
     */
    CGFloat boomOrignY;
    if (_cutreenIndexPath.row > 1) {
        boomOrignY = _leftImageView.top + 5;

        UIBezierPath *path1 = [UIBezierPath bezierPath];
        path1.lineWidth = 0.5;
        [path1 moveToPoint:CGPointMake(orginX, 0)];
        [path1 addLineToPoint:CGPointMake(orginX,boomOrignY)];
        [path1 stroke];
    }
}
@end
