//
//  ZJLocalDataManager.h
//  Project
//
//  Created by 郑键 on 17/1/24.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User_LocalData;

/**
 *  用户信息表
 */
UIKIT_EXTERN NSString * const t_UserLocalData;

/**
 *  用户历史搜索表
 */
UIKIT_EXTERN NSString * const t_UserSearchHistoryData;

/**
 *  用户历史浏览记录表
 */
UIKIT_EXTERN NSString * const t_UserBrowsingHistoryData;

/**
 *  系统信息表
 */
UIKIT_EXTERN NSString * const t_SystemData;

@interface ZJLocalDataManager : NSObject

/**
 *  获取单利
 *
 *  @return 对象
 */
+ (instancetype)sharedLocalDataManager;

/**
 *  创建表
 *
 *  @param tableName 表名
 *  @param elements  元素字典数组
 */
- (void)creatTable:(NSString *)tableName
          elements:(NSArray<NSDictionary *> *)elements;


//** =========================================================================================== */
//** ==========================================用户信息========================================= */
//** =========================================================================================== */

/**
 *  插入用户数据
 */
- (void)insertUserData:(NSString *)userName;

/**
 *  读取用户数据
 *
 *  @return 返回用户模型
 */
- (User_LocalData *)loadUserData;

/**
 *  清除用户数据
 *
 *  @return 删除是否成功
 */
- (BOOL)deleteUserData;

//** =========================================================================================== */
//** =========================================用户历史搜索======================================== */
//** =========================================================================================== */

/**
 *  插入用户历史搜索数据
 */
- (void)insertUserSearchHistoryData:(NSString *)userName;

/**
 *  读取用户历史搜索
 *
 *  @return 返回结果集
 */
- (NSArray *)loadUserSearchHistoryData;

/**
 *  清除用户历史搜索数据
 *
 *  @param  historyId   用户历史搜索id
 *  @return 删除是否成功
 */
- (BOOL)deleteUserSearchHistoryDataWithId:(NSString *)historyId;

/**
 *  清除用户所有历史搜索数据
 *
 *  @return 删除是否成功
 */
- (BOOL)deleteUserSearchHistoryData;


@end
