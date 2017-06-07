//
//  YBAppraisalApplyReturnTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBAddressAndPickPersonModel.h"
#import "YBAppraisalModel.h"

typedef void(^clickNotHaveinforBlock)();
typedef void(^clickInforviewBlock)();
typedef void(^chooselogitcsTypeBlock)(NSString *types);
@interface YBAppraisalApplyReturnTableViewCell : UITableViewCell

- (void)setapplyViewblock:(clickNotHaveinforBlock)clickNotHaveinforBlcok clickInforViewBlock:(clickInforviewBlock)clickInforViewBlock chooselogitcsTypeBlock:(chooselogitcsTypeBlock)chooselogitcsTypeBlock;
@property (nonatomic, strong) YBAddressAndPickPersonModel * addressOrPickModel;

@property(nonatomic,strong) YBAppraisalModel * appraisalModel;

- (void)clearinforNoti;
@end
