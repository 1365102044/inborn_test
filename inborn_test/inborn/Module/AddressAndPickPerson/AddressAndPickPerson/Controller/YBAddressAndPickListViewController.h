//
//  YBAddressAndPickListViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
@class YBAddressAndPickListViewController;
@class YBAddressAndPickPersonModel;

/**
 addressType,               地址列表
 pickPersonType              提货人列表
 */
typedef NS_ENUM(NSInteger, ViewControllerType) {
    addressType,
    pickPersonType
};

@protocol YBAddressAndPickListViewControllerDelegate <NSObject>

/**
 选中或新增地址回调

 @param addressAndPickListViewController        addressAndPickListViewController
 @param addressModel                            addressModel
 */
- (void)addressAndPickListViewController:(YBAddressAndPickListViewController *)addressAndPickListViewController
                            addressModel:(YBAddressAndPickPersonModel *)addressModel;

@end

@interface YBAddressAndPickListViewController : ZJBaseViewController

/**
 初始化
 */
+ (instancetype)creatAddressAndPickPersonViewControllerWithType:(ViewControllerType)VcType Extend:(id)entend;

/**
 代理
 */
@property (nonatomic, weak) id<YBAddressAndPickListViewControllerDelegate> delegate;



@end
