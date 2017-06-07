//
//  YBCommitLogitcsTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBAppraisalModel.h"
@interface YBCommitLogitcsTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@property(nonatomic,strong) YBAppraisalModel * appraisalModel;

@end
