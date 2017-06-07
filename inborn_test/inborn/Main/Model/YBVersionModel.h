//
//  YBVersionModel.h
//  inborn
//
//  Created by 郑键 on 17/4/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBVersionModel : ZJBaseModel

/**
 isUpdate 1:不需要更新  2:需要更新
 */
@property(nonatomic,assign) NSInteger  isUpdate;

/**
 forceUpdate 是否强制更新:1=否,2=是
 */
@property(nonatomic,assign) NSInteger  forceUpdate;

/**
 appVersion 系统最新版本号
 */
@property(nonatomic,copy) NSString * appVersion;
/**
 更新内容
 */
@property(nonatomic,copy) NSString * updateDesc;
/**
 当前 版本号
 */
@property(nonatomic,copy) NSString * currenVersion;

/**
 补丁版本号
 */
@property (nonatomic, copy) NSString *patchVersion;

/**
 当前补丁版本号
 */
@property (nonatomic, copy) NSString *currentPatchVersion;

@end
