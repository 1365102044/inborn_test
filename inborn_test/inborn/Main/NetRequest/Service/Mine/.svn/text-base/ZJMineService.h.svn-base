//
//  ZJMineService.h
//  inborn
//
//  Created by 郑键 on 17/3/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface ZJMineService : ZJBaseService

/**
 *  获取我的数据
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMineAccountInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                             fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消首获取我的网络请求
 */
- (void)cancelGetMineAccountInfoNetRequest;


/**
 *  获取绑定信息
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getThridBindingInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  微信解除绑定
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)unBindingWXInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  QQ解除绑定
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)unBindingQQInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;


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
                                     fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  个人信息接口
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getPersonInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock;

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
                            fail:(ZJNetRequestFailureBlock)failBlock;


/**
 *  修改用户头像 (----暂时没有用这个方法)
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)changePersonheaderPicInfoImageArr:(NSArray *)ImageArr
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock;


/**
 *  浏览足迹列表
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getSeeRecordGoodsListDataInfocurPage:(NSInteger)curPage
                                    pageSize:(NSInteger)pageSize
                                     Success:(ZJNetRequestSuccessBlock)successBlock
                                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  喜欢列表
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMyLikeGoodsListDataInfocurPage:(NSInteger)curPage
                                 pageSize:(NSInteger)pageSize
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  提交反馈意见
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)commitFeedBackcontentInfoFeedBackConten:(NSString *)feedbackconten
                                        Success:(ZJNetRequestSuccessBlock)successBlock
                                           fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  退出登录
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)outLoginRequestSuccess:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  实名认证信息查询
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)queryCertInfoSuccess:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  支付记录请求取消
 */
- (void)cancelQueryCertInfoNetRequest;

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
                  fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  支付实名认证国政通请求取消
 */
- (void)cancelDoCertNetRequest;

@end
