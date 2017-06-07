//
//  YBAddressAndPickpersonService.h
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBAddressAndPickpersonService : ZJBaseService

/**
 *  获取提货人／收货人列表
 *  @param curPage                 当前页
 *  @param pageSize                每页大小
 *  @param addressType              地址类型：1收货人，2提货人
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getAddressOrPickpersonListInfoWithcurPage:(NSInteger)curPage
                                     pageSize:(NSInteger)pageSize
                                  addressType:(NSString *)addressType
                                      Success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取 获取提货人列表的数据
 */
- (void)cancelGetAddressOrPickpersonListInfoNetRequest;


/**
 *  新增提货人／收货人列表
 参数名	类型	必需	描述
 addrType	string	是	地址类型：1收货人，2提货人
 addrName	string	是	姓名
 addrMobile	string	是	手机号
 addrProv	string	否	省
 addrCity	string	否	市
 addrCounty	string	否	县(区)
 addrDetail	string	否	详细地址
 isDefault	string	否	是否设置为默认（0否，1是）
 addrIdcard	string	否	身份证号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)AddNewAddressOrPickpersonInfoWithaddrName:(NSString *)addrName
                                     addrMobile:(NSString *)addrMobile
                                      addrProv:(NSString *)addrProv
                                      addrCity:(NSString *)addrCity
                                    addrCounty:(NSString *)addrCounty
                                    addrDetail:(NSString *)addrDetail
                                     isDefault:(NSString *)isDefault
                                    addrIdcard:(NSString *)addrIdcard
                                  addrType:(NSString *)addrType
                                      Success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取 获取提货人列表的数据
 */
- (void)cancelGetAddNewAddressOrPickpersonInfoNetRequest;


/**
 *  修改提货人／收货人列表
 参数名	类型	必需	描述
 addrType	string	是	地址类型：1收货人，2提货人
 addrName	string	是	姓名
 addrMobile	string	是	手机号
 addrProv	string	否	省
 addrCity	string	否	市
 addrCounty	string	否	县(区)
 addrDetail	string	否	详细地址
 isDefault	string	否	是否设置为默认（0否，1是）
 addrIdcard	string	否	身份证号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)changeAddressOrPickpersonInfoWithaddrName:(NSString *)addrName
                                       addrMobile:(NSString *)addrMobile
                                         addrProv:(NSString *)addrProv
                                         addrCity:(NSString *)addrCity
                                       addrCounty:(NSString *)addrCounty
                                       addrDetail:(NSString *)addrDetail
                                        isDefault:(NSString *)isDefault
                                       addrIdcard:(NSString *)addrIdcard
                                      addrType:(NSString *)addrType
                                         customId:(NSString *)customId
                                          Success:(ZJNetRequestSuccessBlock)successBlock
                                             fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消修改提货人／收货人列表
 */
- (void)cancelchangeAddressOrPickpersonInfoNetRequest;


/**
 *  设置默认
 id	string	是	地址编号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)setDefaultAddressOrPickpersonInfoWithcustomId:(NSString *)customId
                                          Success:(ZJNetRequestSuccessBlock)successBlock
                                             fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消设置默认
 */
- (void)cancelsetDefaultAddressOrPickpersonInfoNetRequest;


/**
 *  删除提货人／收货人
 id	string	是	地址编号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)deleteAddressOrPickpersonInfoWithcustomId:(NSString *)customId
                                              Success:(ZJNetRequestSuccessBlock)successBlock
                                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消删除提货人／收货人
 */
- (void)canceldeleteAddressOrPickpersonInfoNetRequest;


/**
 *  根据地址编号id 获取收货人/自提人信息
 id	string	是	地址编号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getAddressOrPickpersonInfoWithcustomId:(NSString *)customId
                                          Success:(ZJNetRequestSuccessBlock)successBlock
                                             fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消根据地址编号id 获取收货人/自提人信息
 */
- (void)cancelgetAddressOrPickpersonInfoNetRequest;


@end
