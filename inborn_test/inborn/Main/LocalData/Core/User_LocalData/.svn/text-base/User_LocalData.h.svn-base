//
//  User_LocalData.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "Base_LocalData.h"

@interface User_LocalData : Base_LocalData

//** =========================================================================================== */
//** ===========================================用户属性========================================= */
//** =========================================================================================== */


/**
 头像
 */
//@property(nonatomic,copy) NSString * headerimagedata;

/**
 headImage  url
 */
@property (nonatomic, copy) NSString *headImage;

/**
 id
 */
@property (nonatomic, copy) NSString *userId;

/**
 idcardStatus
 */
@property (nonatomic, copy) NSString *idcardStatus;

/**
 isDisable
 */
@property (nonatomic, copy) NSString *isDisable;

/**
 mobile 密文手机号
 */
@property (nonatomic, copy) NSString *mobile;

/**
 明文手机号 登录时候 用到
 */
@property(nonatomic,copy) NSString * realphone;

/**
 nickName
 */
@property (nonatomic, copy) NSString *nickname;

/**
 idCard
 */
@property (nonatomic, copy) NSString *idCard;

/**
 bankCardStatus
 */
@property (nonatomic, copy) NSString *bankCardStatus;

/**
 name
 */
@property (nonatomic, copy) NSString *name;

/**
 openingStatus
 */
@property (nonatomic, copy) NSString *openingStatus;

//** =========================================================================================== */
//** ============================================足迹=========================================== */
//** =========================================================================================== */

//** =========================================================================================== */
//** ===========================================用户搜索========================================= */
//** =========================================================================================== */

/**
 *  保存用户搜索历史
 *
 *  @param searchContent           保存用户搜索历史记录
 */
+ (void)saveUserSearchHistoryLocalDataWithSearchContent:(NSString *)searchContent;

/**
 *  删除历史搜索记录
 *
 *  @param searchHistoryId         历史搜索记录id
 *  @return                        是否删除成功
 */
+ (BOOL)deleteSearchHistoryLoaclDataWithSearchHistoryId:(NSString *)searchHistoryId;

/**
 *  获取用户历史搜索记录
 *
 *  @param userId                  用户id
 *  @return                        用户搜索记录
 */
+ (NSArray *)getUserSearchHigtoryLocalDataWithUserId:(NSString *)userId;

/**
 *  删除所有的历史记录
 *
 *  @return 是否删除成功
 */
+ (BOOL)deleteAllSearchHistoryLocalData;

//** =========================================================================================== */
//** ===========================================用户登录========================================= */
//** =========================================================================================== */

/**
 *  保存tokenId
 *
 *  @param tokenId      tokenId
 *  @return             是否保存成功
 */
+ (BOOL)setTokenId:(NSString *)tokenId;

/**
 *  获取tokenId
 *
 *  @return tokenId
 */
+ (NSString *)getTokenId;

/**
 *  删除tokenId
 */
+ (BOOL)removeTokenId;


/**
 未登录的时候 浏览记录
 */
- (void)setBorwseRecordWhenNoLogin:(NSString *)GoodsId;
/**
 获取 浏览记录
 */
- (NSString *)getBrowseRecordGoodsId;



//** =========================================================================================== */
//** ===========================================用户信息========================================= */
//** =========================================================================================== */

/**
 *  保存用户信息
 *
 *  @param obj 服务器返回用户信息
 */
+ (BOOL)setUserDataWith:(id)obj;

/**
 获取用户信息

 @return 返回用户本地数据对象，可通过属性直接取值
 */
+ (User_LocalData *)getUserData;

/**
 保存用户是否开通钱包的信息

 @param openingStatus openingStatus
 */
+ (void)saveWalletOpeningStatus:(NSString *)openingStatus;

/**
 *  清空用户信息
 */
+ (BOOL)delUserData;

/**
 是否 保存的有手机号
 */
-  (BOOL)isHaveRealphone;
@end
