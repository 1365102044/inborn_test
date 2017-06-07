//
//  YBAddressViewOrPickpersonView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAddressViewOrPickpersonView.h"
#import "UILabel+Extension.h"
@interface YBAddressViewOrPickpersonView ()
@property(nonatomic,assign) ViewControllerType  vcType;
@property(nonatomic,strong) YBDefaultLabel * nameLable;
@property(nonatomic,strong) YBDefaultLabel * phoneLable;
@property(nonatomic,strong) UILabel * descLable;

@property(nonatomic,strong) UIButton * defaultBtn;
@property(nonatomic,strong) YBDefaultButton * editBtn;
@property(nonatomic,strong) YBDefaultButton * deleBtn;

@property(nonatomic,assign) CGFloat  descHEI;

@property(nonatomic,strong) UIView * lineView1;
@property(nonatomic,strong) UIView * lineView2;
@property(nonatomic,strong) YBAddressAndPickPersonModel * dataModel;

@property(nonatomic,assign) NSInteger  indexRow;

@end

@implementation YBAddressViewOrPickpersonView
- (void)setModel:(YBAddressAndPickPersonModel *)dataModel vctype:(ViewControllerType)vctype isselectindex:(NSInteger)isselectindex indexRow:(NSInteger)indexRow
{
    
    _dataModel = dataModel;
    self.indexRow = indexRow;
    
    self.nameLable.text = dataModel.addrName;
    self.phoneLable.text = dataModel.addrMobile;
    
    if (vctype == pickPersonType) {
        self.descLable.text = dataModel.addrIdcard;
    }else if (vctype == addressType){
        NSString *str = [NSString stringWithFormat:@"%@%@%@%@",dataModel.addrProv,dataModel.addrCity,dataModel.addrCounty,dataModel.addrDetail];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
        //调整行距
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
        self.descLable.attributedText = attributedString;
    }
    
    if ( isselectindex > 0) {
        if (isselectindex > 0 && indexRow == isselectindex - 1) {
            [self.defaultBtn setImage:[UIImage imageNamed:@"address_right_h"] forState:UIControlStateNormal];
            [self.defaultBtn setTitleColor:ZJCOLOR.color_c6 forState:UIControlStateNormal];
            NSString *str = @"默认地址";
            if ([dataModel.modelType isEqualToString:@"pick"]) {
                str = @"默认信息";
            }
            [self.defaultBtn setTitle:ZJSTRING(str) forState:UIControlStateNormal];
        }
    }else{
        if (dataModel.isDefault ==1) {
            [self.defaultBtn setImage:[UIImage imageNamed:@"address_right_h"] forState:UIControlStateNormal];
            [self.defaultBtn setTitleColor:ZJCOLOR.color_c6 forState:UIControlStateNormal];
            NSString *str = @"默认地址";
            if ([dataModel.modelType isEqualToString:@"pick"]) {
                str = @"默认信息";
            }
            [self.defaultBtn setTitle:ZJSTRING(str) forState:UIControlStateNormal];
            
        }else{
            [self.defaultBtn setImage:[UIImage imageNamed:@"address_right_n"] forState:UIControlStateNormal];
            [self.defaultBtn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
            [self.defaultBtn setTitle:ZJSTRING(@"设为默认") forState:UIControlStateNormal];
        }
    }
}

/**
 tag:
 10             默认
 11             编辑
 12             删除
 */
- (void)clickBtn:(UIButton *)sender
{
    if (self.clickBlock) {
        self.clickBlock(sender.tag,_dataModel,self.indexRow);
    }
}

- (void)setCellViewWith:(ViewControllerType)type
{
    _vcType = type;
    if (type == addressType) {
        
        _descHEI = 80;
    }else if (type == pickPersonType){
        _descHEI = 30;
    }
    
    self.nameLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:@"test" textColor:ZJCOLOR.color_c4];
    self.phoneLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:@"test" textColor:ZJCOLOR.color_c4];
    //self.descLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:@"test" textColor:ZJCOLOR.color_c4];
    self.descLable = [[UILabel alloc]init];
    self.descLable.textColor =ZJCOLOR.color_c4;
    self.descLable.font = SYSTEM_REGULARFONT(14);
    
 
    self.defaultBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                               titleColor:ZJCOLOR.color_c4
                                                                titleFont:SYSTEM_REGULARFONT(12)
                                                            imageFilePath:@""
                                                               imageNamed:@""
                                                                     type:ZJProjectButtonSetImage
                                                                   target:self
                                                                 selector:@selector(clickBtn:)];
    self.defaultBtn.tag = 10;
    
    self.editBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                               titleColor:ZJCOLOR.color_c4
                                                                titleFont:SYSTEM_REGULARFONT(12)
                                                            imageFilePath:@""
                                                               imageNamed:@""
                                                                     type:ZJProjectButtonSetImage
                                                                   target:self
                                                                 selector:@selector(clickBtn:)];
    self.editBtn.tag = 11;
    self.deleBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                               titleColor:ZJCOLOR.color_c4
                                                                titleFont:SYSTEM_REGULARFONT(12)
                                                            imageFilePath:@""
                                                               imageNamed:@""
                                                                     type:ZJProjectButtonSetImage
                                                                   target:self
                                                                 selector:@selector(clickBtn:)];
    self.deleBtn.tag = 12;
    [self.deleBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [self.defaultBtn setTitle:@"设为默认" forState:UIControlStateNormal];
    
    [self.deleBtn setImage:[UIImage imageNamed:@"address_delete_n"] forState:UIControlStateNormal];
    [self.editBtn setImage:[UIImage imageNamed:@"address_edit_n"] forState:UIControlStateNormal];
    [self.defaultBtn setImage:[UIImage imageNamed:@"address_right_n"] forState:UIControlStateNormal];
    
    self.defaultBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    self.defaultBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    self.editBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.deleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    self.descLable.numberOfLines = 2;
    
    self.phoneLable.textAlignment = NSTextAlignmentRight;
    self.lineView1 = [[UIView alloc]init];
    self.lineView1.backgroundColor = ZJCOLOR.color_c16;
    [self addSubview:self.lineView1];
    
    self.lineView2 = [[UIView alloc]init];
    self.lineView2.backgroundColor = ZJCOLOR.color_c16;
    [self addSubview:self.lineView2];
    
    [self addSubview:self.nameLable];
    [self addSubview:self.phoneLable];
    [self addSubview:self.descLable];
    [self addSubview:self.defaultBtn];
    [self addSubview:self.editBtn];
    [self addSubview:self.deleBtn];
    
    
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat phonehei = ADJUST_PERCENT_FLOAT(20);
    if (_vcType == addressType) {
        phonehei = ADJUST_PERCENT_FLOAT(30);
    }
    [self.phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(120), phonehei));
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(10));
    }];
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.height.mas_equalTo(self.phoneLable.mas_height);
        make.right.mas_equalTo(self.phoneLable.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
    }];
    
    if (_vcType == addressType) {
        [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
    }
    
    [self.descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(_descHEI));
    }];
    
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-42));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
    }];
    
    [self.defaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.top.mas_equalTo(self.lineView2.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(6));
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(80));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(30));
    }];
    
    [self.deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.top.mas_equalTo(self.defaultBtn.mas_top);
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(60));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(30));
    }];
    
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.deleBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-20));
        make.top.mas_equalTo(self.defaultBtn.mas_top);
        make.size.mas_equalTo(self.deleBtn);
    }];
    
    
}
@end
