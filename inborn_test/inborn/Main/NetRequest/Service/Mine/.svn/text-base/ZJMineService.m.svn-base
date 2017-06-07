//
//  ZJMineService.m
//  inborn
//
//  Created by 郑键 on 17/3/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJMineService.h"

@interface ZJMineService()
{
    NSURLSessionTask *_mineAccountInfoTask;
    NSURLSessionTask *_queryCertInfoTask;
    NSURLSessionTask *_doCertTask;
}

@end

@implementation ZJMineService

+ (instancetype)share{
    static dispatch_once_t t;
    static ZJMineService *service           = nil;
    dispatch_once(&t, ^{
        service                             = [[ZJMineService alloc] init];
    });
    return service;
}

/**
 *  获取我的数据
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMineAccountInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                             fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:MINE_ACCOUNTINFO_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  取消首获取我的网络请求
 */
- (void)cancelGetMineAccountInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mineAccountInfoTask];
}

/**
 *  获取绑定信息
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getThridBindingInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETCUREENTTHRIDBINDINGINFOR_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  微信解除绑定
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)unBindingWXInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:UNBINDINGWEICHAT_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  QQ解除绑定
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)unBindingQQInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:UNBINDINGQQ_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  修改登录密码
 *  oldPwd	string	是	用户原密码，明文	123111aa
 *  newPwd	string	是	用户新密码，需要使用sha1加密
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)changeLoginPassWordInfoWitholdPwd:(NSString *)oldPwd
                                   newPwd:(NSString *)newPwd
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *parma = [NSMutableDictionary dictionary];
    if (oldPwd) parma[@"oldPwd"] = oldPwd;
    if (newPwd) parma[@"newPwd"] = [newPwd ex_sha1String];
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:CHANGELOGINPASSWORDS_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:parma
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
 *  个人信息接口
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getPersonInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock
{
//    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PERSONINFORMATION_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  修改个人信息接口
 *  nickName	string	否	昵称	哆啦A梦
 *  birthday	string	否	出身日期	1999-01-01
 *  sex	string	否	性别，0为女，1为男	0
 *  email	string	是	邮箱
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)changePersonInfonickName:(NSString *)nickName
                        birthday:(NSString *)birthday
                             sex:(NSInteger )sex
                           email:(NSString *)email
                         Success:(ZJNetRequestSuccessBlock)successBlock
                            fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *parma = [NSMutableDictionary dictionary];
    if (nickName) parma[@"nickName"] = nickName;
    if (birthday) parma[@"birthday"] = birthday;
    if (sex) parma[@"sex"] = [NSString stringWithFormat:@"%ld",sex-1];
    if (email) parma[@"email"] = email;
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:CHANGEPERSONINFORMATION_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:parma
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
 *  修改用户头像 (----暂时没有用这个方法)
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)changePersonheaderPicInfoImageArr:(NSArray *)ImageArr
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] uploadImageWithUrl:CHANGEPERSONHEADERICON_URL
                                                                                                                         parameter:@{}
                                                                                                                            images:ImageArr
                                                                                                                   timeoutInterval:SEVRIES_TIMEOUT successBlock:^(id objc, id requestInfo) {
                                                                                                                       [SVProgressHUD dismiss];
                                                                                                                       [weakSelf handleRequestSuccess:objc
                                                                                                                                         requestModel:requestInfo
                                                                                                                                             sucBlock:successBlock
                                                                                                                                            failBlock:failBlock];
                                                                                                                   } failureBlock:^(id error, id requestInfo) {
                                                                                                                       [SVProgressHUD dismiss];
                                                                                                                       [weakSelf handleRequestFailed:error
                                                                                                                                        requestModel:requestInfo
                                                                                                                                           failBlock:failBlock];                              }];
}

/**
 *  浏览足迹列表
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getSeeRecordGoodsListDataInfocurPage:(NSInteger)curPage
                                    pageSize:(NSInteger)pageSize
                                     Success:(ZJNetRequestSuccessBlock)successBlock
                                        fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (curPage) param[@"curPage"] = @(curPage);
    if (pageSize) param[@"pageSize"] = @(pageSize);
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:MYSEEGOODSRECORDLISTDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  喜欢列表
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMyLikeGoodsListDataInfocurPage:(NSInteger)curPage
                                 pageSize:(NSInteger)pageSize
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (curPage) param[@"curPage"] = @(curPage);
    if (pageSize) param[@"pageSize"] = @(pageSize);

    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LIKEGOODSLISEDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  提交反馈意见
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)commitFeedBackcontentInfoFeedBackConten:(NSString *)feedbackconten
                                        Success:(ZJNetRequestSuccessBlock)successBlock
                                           fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (feedbackconten) param[@"content"] = feedbackconten;
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:FEEDBACK_ACCOUNT_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  退出登录
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)outLoginRequestSuccess:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:OUTLOGIN_ACCOUNT_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  实名认证信息查询
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)queryCertInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _queryCertInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:MINE_QUERY_CERTINFO_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  实名认证查询请求取消
 */
- (void)cancelQueryCertInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_queryCertInfoTask];
}

/**
 *  实名认证国政通
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)doCertWithName:(NSString *)name
                idCard:(NSString *)idCard
         typeExpIdcard:(NSString *)typeExpIdcard
        validPeriodEnd:(NSString *)validPeriodEnd
               success:(ZJNetRequestSuccessBlock)successBlock
                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"name":name ? name : @"",
                              @"idCard":idCard ? idCard : @"",
                              @"typeExpIdcard":typeExpIdcard ? typeExpIdcard : @"",
                              @"validPeriodEnd":validPeriodEnd ? validPeriodEnd : @""};
    
    /**
     *  请求并获取task
     */
    __weak ZJMineService *weakSelf                      = self;
    _doCertTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:MINE_DOCERT_URL
                                                                                                             requestNetworkType:ZJProjectNetRequestPost
                                                                                                                     parameters:parames
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
 *  支付实名认证国政通请求取消
 */
- (void)cancelDoCertNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_doCertTask];
}

@end
