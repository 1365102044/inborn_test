//
//  User_LocalData.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "User_LocalData.h"
#import "ZJLocalDataManager.h"
#import "SFHFKeychainUtils.h"
#import "twlt_uuid_util.h"
#import "MQCustomerServiceManager.h"

#define inborn_token_user_name_key                 @"inborn_token_user_name_key"
#define inborn_token_user_name_key_sever           @"inborn_token_user_name_key_sever"

/**
 搜索 保存的key
 */
static NSString *SEARCHHISTORYRECORDLOCALDATAKEY = @"SEARCHHISTORYRECORDLOCALDATAKEY";

@implementation User_LocalData

//
//- (NSString *)headerimagedata{
//    if (!_headerimagedata) {
//        _headerimagedata = [SYSTEM_USERDEFAULTS objectForKey:@"headerimagedata"];
//    }
//    return _headerimagedata;
//}

- (NSString *)realphone{
    
    if (!_realphone) {
        _realphone = [SYSTEM_USERDEFAULTS objectForKey:@"realphone"];
    }
    return _realphone;
}

- (NSString *)headImage
{
    if (!_headImage) {
        
        /**
         *  本地取值
         */
        _headImage = [SYSTEM_USERDEFAULTS objectForKey:@"headImage"];
    }
    return _headImage;
}

- (NSString *)userId
{
    if (!_userId) {
        
        /**
         *  本地取值
         */
        _userId =  [SYSTEM_USERDEFAULTS objectForKey:@"userId"];
    }
    return _userId;
}

- (NSString *)idcardStatus
{
    if (!_idcardStatus) {
        
        /**
         *  本地取值
         */
        _idcardStatus =  [NSString stringWithFormat:@"%@", [SYSTEM_USERDEFAULTS objectForKey:@"idcardStatus"]];
    }
    return _idcardStatus;
}

- (NSString *)isDisable
{
    if (!_isDisable) {
        
        /**
         *  本地取值
         */
    }
    return _isDisable;
}

- (NSString *)mobile
{
    if (!_mobile) {
        
        /**
         *  本地取值
         */
        _mobile =  [SYSTEM_USERDEFAULTS objectForKey:@"mobile"];
    }
    return _mobile;
}

- (NSString *)nickname
{
    if (!_nickname) {
        
        /**
         *  本地取值
         */
        _nickname =  [SYSTEM_USERDEFAULTS objectForKey:@"nickname"];
    }
    return _nickname;
}

- (NSString *)idCard
{
    if (!_idCard) {
        
        /**
         *  本地取值
         */
        _idCard =  [SYSTEM_USERDEFAULTS objectForKey:@"idCard"];
    }
    return _idCard;
}

- (NSString *)bankCardStatus
{
    if (!_bankCardStatus) {
        
        /**
         *  本地取值
         */
        _bankCardStatus =  [SYSTEM_USERDEFAULTS objectForKey:@"bankCardStatus"];
    }
    return _bankCardStatus;
}

- (NSString *)name
{
    if (!_name) {
        
        /**
         *  本地取值
         */
        _name =  [SYSTEM_USERDEFAULTS objectForKey:@"name"];
    }
    return _name;
}

- (NSString *)openingStatus
{
    if (!_openingStatus) {
        
        /**
         *  本地取值
         */
        _name =  [SYSTEM_USERDEFAULTS objectForKey:@"openingStatus"];
    }
    return _openingStatus;
}

/**
 保存用户搜索历史
 
 @param searchContent           保存用户搜索历史记录
 */
+ (void)saveUserSearchHistoryLocalDataWithSearchContent:(NSString *)searchContent
{
    
    
    NSArray *DataArr = [self getUserSearchHigtoryLocalDataWithUserId:nil];
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:DataArr];
    if ([searchContent containsString:searchContent]) {
        [tempArr removeObject:searchContent];
    }
    [tempArr insertObject:searchContent atIndex:0];
    [SYSTEM_USERDEFAULTS setObject:tempArr forKey:SEARCHHISTORYRECORDLOCALDATAKEY];
}

/**
 获取用户历史搜索记录
 
 @param userId                  用户id
 @return                        用户搜索记录
 */
+ (NSArray *)getUserSearchHigtoryLocalDataWithUserId:(NSString *)userId
{
    return [SYSTEM_USERDEFAULTS objectForKey:SEARCHHISTORYRECORDLOCALDATAKEY];
    return nil;
}

/**
 删除所有搜索记录
 */
+ (BOOL)deleteAllSearchHistoryLocalData
{
    [SYSTEM_USERDEFAULTS removeObjectForKey:SEARCHHISTORYRECORDLOCALDATAKEY];
    if ([self getUserSearchHigtoryLocalDataWithUserId:nil]) return NO;
    else return YES;
    
    return YES;
}

/**
 删除历史搜索记录
 
 @param searchHistoryId         历史搜索记录id
 @return                        是否删除成功
 */
+ (BOOL)deleteSearchHistoryLoaclDataWithSearchHistoryId:(NSString *)searchHistoryId
{
    NSArray *DataArr = [self getUserSearchHigtoryLocalDataWithUserId:nil];
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:DataArr];
    if ([tempArr containsObject:searchHistoryId]) {
        [tempArr removeObject:searchHistoryId];
    }
    [SYSTEM_USERDEFAULTS setObject:tempArr forKey:SEARCHHISTORYRECORDLOCALDATAKEY];
    if ([tempArr containsObject:searchHistoryId]) return NO;
    else return YES;
    return YES;
}

/**
 *  保存tokenId
 *
 *  @param tokenId tokenId
 *  @return 是否保存成功
 */
+ (BOOL)setTokenId:(NSString *)tokenId
{
    /**
     *  拼接本地UUID和服务器tokenid
     */
    NSString *token                     = [NSString stringWithFormat:@"%@%@", twlt_uuid_create(),tokenId];
    [self removeTokenId];
    return [SFHFKeychainUtils storeUsername:inborn_token_user_name_key
                                andPassword:token
                             forServiceName:inborn_token_user_name_key_sever
                             updateExisting:NO
                                      error:nil];
}

/**
 *  获取tokenId
 *
 *  @return tokenId
 */
+ (NSString *)getTokenId
{
    YBLog(@"%@", self);
    
    return [SFHFKeychainUtils getPasswordForUsername:inborn_token_user_name_key
                                      andServiceName:inborn_token_user_name_key_sever
                                               error:nil];
}

/**
 *  删除tokenId
 */
+ (BOOL)removeTokenId
{
    YBLog(@"%@", self);
    
    return [SFHFKeychainUtils deleteItemForUsername:inborn_token_user_name_key
                                     andServiceName:inborn_token_user_name_key_sever
                                              error:nil];
}


/**
 未登录的时候 浏览记录
 */
- (void)setBorwseRecordWhenNoLogin:(NSString *)GoodsId
{
    
}

/**
 获取 浏览记录
 */
- (NSString *)getBrowseRecordGoodsId
{
    NSString *str;
    return str;
}

/**
 保存用户信息
 
 @param obj 服务器返回用户信息
 */
+ (BOOL)setUserDataWith:(id)obj
{
    /**
     *  headImage
     *  id
     *  idcardStatus
     *  isDisable
     *  mobile
     *  nickname
     */
    if (obj[@"mobile"] != nil) {
        
        [SYSTEM_USERDEFAULTS setObject:obj[@"mobile"] forKey:@"mobile"];
    }
    if (obj[@"nickname"] != nil)
    {
        [SYSTEM_USERDEFAULTS setObject:obj[@"nickname"] forKey:@"nickname"];
    }
    if (obj[@"headImage"] != nil) {

        [SYSTEM_USERDEFAULTS setObject:obj[@"headImage"] forKey:@"headImage"];
    }
    NSString *userid = [NSString stringWithFormat:@"%@",obj[@"id"]];
    if ( userid.length != 0 ) {
        [SYSTEM_USERDEFAULTS setObject:obj[@"id"] forKey:@"userId"];
    }
    
    /**
     实名认证 姓名 和 身份证号
     */
    
    [SYSTEM_USERDEFAULTS setObject:obj[@"name"] forKey:@"name"];
    [SYSTEM_USERDEFAULTS setObject:obj[@"idCard"] forKey:@"idCard"];
    [SYSTEM_USERDEFAULTS setObject:obj[@"idcardStatus"] forKey:@"idcardStatus"];
    [SYSTEM_USERDEFAULTS setObject:obj[@"bankCardStatus"] forKey:@"bankCardStatus"];
    
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"loginSuccess" object:nil];
    
    /**
     *  美洽用户数据提交
     */
    
    return NO;
}

/**
 保存用户是否开通钱包的信息
 
 @param openingStatus openingStatus
 */
+ (void)saveWalletOpeningStatus:(NSString *)openingStatus
{
    [SYSTEM_USERDEFAULTS setObject:openingStatus forKey:@"openingStatus"];
}

/**
 获取用户信息
 
 @return 返回用户本地数据对象，可通过属性直接取值
 */
+ (User_LocalData *)getUserData
{
    return [[self alloc] init];
}


/**
 *  清空用户信息
 */
+ (BOOL)delUserData
{
    
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"name"];
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"idCard"];
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"idcardStatus"];
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"bankCardStatus"];
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"headerimagedata"];
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"userId"];
    
    [self removeTokenId];
    return NO;
}

/**
 是否 保存的有手机号
 */
-  (BOOL)isHaveRealphone
{
    if (self.realphone) {
        return YES;
    }
    return NO;
}
@end
