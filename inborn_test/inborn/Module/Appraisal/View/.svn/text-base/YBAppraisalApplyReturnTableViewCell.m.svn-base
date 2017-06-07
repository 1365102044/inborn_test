//
//  YBAppraisalApplyReturnTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAppraisalApplyReturnTableViewCell.h"
#import "MOFSPickerView.h"
#import "YBTopAlert.h"

@interface YBAppraisalApplyReturnTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *returentitleLable;

@property (weak, nonatomic) IBOutlet UIButton *chooseLogitcsTypeBtn;
@property (weak, nonatomic) IBOutlet UILabel *LogitcsInforLable;
@property (weak, nonatomic) IBOutlet UIView *haveinforview;

/**
 没有信息的 空白页
 */
@property (weak, nonatomic) IBOutlet UIView *nohaveinforBlankView;
@property (weak, nonatomic) IBOutlet UIImageView *BlankImageView;
@property (weak, nonatomic) IBOutlet UILabel *blankDescLable;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blankImageW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blankImageH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *blankImageTop;

@property(nonatomic,strong)  clickNotHaveinforBlock clickNotHaveinforBlcok;
@property(nonatomic,copy) clickInforviewBlock  clickInforViewBlock;
@property(nonatomic,copy) chooselogitcsTypeBlock chooselogitcsTypeBlock;

@property(nonatomic,strong) MOFSPickerView * logitcsTypePickerView;

/**
 选中的物流方式
 */
@property(nonatomic,strong) NSString * SelectlogitcsTypeStr;
@end

@implementation YBAppraisalApplyReturnTableViewCell


- (void)setAppraisalModel:(YBAppraisalModel *)appraisalModel
{
    _appraisalModel = appraisalModel;
    
    if (appraisalModel.hasAddress == 1) {
        self.nohaveinforBlankView.hidden = YES;
        NSString *descStr = [NSString stringWithFormat:@"收货人信息 \n%@ %@ \n%@%@%@%@",appraisalModel.addrName,appraisalModel.addrMobile,appraisalModel.addrProv,appraisalModel.addrCity,appraisalModel.addrCounty,appraisalModel.addrDetail];
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:descStr];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
        style.lineSpacing = 5;
        [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, descStr.length)];
        self.LogitcsInforLable.attributedText = atter;
//        CGFloat inforHei = [self.LogitcsInforLable.text ex_getSpaceLabelHeightwithSpeace:5
//                                                                            withFont:SYSTEM_MEDIUMFONT(14)
//                                                                           withWidth:SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(66+12*3)];

    }else{
        self.nohaveinforBlankView.hidden = NO;
        self.blankDescLable.text = ZJSTRING(@"你还没有收货地址，点击这里添加");
        self.BlankImageView.image = [UIImage imageNamed:@"appraisal_order_addaddress_n"];
    }
}

- (void)setAddressOrPickModel:(YBAddressAndPickPersonModel *)addressOrPickModel
{
    _addressOrPickModel =  addressOrPickModel;
    if (addressOrPickModel == nil) {
        [self clearinforNoti];
        return;
    }
    
    self.nohaveinforBlankView.hidden = YES;
    NSString *descStr;
    if ([self.chooseLogitcsTypeBtn.titleLabel.text isEqualToString:@"快递送货"]) {
        descStr = [NSString stringWithFormat:@"收货人信息 \n%@ %@ \n%@%@%@%@",self.addressOrPickModel.addrName,self.addressOrPickModel.addrMobile,self.addressOrPickModel.addrProv,self.addressOrPickModel.addrCity,self.addressOrPickModel.addrCounty,self.addressOrPickModel.addrDetail];
    
    }else if ([self.chooseLogitcsTypeBtn.titleLabel.text isEqualToString:@"来店自提"]){
        if (self.addressOrPickModel.addrIdcard) {
            descStr = [NSString stringWithFormat:@"提货人信息 \n%@ %@ \n%@",self.addressOrPickModel.addrName,self.addressOrPickModel.addrMobile,self.addressOrPickModel.addrIdcard];
        }else{
            descStr = [NSString stringWithFormat:@"提货人信息 \n%@ %@ \n",self.addressOrPickModel.addrName,self.addressOrPickModel.addrMobile];
        }
    }
    if (descStr) {
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:descStr];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
        style.lineSpacing = 5;
        [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, descStr.length)];
        self.LogitcsInforLable.attributedText = atter;
    }
}

- (void)setapplyViewblock:(clickNotHaveinforBlock)clickNotHaveinforBlcok clickInforViewBlock:(clickInforviewBlock)clickInforViewBlock  chooselogitcsTypeBlock:(chooselogitcsTypeBlock)chooselogitcsTypeBlock
{
    _clickNotHaveinforBlcok = clickNotHaveinforBlcok;
    _clickInforViewBlock  = clickInforViewBlock;
    _chooselogitcsTypeBlock = chooselogitcsTypeBlock;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.returentitleLable.textColor = ZJCOLOR.color_c4;
    self.returentitleLable.font = SYSTEM_REGULARFONT(14);
    [self.chooseLogitcsTypeBtn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
    self.chooseLogitcsTypeBtn.titleLabel.font = SYSTEM_REGULARFONT(13);
    self.LogitcsInforLable.textColor = ZJCOLOR.color_c4;
    self.LogitcsInforLable.font = SYSTEM_REGULARFONT(13);
    
    [self.chooseLogitcsTypeBtn setTitle:ZJSTRING(@"快递送货") forState:UIControlStateNormal];
    if (self.SelectlogitcsTypeStr) {
        [self.chooseLogitcsTypeBtn setTitle:ZJSTRING(self.SelectlogitcsTypeStr) forState:UIControlStateNormal];
    }
    
    self.blankImageH.constant = ADJUST_PERCENT_FLOAT(44);
    self.blankImageW.constant = self.blankImageH.constant;
    self.blankImageTop.constant = ADJUST_PERCENT_FLOAT(15);
    
    UITapGestureRecognizer *clicknothavedata = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicknothavedataView:)];
    self.nohaveinforBlankView.userInteractionEnabled = YES;
    [self.nohaveinforBlankView addGestureRecognizer:clicknothavedata];
    
    UITapGestureRecognizer *clickinforview = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickinforView:)];
    self.haveinforview.userInteractionEnabled = YES;
    [self.haveinforview addGestureRecognizer:clickinforview];
    
    
}

- (void)clearinforNoti
{
    if ([_SelectlogitcsTypeStr isEqualToString:@"来店自提"]) {
        self.nohaveinforBlankView.hidden = NO;
        self.blankDescLable.text = ZJSTRING(@"你还没有提货人信息，点击这里添加");
        self.BlankImageView.image = [UIImage imageNamed:@"order_consignee_n"];
    }else{
        self.nohaveinforBlankView.hidden = NO;
        self.blankDescLable.text = ZJSTRING(@"你还没有收货地址，点击这里添加");
        self.BlankImageView.image = [UIImage imageNamed:@"appraisal_order_addaddress_n"];
    }
}
- (void)clickinforView:(UITapGestureRecognizer *)tap
{
    if (self.clickInforViewBlock) {
        self.clickInforViewBlock();
    }
}

- (void)clicknothavedataView:(UITapGestureRecognizer *)tap
{
    if (self.clickNotHaveinforBlcok) {
        self.clickNotHaveinforBlcok();
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"YBAppraisalApplyReturnTableViewCell" owner:nil options:nil].lastObject;
    }
    return self;
}

- (void)chooseLogintcsTypeWith:(NSString *)types
{
    if ([types isEqualToString:@"来店自提"]) {
        if (self.addressOrPickModel && [self.addressOrPickModel.modelType isEqualToString:@"pick"]) {
            
            self.nohaveinforBlankView.hidden = YES;
            NSString *descStr;
            if (self.addressOrPickModel.addrIdcard) {
                descStr = [NSString stringWithFormat:@"提货人信息 \n%@ %@ \n%@",self.addressOrPickModel.addrName,self.addressOrPickModel.addrMobile,self.addressOrPickModel.addrIdcard];
            }else{
                descStr = [NSString stringWithFormat:@"提货人信息 \n%@ %@ \n",self.addressOrPickModel.addrName,self.addressOrPickModel.addrMobile];

            }
            NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:descStr];
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
            style.lineSpacing = 5;
            [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, descStr.length)];
            self.LogitcsInforLable.attributedText = atter;
        }else{
        
            self.nohaveinforBlankView.hidden = NO;
            self.blankDescLable.text = ZJSTRING(@"你还没有提货人信息，点击这里添加");
            self.BlankImageView.image = [UIImage imageNamed:@"order_consignee_n"];
        }
        
    }else{
        NSString *descStr;
        self.nohaveinforBlankView.hidden = YES;
        if (self.addressOrPickModel&&[self.addressOrPickModel.modelType isEqualToString:@"addre"]) {
            descStr = [NSString stringWithFormat:@"收货人信息 \n%@ %@ \n%@%@%@%@",self.addressOrPickModel.addrName,self.addressOrPickModel.addrMobile,self.addressOrPickModel.addrProv,self.addressOrPickModel.addrCity,self.addressOrPickModel.addrCounty,self.addressOrPickModel.addrDetail];
        }else if (self.appraisalModel.hasAddress == 1){
            
            descStr = [NSString stringWithFormat:@"收货人信息 \n%@ %@ \n%@%@%@%@",_appraisalModel.addrName,_appraisalModel.addrMobile,_appraisalModel.addrProv,_appraisalModel.addrCity,_appraisalModel.addrCounty,_appraisalModel.addrDetail];
        }else{
            self.nohaveinforBlankView.hidden = NO;
            self.blankDescLable.text = ZJSTRING(@"你还没有收货地址，点击这里添加");
            self.BlankImageView.image = [UIImage imageNamed:@"appraisal_order_addaddress_n"];
        }
        if (descStr) {
            NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:descStr];
            NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
            style.lineSpacing = 5;
            [atter addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, descStr.length)];
            self.LogitcsInforLable.attributedText = atter;
        }
    }
}

/**
 选择物流方式
 */
-(IBAction)clickChooseLogitcsType:(id)sender {
    [[YBTopAlert sharedAlert] hiddenAlert];
    [self.logitcsTypePickerView showMOFSPickerViewWithDataArray:@[@"快递送货",@"来店自提"]
                                                      commitBlock:^(NSString *string) {
                                                          [self.chooseLogitcsTypeBtn setTitle:ZJSTRING(string) forState:UIControlStateNormal];
                                                          self.SelectlogitcsTypeStr = string;
                                                              if (self.chooselogitcsTypeBlock) {
                                                                  self.chooselogitcsTypeBlock(self.chooseLogitcsTypeBtn.titleLabel.text);
                                                              }
                                                          [self chooseLogintcsTypeWith:string];
                                                          [self.logitcsTypePickerView removeFromSuperview];
                                                      } cancelBlock:^{
                                                          [self.logitcsTypePickerView removeFromSuperview];
                                                      }];
}

/**
 切换信息
 */
- (IBAction)clickChooseInfor:(id)sender {
    
}

/**
 点击空白页
 */
- (IBAction)clickNohaveInforView:(id)sender {
    
}
/**
 物流方式
 */
- (MOFSPickerView *)logitcsTypePickerView {
    if (!_logitcsTypePickerView) {
        _logitcsTypePickerView = [[MOFSPickerView alloc]init];
    }
    return _logitcsTypePickerView;
}
@end
