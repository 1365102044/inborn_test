//
//  YBMySellOutStatusViewTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBMySellOutModel.h"

typedef void(^refreshDataWhenTimeCutZoreBlck)();
@interface YBMySellOutStatusViewTableViewCell : UITableViewCell

@property(nonatomic,strong) YBMySellOutModel * dataModel;

@property(nonatomic,copy) refreshDataWhenTimeCutZoreBlck  refreshDataBlck;

@end
