//
//  YBAppraisalModel.m
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAppraisalModel.h"


@implementation consigneeModel

@end


@implementation YBAppraisalModel

- (consigneeModel *)consigneemodel
{
    return [consigneeModel modelWithDictionary:_consignee];
}

- (CGFloat)addressHeight
{
    NSString *str;
    if (_VCType == DeliverGoodsType) {
        str = [NSString stringWithFormat:@"%@%@%@%@",self.consigneemodel.consigneeProvince,self.consigneemodel.consigneeCity,self.consigneemodel.consigneeCounty,self.consigneemodel.consigneeAddressDetail];
        return  [str ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_LIGHTFONT(13) withWidth:(SCREEN_WIDTH - 66 - 12 *3)];
    }else if (_VCType ==  SendAppraisalType || _VCType == CommitLogitcsType){
        str = [NSString stringWithFormat:@"%@",self.consigneemodel.consigneeAddressDetail];
        return  [str ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_LIGHTFONT(13) withWidth:(SCREEN_WIDTH - 66 - 12 *3)];
    }
    return 20;
}
@end
