//
//  YXMyWalletRequestTool.h
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/21.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXMyWalletPassWordViewController.h"
#import "YXNetworkTool.h"

@interface YXMyWalletRequestTool : YXNetworkTool

+(instancetype)sharedTool;

/**
 ******** 钱包直接开户接口 *********
 参数:
 * @param name_user 姓名
 * @param pwd_pay 支付密码
 * @param no_idcard  身份证号
 * @param exp_idcard 身份证过期时间(格式YYYYMMDD) , 非永久时必传
 * @param type_expidcard  身份证有效期类型: 0非永久(默认)，1永久
 * @param addr_conn 联系地址
 * @param addr_pro  省级地区编号
 * @param addr_city 市级地区编号
 * @param addr_dist 区级地区编号
 */
-(void)RequestOpenMyWalletWith:(NSString *)name_user
                       pwd_pay:(NSString *)pwd_pay
                     no_idcard:(NSString *)no_idcard
                    exp_idcard:(NSString *)exp_idcard
                type_expidcard:(NSString * )type_expidcard
                     addr_conn:(NSString *)addr_conn
                      addr_pro:(NSString *)addr_pro
                     addr_city:(NSString *)addr_city
                     addr_dist:(NSString *)addr_dist
                       oid_job:(NSString *)oid_job
                       SMSCode:(NSString *)SMSCode
                      SMSToken:(NSString *)SMSToken
                    IsRealName:(BOOL)IsRealName
           SourceViewControler:(UIViewController *)SourceViewControler
                       Success:(void (^)(id objc, id respodHeader))success
                       failure:(void (^)(NSError *error))failure;

/**
 钱包用户查询接口
 */
-(void)RequestMyWalletAccountInformaionSuccess:(void (^)(id objc, id respodHeader))success
                                       failure:(void (^)(NSError *error))failure;

/**
 钱包添加银行卡-查询卡类型
 @param success success
 @param failure failure
 */
- (void)checkBankCardTypeWithCardNo:(NSString *)cardNo
                            success:(void (^)(id objc, id respodHeader))success
                            failure:(void (^)(NSError *error))failure;

/**
 钱包绑定银行卡列表
 * @param payType  支付方式
 * @param noAgree  签约编号
 * @param cardNo  银行卡号
 * @param offset  查询偏移量，默认0，必填
 都不用要
 */
-(void)RequestMyBundingBrandListSuccess:(void (^)(id objc, id respodHeader))success failure:(void (^)(NSError *error))failure;

/**
 钱包解绑银行卡
 * @param noAgree  银通协议编号
 * @param payType  支付方式
 * @param pwdPay  支付密码，需要用SHA1加密
 */
-(void)RequestUnbindBrankListWithPassword:(NSString *)passWord
                                  payType:(NSString *)payType
                                  noAgree:(NSString *)noAgree
                                  Success:(void (^)(id objc, id respodHeader))success
                                  failure:(void (^)(NSError *error))failure;

/**
 钱包添加银行卡-获取短信验证码

 @param payType         支付类型，2表示储蓄卡，3表示信用卡
 @param cardNo          银行卡号
 @param bindMob         绑定手机号
 @param validate        信用卡有效期
 @param cvv2            信用卡背后末三位数字
 @param success         成功
 @param failure         失败
 */
- (void)addBankCardGetMessageWithPayType:(NSInteger)payType
                                  cardNo:(NSString *)cardNo
                                 bindMob:(NSString *)bindMob
                                validate:(NSString *)validate
                                    cvv2:(NSString *)cvv2
                                    type:(NSString *)type
                                 success:(void (^)(id objc, id respodHeader))success
                                 failure:(void (^)(NSError *error))failure;

/**
 钱包添加银行卡-校验短信验证码

 @param token               token
 @param verifyCode          短信验证码
 @param success             成功
 @param failure             失败
 */
- (void)addBankCardCheckMessageWithToken:(NSString *)token
                              verifyCode:(NSString *)verifyCode
                                    type:(NSString *)type
                                 success:(void (^)(id objc, id respodHeader))success
                                 failure:(void (^)(NSError *error))failure;

/**
 钱包用户 T+1 提现申请接口
 
 @param moneyOrder         提现金额
 @param inforOrder         提现原因
 @param pwdPay             支付密码
 @param noAgre             签约协议号
 @param brabankName        银行名称
 @param cardNo             银行卡号
 @param success             成功
 @param failure             失败
 */
- (void)cashoutT1ApplyWithMoneyOrder:(NSString *)moneyOrder
                           infoOrder:(NSString *)inforOrder
                              pwdPay:(NSString *)pwdPay
                              noAgre:(NSString *)noAgre
                         brabankName:(NSString *)brabankName
                              cardNo:(NSString *)cardNo
                              success:(void (^)(id objc, id respodHeader))success
                              failure:(void (^)(NSError *error))failure;

/**
 钱包提现页面进入接口
 
 @param success             成功
 @param failure             失败
 */
- (void)queryCashoutApplySuccess:(void (^)(id objc, id respodHeader))success
                         failure:(void (^)(NSError *error))failure;


/**
 钱包修改支付密码
 地址: /api/wallet/payPwdModify
 参数:
 * @param pwdPay  原支付密码，需要用SHA1加密
 * @param pwdPayNew  新支付密码，需要用SHA1加密
 */
-(void)RequestMyWalletPayPasswordURLWith:(NSString *)pwdPay
                               pwdPayNew:(NSString *)pwdPayNew
                            currenVCType:(MyAccountPassWordType )currenVCType
                                   token:(NSString *)token
                                 Success:(void (^)(id objc, id respodHeader))success
                                 failure:(void (^)(NSError *error))failure;

///**
// 钱包重置支付密码-获取短信验证码
// 
// @param payType         支付类型，2表示储蓄卡，3表示信用卡
// @param cardNo          银行卡号
// @param bindMob         绑定手机号
// @param validate        信用卡有效期
// @param cvv2            信用卡背后末三位数字
// @param success         成功
// @param failure         失败
// */
//-(void)RequestRestPasswordSendMessgeCodeWithPayType:(NSInteger)payType
//                                         cardNo:(NSString *)cardNo
//                                        bindMob:(NSString *)bindMob
//                                       validate:(NSString *)validate
//                                           cvv2:(NSString *)cvv2
//                                        success:(void (^)(id objc, id respodHeader))success
//                                        failure:(void (^)(NSError *error))failure;

/**
 钱包收支明细列表

 @param curPage     当前页
 @param pageSize    页大小
 @param dtStart     开始时间  yyyy-MM-dd
 @param dtEnd       结束时间  yyyy-MM-dd
 @param success     成功
 @param failure     失败
 */
- (void)loadWalletExpenseListWithCurPage:(NSInteger)curPage
                                pageSize:(NSInteger)pageSize
                             dtStartTime:(NSString *)dtStartTime
                               dtEndTime:(NSString *)dtEndTime
                                 success:(void (^)(id objc, id respodHeader))success
                                 failure:(void (^)(NSError *error))failure;

/**
 钱包收支明细详情数据

 @param typeDc      收付标识
                    0：商户 收款（单 业务等）
                    1：商户付款 （商户 提现、批付 提现、批付 业务 等）
                    2：内部收款（用户收款，转账，充值等）
                    3：用户提现
 @param oidPaybill  连连支付支付单号
 @param noOrder     商户唯一订单号
 @param success     成功
 @param failure     回调
 */
- (void)loadOrderDetailWithTypeDc:(NSInteger)typeDc
                       oidPaybill:(NSString *)oidPaybill
                          noOrder:(NSString *)noOrder
                          success:(void (^)(id objc, id respodHeader))success
                          failure:(void (^)(NSError *error))failure;

/**
 查询实名认证信息
 */
-(void)RequestQueryRealNameInformationSuccess:(void (^)(id objc, id respodHeader))success failure:(void (^)(NSError *error))failure;

/**
 修改证件有效期 --- 发送验证码
 */
-(void)RequestChangeIDCardoutTimeInformationGetSMSCodeSuccess:(void (^)(id objc, id respodHeader))success failure:(void (^)(NSError *error))failure;
@end
