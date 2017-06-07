//
//  YBLikeAndRecordListTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBLikeAndRecordBaseModel.h"

typedef void(^clickCellSubviewBlock)(NSInteger btntag,UIButton *btn, YBLikeAndRecordModel *model);
@interface YBLikeAndRecordListTableViewCell : UITableViewCell

@property(nonatomic,strong) YBLikeAndRecordModel * DataModel;
@property(nonatomic,copy) clickCellSubviewBlock  clickCellBlock;

@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end
