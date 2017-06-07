//
//  YBLogitcsCompayAndNumberTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLogitcsCompayAndNumberTableViewCell.h"


@interface YBLogitcsCompayAndNumberTableViewCell ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *logitcscompanytitle;
@property (weak, nonatomic) IBOutlet UILabel *logitcsNumberLable;
@property (weak, nonatomic) IBOutlet UITextField *logitcsTextfield;
@property (weak, nonatomic) IBOutlet UIButton *chooseLogitcsComBtn;

@property(nonatomic,copy) getViewdataBlock getdataBlock;
@property(nonatomic,copy) chooselogitcsBlock chooseLogitcsBlock;
@property(nonatomic,copy) clickSanBtnBlock  clickScanBtnBlcok;

@end

@implementation YBLogitcsCompayAndNumberTableViewCell

- (void)setDefultLogitcsCom:(NSString *)DefultLogitcsCom
{
    _DefultLogitcsCom = DefultLogitcsCom;
    [self.chooselogintcsBtn setTitle:DefultLogitcsCom forState:UIControlStateNormal];
}

- (void)setScanDeliverNumber:(NSString *)ScanDeliverNumber
{
    _ScanDeliverNumber = ScanDeliverNumber;
    self.logitcsTextfield.text = ScanDeliverNumber;
}

- (void)setviewGetDeliverNumblock:(getViewdataBlock)getdataBlock
               chooseLogitcsBlock:(chooselogitcsBlock)chooseLogitcsBlock
                clickScanBtnBlcok:(clickSanBtnBlock)clickScanBtnBlcok
{
    _getdataBlock = getdataBlock;
    _chooseLogitcsBlock = chooseLogitcsBlock;
    _clickScanBtnBlcok = clickScanBtnBlcok;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.logitcscompanytitle.textColor = ZJCOLOR.color_c4;
    self.logitcsNumberLable.textColor = ZJCOLOR.color_c4;
    self.logitcscompanytitle.font = SYSTEM_REGULARFONT(14);
    self.logitcsNumberLable.font = SYSTEM_REGULARFONT(14);
    self.chooselogintcsBtn.titleLabel.font = SYSTEM_REGULARFONT(13);
    [self.chooselogintcsBtn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
    self.logitcsTextfield.textColor = ZJCOLOR.color_c4;
    self.logitcsTextfield.font = SYSTEM_REGULARFONT(14);
    
    self.logitcsTextfield.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.getdataBlock) {
        self.getdataBlock(textField.text);
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"YBLogitcsCompayAndNumberTableViewCell" owner:nil options:nil].lastObject;
    }
    return self;
}


- (IBAction)clickLOogitcsCompany:(id)sender {
    [self.logitcsTextfield resignFirstResponder];
    if (self.chooseLogitcsBlock) {
        self.chooseLogitcsBlock();
    }
}

- (IBAction)clickScanLogitcs:(id)sender {
    if (self.clickScanBtnBlcok) {
        self.clickScanBtnBlcok();
    }
}

@end
