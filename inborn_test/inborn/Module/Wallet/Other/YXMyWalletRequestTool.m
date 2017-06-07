//
//  YXMyWalletRequestTool.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/21.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXMyWalletRequestTool.h"
#import "YXMyWalletMainViewController.h"
#import <SVProgressHUD.h>
//**  钱包直接开户接口 */
static NSString *OPENMYWALLET_URL = @"/api/2.1/wallet/user/open";
//** 钱包的用户 信息 */
static NSString *MYWALLETACCOUNTINFORMAIONT_URL = @"/api/2.1/wallet/user/info";
//** 钱包绑定银行卡列表 */
static NSString *MYWALLETBUNDINGBRANDLIST_URL = @"/api/2.1/wallet/bank/list";
//**  钱包解绑银行卡 */
static NSString *MYWALLETUNBINDBRANKLIST_URL = @"/api/2.1/wallet/bank/unbind";
//**  钱包修改支付密码  */
static NSString *MYWALLETMODIFYPAYPASSWORD_URL = @"/api/2.1/wallet/payPwdModify";
//** 钱包找回支付密码-设置支付密码 */
static NSString *MYWALLETMODIFYPASSWORD_URL = @"/api/2.1/wallet/payPwdSet";
//** 钱包找回支付密码-获取验证码 */
static NSString *RESETPASSWORDSENDMESSAGE_URL = @"/api/2.1/wallet/bankPayPwdSet";
/**
 *  查询银行卡类型
 */
static NSString *CHECKBANKCARDTYPE_URL = @"/api/2.0/cert/bankInfo";

/**
 *  添加银行卡获取验证码
 */
static NSString *ADDBANKCARDOPENAUTH_URL = @"/api/2.1/wallet/bank/openAuth";

/**
 *  添加银行卡验证短信验证码
 */
static NSString *ADDBANKCARDCHECKTOKEN_URL = @"/api/2.1/wallet/bank/authVerify";
//** 重置密码 校验 token */
static NSString *RESETPASSWORDCHECKTOKEN_URL = @"/api/2.1/wallet/payPwdVerify";

/**
 *  提现-验证支付密码
 */
static NSString *WITHDRAWALSCHECKMESSAGECODE_URL = @"/api/2.1/wallet/cashOutT1Apply";

/**
 *  提现-进入界面获取数据
 */
static NSString *QUERYCASHOUTAPPLY_URL = @"/api/2.1/wallet/queryCashOutApply";

/**
 *  钱包-收支明细列表
 */
static NSString *WALLETEXPENSLIST_URL = @"/api/2.1/wallet/expense/list";

/**
 *  钱包-收支明细详情
 */
static NSString *WALLETEXPENSDETAIL_URL = @"/api/2.1/wallet/orderQuery";
//修改证件有效期 发短信 借口
static NSString *CHANGEIDCARDOUTTIMEGETSMSCODE_URL =@"/api/2.1/wallet/smsSend";
//修改证件有效期。 提交数据接口
static NSString *CHANGEIDCARDOUTCOMMITDATA_URL = @"/api/2.1/wallet/user/modifyValid";

//**询实名认证信息**/
static NSString *QUERYRANLNAMESTATUS_URL             =         @"/api/member/queryCertInfo";

@implementation YXMyWalletRequestTool


+(instancetype)sharedTool
{
    static YXMyWalletRequestTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[YXMyWalletRequestTool alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        tool.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
        tool.securityPolicy.allowInvalidCertificates = YES;
        tool.securityPolicy.validatesDomainName = NO;
        
    });
    return tool;
}

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
 * @param oid_job;		//职业类别
 */
-(void)RequestOpenMyWalletWith:(NSString *)name_user
                       pwd_pay:(NSString *)pwd_pay
                     no_idcard:(NSString *)no_idcard
                    exp_idcard:(NSString *)exp_idcard
                type_expidcard:(NSString* )type_expidcard
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
                       failure:(void (^)(NSError *error))failure{
    
    [SVProgressHUD show];
    
    NSDictionary *dict = [NSDictionary dictionary];
    dict = @{
              @"exp_idcard":exp_idcard,
              @"type_expidcard":type_expidcard,
              };
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:dict];
    if (!IsRealName) {
        param[@"name_user"] = name_user;
        param[@"no_idcard"] = no_idcard;
    }
    NSString *URLSTR;
    if ([SourceViewControler isKindOfClass:[YXMyWalletMainViewController class]]){
        param[@"verifyCode"] = SMSCode;
        param[@"token"] =  SMSToken;
        URLSTR = CHANGEIDCARDOUTCOMMITDATA_URL;
    }else{
        param[@"addr_conn"]=addr_conn,
        param[@"addr_pro"]=addr_pro,
        param[@"addr_city"]=addr_city,
        param[@"addr_dist"]=addr_dist,
        param[@"oid_job"] = oid_job;
        param[@"pwd_pay"] = pwd_pay;
        URLSTR = OPENMYWALLET_URL;
    }
    
    [self requestDataWithType:POST url:URLSTR params:param success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

/**
 钱包用户查询接口
 */
-(void)RequestMyWalletAccountInformaionSuccess:(void (^)(id objc, id respodHeader))success
failure:(void (^)(NSError *error))failure{
    
    [SVProgressHUD show];
    [self requestDataWithType:POST url:MYWALLETACCOUNTINFORMAIONT_URL params:nil success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

/**
 钱包绑定银行卡列表
 * @param payType  支付方式
 * @param noAgree  签约编号
 * @param cardNo  银行卡号
 * @param offset  查询偏移量，默认0，必填
 都不用要
 */
-(void)RequestMyBundingBrandListSuccess:(void (^)(id objc, id respodHeader))success
                                failure:(void (^)(NSError *error))failure{

    
    [SVProgressHUD show];
    NSDictionary *param = [NSDictionary dictionary];
    param = @{@"offset":@"0"};
    [self requestDataWithType:POST url:MYWALLETBUNDINGBRANDLIST_URL params:param success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];

}
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
                                  failure:(void (^)(NSError *error))failure{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    NSDictionary *param = [NSDictionary dictionary];
    param = @{@"pwdPay":passWord,
              @"noAgree":noAgree,
              @"payType":payType
              };
    [self requestDataWithType:POST url:MYWALLETUNBINDBRANKLIST_URL params:param success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}




/**
 钱包添加银行卡-查询卡类型
 
 @param success success
 @param failure failure
 */
- (void)checkBankCardTypeWithCardNo:(NSString *)cardNo
                            success:(void (^)(id objc, id respodHeader))success
                            failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    NSDictionary *param = @{@"cardNo":cardNo};
    [self requestDataWithType:POST url:CHECKBANKCARDTYPE_URL params:param success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

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
                                 failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    NSDictionary *dict = @{@"payType":[NSString stringWithFormat:@"%zd", payType],
                           @"cardNo":cardNo,
                           @"bindMob":bindMob};
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:dict];
    if (payType == 3) {
        NSString *validateStr;
        @try {
            validateStr = [NSString stringWithFormat:@"%@%@",
                           [validate componentsSeparatedByString:@"/"].lastObject,
                           [validate componentsSeparatedByString:@"/"].firstObject];
        } @catch (NSException *exception) {
        } @finally {
        }
        [params setObject:validateStr forKey:@"valiDate"];
        [params setObject:cvv2 forKey:@"cvv2"];
    }
    NSString *url;
    if ([type isEqualToString:@"brank"]) {
        url = ADDBANKCARDOPENAUTH_URL;
    }else if ([type isEqualToString:@"password"]) {
        url = RESETPASSWORDSENDMESSAGE_URL;
    }
    
    [self requestDataWithType:POST url:url params:params success:^(id objc, id respodHeader){
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

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
                                 failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    NSDictionary *param = @{@"token":token,
                            @"verifyCode":verifyCode};
    NSString *url ;
    if ([type isEqualToString:@"brank"]) {
        url  =ADDBANKCARDCHECKTOKEN_URL;
    }else if ([type isEqualToString:@"password"]){
        url = RESETPASSWORDCHECKTOKEN_URL;
    }
    [self requestDataWithType:POST url:url params:param success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

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
                             failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    NSDictionary *param = @{@"money_order":moneyOrder,
                            @"infor_order":inforOrder,
                            @"pwd_pay":pwdPay,
                            @"no_agree":noAgre,
                            @"brabank_name":brabankName,
                            @"card_no":cardNo};
    
    [self requestDataWithType:POST url:WITHDRAWALSCHECKMESSAGECODE_URL params:param success:^(id objc, id respodHeader){
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
    
}

/**
 钱包提现页面进入接口
 
 @param success             成功
 @param failure             失败
 */
- (void)queryCashoutApplySuccess:(void (^)(id objc, id respodHeader))success
                         failure:(void (^)(NSError *error))failure
{
    [self requestDataWithType:POST url:QUERYCASHOUTAPPLY_URL params:nil success:^(id objc, id respodHeader){
        
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}


/**
 钱包修改支付密码 
 地址: /api/wallet/payPwdModify
 参数:
 * @param pwdPay  原支付密码，需要用SHA1加密
 * @param pwdPayNew  新支付密码，需要用SHA1加密
 
 重置 setpaypassword
 * @param token  授权码
 * @param pwdPayNew  新支付密码, 需要用SHA1加密
 */
-(void)RequestMyWalletPayPasswordURLWith:(NSString *)pwdPay
                                  pwdPayNew:(NSString *)pwdPayNew
                               currenVCType:(MyAccountPassWordType )currenVCType
                                   token:(NSString *)token
                                    Success:(void (^)(id objc, id respodHeader))success
                                    failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    NSDictionary *param ;
    NSString *url ;
    if (currenVCType == ModifyPayPasswordType) {
        param = @{@"pwdPay":pwdPay,
                  @"pwdPayNew":pwdPayNew
                  };
        url = MYWALLETMODIFYPAYPASSWORD_URL;
    }else if (currenVCType == ResetPayPasswordType){
    
//        param = @{@"token":token,
//                  @"pwdPayNew":[YXStringFilterTool strmethodComma:pwdPayNew]
//                  };
//        url = MYWALLETMODIFYPASSWORD_URL;
    }else if (currenVCType == SetPayPasswordType){
        param = @{@"token":token,
                  @"pwdPayNew":pwdPayNew
                  };
        url = MYWALLETMODIFYPASSWORD_URL;
    }
    
    [self requestDataWithType:POST url:url params:param success:^(id objc, id respodHeader){
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        failure(error);
        [SVProgressHUD dismiss];
    }];
}




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
                                 failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    NSDictionary *params = @{@"curPage":[NSString stringWithFormat:@"%zd", curPage],
                             @"pageSize":[NSString stringWithFormat:@"%zd", pageSize],
                             @"dtStart":dtStartTime ? dtStartTime : @"",
                             @"dtEnd":dtEndTime ? dtEndTime : @""};
    
    [self requestDataWithType:POST url:WALLETEXPENSLIST_URL params:params success:^(id objc, id respodHeader){
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
}

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
                          failure:(void (^)(NSError *error))failure
{
    [SVProgressHUD show];
    NSDictionary *params = @{@"typeDc":[NSString stringWithFormat:@"%zd", typeDc],
                             @"oidPaybill":oidPaybill};
    
    [self requestDataWithType:POST url:WALLETEXPENSDETAIL_URL params:params success:^(id objc, id respodHeader){
        
        [SVProgressHUD dismiss];
        success(objc, respodHeader);
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
    
}

/**
 查询实名认证信息
 */
-(void)RequestQueryRealNameInformationSuccess:(void (^)(id objc, id respodHeader))success failure:(void (^)(NSError *error))failure{
    
    [self requestDataWithType:POST url:QUERYRANLNAMESTATUS_URL params:nil success:^(id objc, id respodHeader){
        
        success(objc, respodHeader);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

/**
 修改证件有效期 --- 发送验证码
 */
-(void)RequestChangeIDCardoutTimeInformationGetSMSCodeSuccess:(void (^)(id objc, id respodHeader))success failure:(void (^)(NSError *error))failure{
    NSDictionary *param = [NSDictionary dictionary];
    param = @{@"flagSend":@"3"};
    [self requestDataWithType:POST url:CHANGEIDCARDOUTTIMEGETSMSCODE_URL params:param success:^(id objc, id respodHeader){
        success(objc, respodHeader);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
