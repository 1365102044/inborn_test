//
//  YBLogitcsCompayAndNumberTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
输入的订单号
 */
typedef void(^getViewdataBlock)(NSString *delivernum);

/**
 选中物流
 */
typedef void(^chooselogitcsBlock)();
/**
 点击扫码
 */
typedef void(^clickSanBtnBlock)();
@interface YBLogitcsCompayAndNumberTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *chooselogintcsBtn;

- (void)setviewGetDeliverNumblock:(getViewdataBlock)getdataBlock
               chooseLogitcsBlock:(chooselogitcsBlock)chooseLogitcsBlock
                clickScanBtnBlcok:(clickSanBtnBlock)clickScanBtnBlcok;

/**
  扫码得到的订单号
 */
@property(nonatomic,strong) NSString * ScanDeliverNumber;
/**
 默认物流公司
 */
@property(nonatomic,strong) NSString * DefultLogitcsCom;
@end
