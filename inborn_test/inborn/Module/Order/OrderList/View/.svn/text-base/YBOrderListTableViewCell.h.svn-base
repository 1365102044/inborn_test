//
//  YBOrderListTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBOrderModel.h"

typedef void(^clickCellSubViewBlock)(NSInteger tag,NSString *btnStr,YBOrderModel *modle, UIButton *sender);
@interface YBOrderListTableViewCell : UITableViewCell

- (void)setDataModel:(YBOrderModel *)dataModel
       OrderListType:(OrderListVcType)OrderListVcType
   clickCellBtnBlock:(clickCellSubViewBlock )clickCellBtnBlock;

@end
