//
//  YBAddressOrPickpersonViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "YBAddressAndPickListViewController.h"
#import "YBAddressAndPickPersonModel.h"
@class YBAddNewAddressOrPickpersonViewController;

@protocol YBAddNewAddressOrPickpersonViewControllerDelegate <NSObject>

/**
 当独立使用添加地址控制器时，添加地址完成的回调方法

 @param addNewAddressOrPickpersonViewController         addNewAddressOrPickpersonViewController
 @param newAddressModel newAddressModel                 新添加的地址模型
 */
- (void)addNewAddressOrPickpersonViewController:(YBAddNewAddressOrPickpersonViewController *)addNewAddressOrPickpersonViewController
                                newAddressModel:(YBAddressAndPickPersonModel *)newAddressModel;

@end

@interface YBAddNewAddressOrPickpersonViewController : ZJBaseViewController

@property(nonatomic,strong) YBAddressAndPickPersonModel * dataModel;

/**
 初始化
 */
+(instancetype)creatAddNewViewControllerWith:(ViewControllerType)VcType
                                      Extend:(id)Extend;

/**
 代理
 */
@property (nonatomic, weak) id<YBAddNewAddressOrPickpersonViewControllerDelegate> delegate;

@end
