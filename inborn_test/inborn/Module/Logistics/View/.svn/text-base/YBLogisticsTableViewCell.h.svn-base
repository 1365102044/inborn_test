//
//  YBLogisticsTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBLogitcsInforModel.h"

typedef void(^clickPhoneStrBlock)(NSString *phonestr);
@interface YBLogisticsTableViewCell : UITableViewCell


+ (instancetype)cellwithTableview:(UITableView *)tableView
                        indexPath:(NSIndexPath *)indexPath
                        dataCount:(NSInteger)dataCount;

@property(nonatomic,strong) YBLogitcsRoutesModle * dataRoutsModel;
@property(nonatomic,strong) UIView * line;
@property(nonatomic,copy)  clickPhoneStrBlock clickPhoneBlock;

@end
