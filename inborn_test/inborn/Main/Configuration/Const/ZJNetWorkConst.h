/**
 *  头文件说明
 *  1、所有网络请求的子URLString
 */

#import <UIKit/UIKit.h>

//** =========================================================================================== */
//** ============================================key=========================================== */
//** =========================================================================================== */

/**
 *  网络请求异常key
 */
UIKIT_EXTERN NSString * const NETREQUEST_ERRORINFO_KEY;

//** =========================================================================================== */
//** ===========================================public========================================== */
//** =========================================================================================== */

/**
 *  查询商品是否加入到喜欢列表
 */
UIKIT_EXTERN NSString *const PUBLICK_ISADDCOLLECTION_URL;

/**
 *  添加收藏
 */
UIKIT_EXTERN NSString *const PUBLICK_ADDCOLLECTION_URL;

/**
 *  添加收藏
 */
UIKIT_EXTERN NSString *const PUBLICK_CANCELCOLLECTION_URL;

/**
 *  版本控制
 */
UIKIT_EXTERN NSString *const PUBLICK_CHECKAPPVERSION_URL;

/**
 *  删除图片
 */
UIKIT_EXTERN NSString *const PUBLICK_DELIMAGE_URL;

//** =========================================================================================== */
//** ==========================================HomePage========================================= */
//** =========================================================================================== */

/**
 *  首页获取分类
 */
UIKIT_EXTERN NSString * const HOMEPAGE_CATEGORIES_URL;

/**
 *  首页获取分类对应列表
 */
UIKIT_EXTERN NSString * const HOMEPAGE_CATEGORYGOODLIST_URL;

/**
 *  公共配置
 */
UIKIT_EXTERN NSString * const PUBLICCONFIGUREINFOR_URL;

//** =========================================================================================== */
//** ============================================发布=========================================== */
//** =========================================================================================== */

/**
 *  发布-商品品牌
 */
UIKIT_EXTERN NSString * const COMPOSE_GOODBRANCE_URL;

/**
 *  发布-发布商品页面数据
 */
UIKIT_EXTERN NSString * const COMPOSE_COMPOSEINFO_URL;

/**
 *  发布-商品图片上传
 */
UIKIT_EXTERN NSString * const COMPOSE_UPLOADIMAGE_URL;

/**
 *  发布-发布商品
 */
UIKIT_EXTERN NSString * const COMPOSE_COMPOSE_URL;

/**
 *  发布-修改商品
 */
UIKIT_EXTERN NSString * const COMPOSE_COMPOSEEDIT_URL;

/**
 *  发布-发布列表
 */
UIKIT_EXTERN NSString * const COMPOSE_COMPOSELIST_URL;

/**
 *  发布-发布列表删除商品
 */
UIKIT_EXTERN NSString * const COMPOSE_DELGOOD_URL;

/**
 *  发布-商品下架
 */
UIKIT_EXTERN NSString * const COMPOSE_OFFSHELVE_URL;

/**
 *  发布-商品顶一下/延期
 */
UIKIT_EXTERN NSString * const COMPOSE_REFRESHGOODTIME_URL;

/**
 *  发布-商品重新上架
 */
UIKIT_EXTERN NSString * const COMPOSE_REFRESHSHELVE_URL;

/**
 *  发布-申请退担保金
 */
UIKIT_EXTERN NSString * const COMPOSE_REFUNDDEPOSIT_URL;

/**
 *  发布-预览
 */
UIKIT_EXTERN NSString * const COMPOSE_PREVIEW_URL;

/**
 *  发布-单个商品接口
 */
UIKIT_EXTERN NSString * const COMPOSE_QUERYGOODS_URL;

//** =========================================================================================== */
//** ==========================================注册登录========================================= */
//** =========================================================================================== */

/**
 *  注册-获取验证码
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_LOADMESSAGECODE_URL;

/**
 *  注册
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_REIGSTER_URL;

/**
 *  登录
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_LOGIN_URL;

/**
 *  快捷登录
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_QUICKLOGIN_URL;

/**
 *  快捷登录-获取验证码
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_QUICKLOGIN_LOADMESSAGECODE_URL;

/**
 *  qq登录
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_QQ_LOGIN_URL;

/**
 *  qq解绑
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_QQ_UNBUNDLED_URL;

/**
 *  微信登录
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_WECHAT_LOGIN_URL;

/**
 *  微信解绑
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_WECHAT_UNBUNDLED_URL;

/**
 *  忘记密码获取验证码
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_FORGETPWD_LOADMESSAGECODE_URL;

/**
 *  忘记密码第一步
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_FORGETPWD_FIRST_URL;

/**
 *  忘记密码第二步
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_FORGETPWD_SECOND_URL;

/**
 *  第三方登录-校验手机号
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_VERPHONENUMBER_URL;

/**
 *  第三方登录-未注册绑定
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_NEVERREGISTERBINDING_URL;

/**
 *  第三方登录-获取验证码
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_THIRD_LOADMESSAGECODE_URL;

/**
 *  第三方登录-已注册绑定
 */
UIKIT_EXTERN NSString * const LOGINANDREGISTER_ALREADYREIGSTERBINDING_URL;

//** =========================================================================================== */
//** ============================================搜索=========================================== */
//** =========================================================================================== */

/**
 *  搜索
 */
UIKIT_EXTERN NSString * const SEARCH_GOODLIST_URL;

//** =========================================================================================== */
//** ============================================Mine=========================================== */
//** =========================================================================================== */

/**
 *  我的主页数据
 */
UIKIT_EXTERN NSString * const MINE_ACCOUNTINFO_URL;

/**
 退出登录
 */
UIKIT_EXTERN NSString *const OUTLOGIN_ACCOUNT_URL;

/**
 意见反馈
 */
UIKIT_EXTERN NSString *const FEEDBACK_ACCOUNT_URL;

/**
 实名认证结果查询
 */
UIKIT_EXTERN NSString *const MINE_QUERY_CERTINFO_URL;

/**
 实名认证国政通
 */
UIKIT_EXTERN NSString *const MINE_DOCERT_URL;

//** =========================================================================================== */
//** ============================================GoodsDeatil=========================================== */
//** =========================================================================================== */

/**
 商品详情A（大图模式）
 */
UIKIT_EXTERN NSString *const GOODS_DEATIL_BIGIMAGE_URL;

/**
 商品详情B（详细）
 */
UIKIT_EXTERN NSString *const GOODS_DEATIL_URL;

/**
 添加关注
 */
UIKIT_EXTERN NSString *const GOODS_ADDCOLLECT_URL;

/**
 取消关注
 */
UIKIT_EXTERN NSString *const GOODS_CANCLECOLLECT_URL;

/**
 猜你喜欢
 */
UIKIT_EXTERN NSString *const GUESSGOODSLISTDATA_URL;


//** =========================================================================================== */
//** ============================================address/pickperson=========================================== */
//** =========================================================================================== */

/**
 地址／提货人列表
 */
UIKIT_EXTERN NSString *const ADDRESSORPICKPERSONLIST_URL;

/**
 新增 地址／提货人
 */
UIKIT_EXTERN NSString *const ADDRESSORPICKPERSONADDNEWINFOR_URL;

/**
 修改 地址／提货人
 */
UIKIT_EXTERN NSString *const ADDRESSORPICKPERSONCHANGEINFOR_URL;

/**
 设置默认 地址／提货人
 */
UIKIT_EXTERN NSString *const ADDRESSORPICKPERSONSETDEFAULT_URL;


/**
 删除 地址／提货人
 */
UIKIT_EXTERN NSString *const ADDRESSORPICKPERSONDELETE_URL;

/**
 根据地址编号id 获取收货人/自提人信息
 */
UIKIT_EXTERN NSString *const ADDRESSORPICKPERSONGETINFORWITHID_URL;

//** =========================================================================================== */
//** ============================================order========================================== */
//** =========================================================================================== */

/**
 *  订单-确认订单
 */
UIKIT_EXTERN NSString * const ORDER_CONFIRM_URL;

/**
 *  订单-生成
 */
UIKIT_EXTERN NSString * const ORDER_CREAT_URL;

/**
 我买到的订单列表
 */
UIKIT_EXTERN NSString *const MYBUYORDERLISTDATA_URL;

/**
 *  订单-订单详情
 */
UIKIT_EXTERN NSString *const ORDER_ORDERDETAIL_URL;

/**
 申请退款接口
 */
UIKIT_EXTERN NSString *const COMMITAPPLYREFUNDDATA_URL;

/**
 查看退款详情接口
 */
UIKIT_EXTERN NSString *const GETREFUNDDEATILINFORTIONDATA_URL;

/**
 物流详情信息
 */
UIKIT_EXTERN NSString *const GETLOGICSTICSINFORMATION_URL;

/**
 我的物品的 单独 物流详情信息
 */
UIKIT_EXTERN NSString *const GETMYGOODSLOGICSTICSINFORMATION_URL;

/**
 *  订单-取消订单
 */
UIKIT_EXTERN NSString *const ORDER_CANCEL_URL;

/**
 *  订单-设置身份证号
 */
UIKIT_EXTERN NSString *const ORDER_SETIDCARD_URL;

/**
 *  订单-修改支付方式
 */
UIKIT_EXTERN NSString *const ORDER_CHANGEPAYMENTTYPE_URL;

/**
 确认收货
 */
UIKIT_EXTERN NSString *const CONFIRMRECEIPTGOODS_URL;


/**
 支付记录
 */
UIKIT_EXTERN NSString *const PAYMENTROCERDLISTDATA_URL;

//** =========================================================================================== */
//** ============================================pay=========================================== */
//** =========================================================================================== */

/**
 *  支付-支付信息
 */
UIKIT_EXTERN NSString * const PAY_PAYINFO_URL;

/**
 *  支付-预支付请求
 */
UIKIT_EXTERN NSString * const PAY_PAYPRE_URL;

/**
 *  支付-认证支付-预支付请求
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_PRE_URL;

/**
 *  支付-认证支付-银行卡列表
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_BANKCARDLIST_URL;

/**
 *  支付-认证支付-银行卡信息
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_BANKCARDINFO_URL;

/**
 *  支付-认证支付-支付校验
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_PAYCHECK_URL;

/**
 *  支付-认证支付-删除卡
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_DELBANK_URL;

/**
 *  支付-认证支付-修改卡手机号
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_GETCODE_URL;

/**
 *  支付-认证支付-验证
 */
UIKIT_EXTERN NSString * const PAY_CERPAY_MODIFYPHONECHECK_URL;

/**
 *  支付-查询支付结果
 */
UIKIT_EXTERN NSString * const PAY_QUERY_PAYMENT_RESULT_URL;

/**
 扫码支付
 */
UIKIT_EXTERN NSString *const PAY_SCANPAYMENT_URL;

/**
 查询 扫码支付结果
 */
UIKIT_EXTERN NSString *const SCANPAY_CHECKPAYMENTRESULT_URL;

//** =========================================================================================== */
//** ============================================thridbinding/accoutsurity=========================================== */
//** =========================================================================================== */


/**
 查询第三方绑定信息
 */
UIKIT_EXTERN NSString *const GETCUREENTTHRIDBINDINGINFOR_URL;
/**
 解除绑定微信
 */
UIKIT_EXTERN NSString *const UNBINDINGWEICHAT_URL;
/**
 解除绑定QQ
 */
UIKIT_EXTERN NSString *const UNBINDINGQQ_URL;
/**
 修改登录密码
 */
UIKIT_EXTERN NSString *const CHANGELOGINPASSWORDS_URL;

/**
 个人信息
 */
UIKIT_EXTERN NSString *const PERSONINFORMATION_URL;

/**
 修改个人信息接口
 */
UIKIT_EXTERN NSString *const CHANGEPERSONINFORMATION_URL;
/**
 修改用户头像
 */
UIKIT_EXTERN NSString *const CHANGEPERSONHEADERICON_URL;


//** =========================================================================================== */
//** ===========================================喜欢／足迹 列表=========================================== */
//** =========================================================================================== */

/**
 喜欢列表
 */
UIKIT_EXTERN NSString *const LIKEGOODSLISEDATA_URL;

/**
 足迹列表
 */
UIKIT_EXTERN NSString *const MYSEEGOODSRECORDLISTDATA_URL;

//** =========================================================================================== */
//** =========================================== 消息 =========================================== */
//** =========================================================================================== */

/**
 消息列表的未读数
 */
UIKIT_EXTERN NSString *const GETMESSAGECENTERLISTNUREADNEWSNUMBER_URL;

/**
 订单消息列表
 */
UIKIT_EXTERN NSString *const GETMESSAGEOREDERNEWSLISTDATA_URL;

/**
 系统消息列表
 */
UIKIT_EXTERN NSString *const GETMESSAGESYSTEMNEWSLISTDATA_URL;

/**
 鉴定订单消息列表
 */
UIKIT_EXTERN NSString *const GETMESSAGEAPPRAISALORDERNEWSLISTDATA_URL;

/**
 担保金订单消息列表
 */
UIKIT_EXTERN NSString *const GETMESSAGEDESPOSITORDERNEWSLISTDATA_URL;


//** =========================================================================================== */
//** ============================================help=========================================== */
//** =========================================================================================== */

/**
 *  帮助中心-列表
 */
UIKIT_EXTERN NSString *const HELP_LIST_URL;

//** =========================================================================================== */
//** ============================================appraisal (鉴定)=========================================== */
//** =========================================================================================== */

/**
 *  鉴定-列表
 */
UIKIT_EXTERN NSString *const APPRAISAL_LIST_URL;

/**
 鉴定获取提交物流页面信息接口
 */
UIKIT_EXTERN NSString *const APPRAISALGETCOMMOTLOGICTSINFOR_URL;

/**
 鉴定提交物流接口
 */
UIKIT_EXTERN NSString *const APPRAISALCOMMITLLOGITSCINFOR_URL;

/**
 鉴定申请退回请求页面信息接口
 */
UIKIT_EXTERN NSString *const APPRAISALAPPLYQUESTINFOR_URL;

/**
 鉴定确认退回接口
 */
UIKIT_EXTERN NSString *const APPRAISALAPPLYCOMFORT_URL;

/**
 鉴定鉴定报告
 */
UIKIT_EXTERN NSString *const APPRAISALREPORTINFOR_URL;


//** =========================================================================================== */
//** ============================================mysellout (我卖出的)=========================================== */
//** =========================================================================================== */

/**
 我卖出的列表
 */
UIKIT_EXTERN NSString *const MYSELLOUTORDER_LIST_URL;

/**
 我卖出的详情
 */
UIKIT_EXTERN NSString *const MYSELLOUTORDER_DEATIL_URL;


/**
 发货的页面数据
 */
UIKIT_EXTERN NSString *const MYSELLOUTORDER_SENDEDOODSINFOR_URL;

/**
 发货  提交数据
 */
UIKIT_EXTERN NSString *const COMMIT_MYSELLOUTORDER_SENDGOODSINFOR_URL;

/**
 提供单号 送鉴 页面数据
 */
UIKIT_EXTERN NSString *const MYSELLOUTORDER_SUPPLYNUMBER_URL;

/**
 提供单号 送鉴 提交接口
 */
UIKIT_EXTERN NSString *const COMMIT_MYSELLOUTORDER_SUPPLYNUMBER_URL;


//** =========================================================================================== */
//** ============================================mygoods (我的物品)=========================================== */
//** =========================================================================================== */

/**
 我的物品列表
 */
UIKIT_EXTERN NSString *const MYGOODSDATA_LIST_URL;
