//
//  YBAddressAndPickpersonService.m
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAddressAndPickpersonService.h"

@interface YBAddressAndPickpersonService ()
{
    NSURLSessionTask *_addressOrpickInfoTask;
}
@end

@implementation YBAddressAndPickpersonService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBAddressAndPickpersonService *service           = nil;
    dispatch_once(&t, ^{
        service                             = [[YBAddressAndPickpersonService alloc] init];
    });
    return service;
}

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
                                             fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!addressType) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"addressType":!addressType ? @"" : addressType}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"addressType":addressType,
                                                        @"curPage":@(curPage),
                                                        @"pageSize":@(pageSize)};
    
    
    /**
     *  请求并获取task
     */
    __weak YBAddressAndPickpersonService *weakSelf                      = self;
    _addressOrpickInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ADDRESSORPICKPERSONLIST_URL
                                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                                         parameters:params
                                                                                                                    timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                       successBlock:^(id objc, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestSuccess:objc
                                                                                                                                             requestModel:requestInfo
                                                                                                                                                 sucBlock:successBlock
                                                                                                                                                failBlock:failBlock];
                                                                                                                       }
                                                                                                                       failureBlock:^(id error, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestFailed:error
                                                                                                                                            requestModel:requestInfo
                                                                                                                                               failBlock:failBlock];
                                                                                                                       }];
    
}

/**
 *  取消获取 获取提货人列表的数据
 */
- (void)cancelGetAddressOrPickpersonListInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addressOrpickInfoTask];
}


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
                                             fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
   
    /**
     *  配置参数
     */

    NSMutableDictionary *parm = [NSMutableDictionary dictionary];
    parm[@"isDefault"] = isDefault;
    if (addrName) parm[@"addrName"] = addrName;
    if (addrMobile) parm[@"addrMobile"] = addrMobile;
    if (addrProv) parm[@"addrProv"] = addrProv;
    if (addrCity) parm[@"addrCity"] = addrCity;
    if (addrCounty) parm[@"addrCounty"] = addrCounty;
    if (addrDetail) parm[@"addrDetail"] = addrDetail;
    if (addrIdcard) parm[@"addrIdcard"] = addrIdcard;
    if (addrType) parm[@"addrType"] = addrType;
    
    
    /**
     *  请求并获取task
     */
    __weak YBAddressAndPickpersonService *weakSelf                      = self;
    _addressOrpickInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ADDRESSORPICKPERSONADDNEWINFOR_URL
                                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                                         parameters:parm
                                                                                                                    timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                       successBlock:^(id objc, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestSuccess:objc
                                                                                                                                             requestModel:requestInfo
                                                                                                                                                 sucBlock:successBlock
                                                                                                                                                failBlock:failBlock];
                                                                                                                       }
                                                                                                                       failureBlock:^(id error, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestFailed:error
                                                                                                                                            requestModel:requestInfo
                                                                                                                                               failBlock:failBlock];
                                                                                                                       }];
    
    
}

/**
 *  取消获取 获取提货人列表的数据
 */
- (void)cancelGetAddNewAddressOrPickpersonInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addressOrpickInfoTask];
}


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
                                             fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */

    NSMutableDictionary *parm = [NSMutableDictionary dictionary];
    parm[@"isDefault"] = isDefault;
    if (addrName) parm[@"addrName"] = addrName;
    if (addrMobile) parm[@"addrMobile"] = addrMobile;
    if (addrProv) parm[@"addrProv"] = addrProv;
    if (addrCity) parm[@"addrCity"] = addrCity;
    if (addrCounty) parm[@"addrCounty"] = addrCounty;
    if (addrDetail) parm[@"addrDetail"] = addrDetail;
    if (addrIdcard) parm[@"addrIdcard"] = addrIdcard;
    if (addrType) parm[@"addrType"] = addrType;
    if (customId) parm[@"id"] = customId;
    
    /**
     *  请求并获取task
     */
    __weak YBAddressAndPickpersonService *weakSelf                      = self;
    _addressOrpickInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ADDRESSORPICKPERSONCHANGEINFOR_URL
                                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                                         parameters:parm
                                                                                                                    timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                       successBlock:^(id objc, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestSuccess:objc
                                                                                                                                             requestModel:requestInfo
                                                                                                                                                 sucBlock:successBlock
                                                                                                                                                failBlock:failBlock];
                                                                                                                       }
                                                                                                                       failureBlock:^(id error, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestFailed:error
                                                                                                                                            requestModel:requestInfo
                                                                                                                                               failBlock:failBlock];
                                                                                                                       }];
}


/**
 *  取消修改提货人／收货人列表
 */
- (void)cancelchangeAddressOrPickpersonInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addressOrpickInfoTask];
}


/**
 *  设置默认
 id	string	是	地址编号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)setDefaultAddressOrPickpersonInfoWithcustomId:(NSString *)customId
                                              Success:(ZJNetRequestSuccessBlock)successBlock
                                                 fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!customId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"customId":!customId ? @"" : customId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"id":customId};
    
    
    /**
     *  请求并获取task
     */
    __weak YBAddressAndPickpersonService *weakSelf                      = self;
    _addressOrpickInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ADDRESSORPICKPERSONSETDEFAULT_URL
                                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                                         parameters:params
                                                                                                                    timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                       successBlock:^(id objc, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestSuccess:objc
                                                                                                                                             requestModel:requestInfo
                                                                                                                                                 sucBlock:successBlock
                                                                                                                                                failBlock:failBlock];
                                                                                                                       }
                                                                                                                       failureBlock:^(id error, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestFailed:error
                                                                                                                                            requestModel:requestInfo
                                                                                                                                               failBlock:failBlock];
                                                                                                                       }];
    
    
}

/**
 *  取消设置默认
 */
- (void)cancelsetDefaultAddressOrPickpersonInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addressOrpickInfoTask];
}


/**
 *  删除提货人／收货人
 id	string	是	地址编号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)deleteAddressOrPickpersonInfoWithcustomId:(NSString *)customId
                                          Success:(ZJNetRequestSuccessBlock)successBlock
                                             fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!customId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"customId":!customId ? @"" : customId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"id":customId};
    
    
    /**
     *  请求并获取task
     */
    __weak YBAddressAndPickpersonService *weakSelf                      = self;
    _addressOrpickInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ADDRESSORPICKPERSONDELETE_URL
                                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                                         parameters:params
                                                                                                                    timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                       successBlock:^(id objc, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestSuccess:objc
                                                                                                                                             requestModel:requestInfo
                                                                                                                                                 sucBlock:successBlock
                                                                                                                                                failBlock:failBlock];
                                                                                                                       }
                                                                                                                       failureBlock:^(id error, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestFailed:error
                                                                                                                                            requestModel:requestInfo
                                                                                                                                               failBlock:failBlock];
                                                                                                                       }];
}

/**
 *  取消删除提货人／收货人
 */
- (void)canceldeleteAddressOrPickpersonInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addressOrpickInfoTask];
}


/**
 *  根据地址编号id 获取收货人/自提人信息
 id	string	是	地址编号
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getAddressOrPickpersonInfoWithcustomId:(NSString *)customId
                                       Success:(ZJNetRequestSuccessBlock)successBlock
                                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!customId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"customId":!customId ? @"" : customId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"id":customId};
    
    
    /**
     *  请求并获取task
     */
    __weak YBAddressAndPickpersonService *weakSelf                      = self;
    _addressOrpickInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ADDRESSORPICKPERSONGETINFORWITHID_URL
                                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                                         parameters:params
                                                                                                                    timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                       successBlock:^(id objc, id requestInfo) {
                                                                                                                           [SVProgressHUD dismiss];
                                                                                                                           [weakSelf handleRequestSuccess:objc
                                                                                                                                             requestModel:requestInfo
                                                                                                                                                 sucBlock:successBlock
                                                                                                                                                failBlock:failBlock];
                                                                                                                       }
                                                                                                                       failureBlock:^(id error, id requestInfo) {
                                                                                                                           [weakSelf handleRequestFailed:error
                                                                                                                                            requestModel:requestInfo
                                                                                                                                               failBlock:failBlock];
                                                                                                                       }];
}

/**
 *  取消根据地址编号id 获取收货人/自提人信息
 */
- (void)cancelgetAddressOrPickpersonInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addressOrpickInfoTask];
}


@end
