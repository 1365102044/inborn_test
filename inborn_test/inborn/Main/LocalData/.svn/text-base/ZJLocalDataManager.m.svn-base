//
//  ZJLocalDataManager.m
//  Project
//
//  Created by 郑键 on 17/1/24.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJLocalDataManager.h"
#import "User_LocalData.h"
/**
 *  第三方&系统库
 */
#import <FMDB/FMDB.h>

NSString * const t_UserLocalData                     = @"t_UserLocalData";
NSString * const t_UserSearchHistoryData             = @"t_UserSearchHistoryData";
NSString * const t_UserBrowsingHistoryData           = @"t_UserBrowsingHistoryData";
NSString * const t_SystemData                        = @"t_UserBrowsingHistoryData";

@interface ZJLocalDataManager ()
{
    FMDatabase *_db;
}

@end

@implementation ZJLocalDataManager

#pragma mark - 初始化

/**
 获取单利
 
 @return 对象
 */
+ (instancetype)sharedLocalDataManager
{
    static dispatch_once_t onceToken;
    static ZJLocalDataManager *_manager;
    dispatch_once(&onceToken, ^{
        _manager                            = [[ZJLocalDataManager alloc] init];
        [_manager createDataBase];
    });
    return _manager;
}

/**
 创建数据库
 */
- (void)createDataBase
{
    NSString *doc                           = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
    NSString *filePath                      = [doc stringByAppendingPathComponent:@"inborn.db"];
    _db                                     = [FMDatabase databaseWithPath:filePath];
}

/**
 创建表
 
 @param tableName 表名
 @param elements  元素字典数组
 */
- (void)creatTable:(NSString *)tableName
          elements:(NSArray<NSDictionary *> *)elements
{
    if ([_db open]) {
        
        NSMutableString *elementsSqlString;
        [elements enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj,
                                               NSUInteger idx,
                                               BOOL * _Nonnull stop) {
            [elementsSqlString appendString:[NSString stringWithFormat:@"%@ %@ NOT NULL", obj[@"element"], obj[@"type"]]];
            if (idx != elements.count) {
                [elementsSqlString appendString:@", "];
            }
        }];
        
        NSString *sqlString                 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id integer PRIMARY KEY AUTOINCREMENT, %@);", tableName,
                                               elementsSqlString];
        BOOL result                         = [_db executeUpdate:sqlString];
        if (result) {
            YBLog(@"创建成功");
        }else{
            YBLog(@"创建失败");
        }
        [_db close];
    }else{
        YBLog(@"数据库打开失败");
    }
}

#pragma mark - 数据库操作

//** =========================================================================================== */
//** ==========================================用户信息========================================= */
//** =========================================================================================== */

/**
 *  插入用户数据
 */
- (void)insertUserData:(NSString *)userName
{
    if ([_db open]) {
        
        [_db beginTransaction];
        BOOL isRollBack = NO;
        
        @try {
            BOOL result = [_db executeUpdate:@"INSERT INTO t_User_LocalData (xxxx, xxxx) VALUES (?,?);", @"2.0", @"2"];
            if (result) {
                YBLog(@"插入成功");
            }else{
                YBLog(@"插入失败");
            }
            
        } @catch (NSException *exception) {
            isRollBack = YES;
            [_db rollback];
        } @finally {
            if (!isRollBack) {
                [_db commit];
            }
        }
        
        [_db close];
    }else{
        YBLog(@"数据库打开失败");
    }
}

/**
 *  读取用户数据
 *
 *  @return 返回用户模型
 */
- (User_LocalData *)loadUserData
{
    FMResultSet *resultSet = [_db executeQuery:@"SELECT * FROM t_User_LocalData"];
    User_LocalData *user = [[User_LocalData alloc] init];
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
    return user;
}

//** =========================================================================================== */
//** =========================================用户历史搜索======================================== */
//** =========================================================================================== */

/**
 *  插入用户历史搜索数据
 */
- (void)insertUserSearchHistoryData:(NSString *)userSearchHistory
{
    if ([_db open]) {
        
        [_db beginTransaction];
        BOOL isRollBack = NO;
        
        @try {
            BOOL result = [_db executeUpdate:@"INSERT INTO t_UserSearchHistoryData (historySearch) VALUES (?);", userSearchHistory];
            if (result) {
                YBLog(@"插入成功");
            }else{
                YBLog(@"插入失败");
            }
            
        } @catch (NSException *exception) {
            isRollBack = YES;
            [_db rollback];
        } @finally {
            if (!isRollBack) {
                [_db commit];
            }
        }
        
        [_db close];
    }else{
        YBLog(@"数据库打开失败");
    }
}

/**
 *  读取用户历史搜索
 *
 *  @return 返回结果集
 */
- (NSArray *)loadUserSearchHistoryData
{
    FMResultSet *resultSet              = [_db executeQuery:@"SELECT * FROM t_UserSearchHistoryData"];
    NSMutableArray *tempArrayM          = [NSMutableArray array];
    while ([resultSet next]) {
        int ID                          = [resultSet intForColumn:@"id"];
        NSString *historySearch         = [resultSet stringForColumn:@"historySearch"];
        [tempArrayM addObject:@{@"id":[NSString stringWithFormat:@"%zd", ID],
                                @"historySearch":historySearch}];
    }
    return tempArrayM.copy;
}

/**
 *  清除用户历史搜索数据
 *
 *  @param  historyId   用户历史搜索id
 *  @return 删除是否成功
 */
- (BOOL)deleteUserSearchHistoryDataWithId:(NSString *)historyId
{
    if ([_db open]) {
        
        BOOL isRollBack = NO;
        
        @try {
            BOOL result = [_db executeUpdate:@"DELETE FROM t_UserSearchHistoryData id=?;", @(historyId.integerValue)];
            if (result) {
                return YES;
            }else{
                return NO;
            }
            
        } @catch (NSException *exception) {
            isRollBack = YES;
            [_db rollback];
        } @finally {
            
        }
        
        [_db close];
    }else{
        return NO;
    }
}

/**
 *  清除用户所有历史搜索数据
 *
 *  @return 删除是否成功
 */
- (BOOL)deleteUserSearchHistoryData
{
    if ([_db open]) {
        
        BOOL isRollBack = NO;
        
        @try {
            BOOL result = [_db executeUpdate:@"DELETE * FROM t_UserSearchHistoryData;"];
            if (result) {
                return YES;
            }else{
                return NO;
            }
            
        } @catch (NSException *exception) {
            isRollBack = YES;
            [_db rollback];
        } @finally {
            
        }
        
        [_db close];
    }else{
        return NO;
    }
}


@end
