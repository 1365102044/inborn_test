
/**
 *  头文件说明
 *  1、公用app定义枚举类型
 */


/**
 本地数据操作类型

 - ZJLocalDataManagerDatabaseOperationNone:                     无操作
 - ZJLocalDataManagerDatabaseOperationAdd:                      新增
 - ZJLocalDataManagerDatabaseOperationDel:                      删除
 - ZJLocalDataManagerDatabaseOperationUpdate:                   修改
 - ZJLocalDataManagerDatabaseOperationQuery:                    查询
 */
typedef NS_ENUM(NSUInteger, ZJLocalDataManagerDatabaseOperationType) {
    ZJLocalDataManagerDatabaseOperationNone,
    ZJLocalDataManagerDatabaseOperationAdd,
    ZJLocalDataManagerDatabaseOperationDel,
    ZJLocalDataManagerDatabaseOperationUpdate,
    ZJLocalDataManagerDatabaseOperationQuery,
};

/**
 网络请求方式

 - ZJProjectNetRequestNone:                                     无方式（默认为POST请求）
 - ZJProjectNetRequestPost:                                     POST请求
 - ZJProjectNetRequestGet:                                      GET请求
 */
typedef NS_ENUM(NSUInteger, ZJProjectNetRequestType) {
    ZJProjectNetRequestNone,
    ZJProjectNetRequestPost,
    ZJProjectNetRequestGet,
};

/**
 网络请求失败错误状态

 - ZJProjectNetRequestErrorDefault:                             默认状态
 - ZJProjectNetRequestErrorTimeOut:                             连接超时
 - ZJProjectNetRequestErrorNoServer:                            无法与服务器建立连接
 - ZJProjectNetRequestErrorNoNetwork:                           网络不给力，请检查网络
 */
typedef NS_ENUM(NSUInteger, ZJProjectNetRequestErrorType) {
    ZJProjectNetRequestErrorDefault                         = -1001,
    ZJProjectNetRequestErrorTimeOut                         = -1002,
    ZJProjectNetRequestErrorNoServer                        = -1003,
    ZJProjectNetRequestErrorNoNetwork                       = -1004,
};

/**
 项目视图状态

 - ZJProjectViewStatusDefault:                                  默认状态
 - ZJProjectViewStatusLoading:                                  数据加载中
 - ZJProjectViewStatusNoData:                                   无数据
 - ZJProjectViewStatusBadRequest:                               请求失败
 */
typedef NS_ENUM(NSUInteger, ZJProjectViewStatusType) {
    ZJProjectViewStatusDefault,
    ZJProjectViewStatusLoading,
    ZJProjectViewStatusNoData,
    ZJProjectViewStatusBadRequest,
};

/**
 项目加载本地图片样式

 - ZJProjectLoadImageDefault:                                   默认（直接加载原图）
 - ZJProjectLoadImageFillet:                                    图片圆角化
 */
typedef NS_ENUM(NSUInteger, ZJProjectLoadImageType) {
    ZJProjectLoadImageDefault,
    ZJProjectLoadImageFillet,
};

/**
 项目加载网络图片URLString
 
 - ZJProjectImageURLStringDefault:                              默认（原图）
 - ZJProjectImageURLStringWaterfallFlow:                        瀑布流
 - ZJProjectImageURLStringList:                                 列表用小图
 - ZJProjectImageURLStringMid:                                  详情展示中图
 - ZJProjectImageURLStringLarge:                                点击大图
 - ZJProjectImageUrlStringHeaderIcon:                           头像
 */
typedef NS_ENUM(NSUInteger, ZJProjectImageURLStringType) {
    ZJProjectImageURLStringDefault,
    ZJProjectImageURLStringWaterfallFlow,
    ZJProjectImageURLStringList,
    ZJProjectImageURLStringMid,
    ZJProjectImageURLStringLarge,
    ZJProjectImageUrlStringHeaderIcon,
};

/**
 项目用价格筛选顺序

 - ZJProjectConditionalScreenPriceDefault:                      默认
 - ZJProjectConditionalScreenPriceUp:                           升序
 - ZJProjectConditionalScreenPriceDown:                         降序
 */
typedef NS_ENUM(NSUInteger, ZJProjectConditionalScreenPriceType) {
    ZJProjectConditionalScreenPriceDefault,
    ZJProjectConditionalScreenPriceUp,
    ZJProjectConditionalScreenPriceDown,
};

/**
 项目初始化按钮时选择添加图片位置

 - ZJProjectButtonSetImageDefault:                              默认（背景图片）
 - ZJProjectButtonSetImage:                                     图片
 - ZJProjectButtonSetBackgroundImage:                           背景图片
 */
typedef NS_ENUM(NSUInteger, ZJProjectButtonSetImageType) {
    ZJProjectButtonSetImageDefault,
    ZJProjectButtonSetImage,
    ZJProjectButtonSetBackgroundImage,
};

/**
 项目支持支付类型

 - ZJProjectPaymentDefault:                                     默认
 - ZJProjectPaymentCertified:                                   认证支付
 - ZJProjectPaymentWeChat:                                      微信支付
 - ZJProjectPaymentAlipay:                                      支付宝
 - ZJProjectPaymentApplePay:                                    applePay
 - ZJProjectPaymentUnionPay:                                    银联支付
 */
typedef NS_ENUM(NSUInteger, ZJProjectPaymentType) {
    ZJProjectPaymentDefault                                 = 1,
    ZJProjectPaymentCertified                               = 5,
    ZJProjectPaymentWeChat                                  = 2,
    ZJProjectPaymentAlipay                                  = 3,
    ZJProjectPaymentApplePay                                = 4,
    ZJProjectPaymentUnionPay                                = 6,
};

/**
 项目支持支付方式

 - ZJProjectPaymentMethodDefault:                               默认
 - ZJProjectPaymentMethodAll:                                   全款支付
 - ZJProjectPaymentMethodDeposit:                               定金支付
 - ZJProjectPaymentMethodPen:                                   分笔支付
 - ZJProjectPaymentMethodTransfer:                              转账支付
 - ZJProjectPaymentMethodDefaultCard:                           订金+刷卡
 - ZJProjectPaymentMethodDepositBalance_All:                    定金余款全额
 - ZJProjectPaymentMethodDepositBalance_part:                   定金余款分笔
 */
typedef NS_ENUM(NSUInteger, ZJProjectPaymentMethod) {
    ZJProjectPaymentMethodDefault,
    ZJProjectPaymentMethodAll,
    ZJProjectPaymentMethodDeposit,
    ZJProjectPaymentMethodPen,
    ZJProjectPaymentMethodTransfer,
    ZJProjectPaymentMethodCard,
    ZJProjectPaymentMethodDepositBalance_All,
    ZJProjectPaymentMethodDepositBalance_part,
};

/**
 支付结果

 - ZJProjectPaymentResultDefault:                               默认
 - ZJProjectPaymentResultCancel:                                取消
 - ZJProjectPaymentResultSuccess:                               成功
 - ZJProjectPaymentResultFailed:                                失败
 */
typedef NS_ENUM(NSUInteger, ZJProjectPaymentResultType) {
    ZJProjectPaymentResultDefault,
    ZJProjectPaymentResultCancel,
    ZJProjectPaymentResultSuccess,
    ZJProjectPaymentResultFailed,
};

/**
 项目的支付事件类型

 - ZJProjectPaymentEventDefault:                                默认
 - ZJProjectPaymentEventOrder:                                  订单
 - ZJProjectPaymentEventIdentifyCost:                           鉴定费
 - ZJProjectPaymentEventIdentifyDeposit:                        担保费
 */
typedef NS_ENUM(NSUInteger, ZJProjectPaymentEventType) {
    ZJProjectPaymentEventDefault,
    ZJProjectPaymentEventOrder,
    ZJProjectPaymentEventIdentifyCost,
    ZJProjectPaymentEventIdentifyDeposit,
};

/**
 详情页面底部类型:
 startSellRemindType                 开拍提醒
 addOnePriceType                     加一口价
 alearySellOutType                   已售罄
 immediateGoBuyType                  马上抢 (有保证金)
 immediateGoBuyNoEnsureMoneyType,     马上抢没有保证金
 paymentBuyingType                   付款中
 continuePaymentType                 继续付款
 willStartSellType                   预售
 immidatePaymentEnsureMoneyType      立即付定金
 goodsUndershelf                      已下架
 boomBarNuknowType                    不知道类型
 */
typedef NS_ENUM(NSInteger, BoomBarType) {
    startSellRemindType = 1,
    addOnePriceType,
    alearySellOutType,
    immediateGoBuyType,
    immediateGoBuyNoEnsureMoneyType,
    paymentBuyingType,
    continuePaymentType,
    willStartSellType,
    immidatePaymentEnsureMoneyType,
    goodsUndershelf,
    boomBarNuknowType
};

/**
 注册手机号的枚举:
 registerType,              注册
 forgetpasswordType,        忘记密码
 thridQQLoginType,          QQ登录
 thridWXLoginType           微信登录
 thridQQBindType            QQ绑定
 thridWXBindType           微信绑定
 */
typedef NS_ENUM(NSInteger, sourceVcType) {
    registerType,
    forgetpasswordType,
    thridQQLoginType,
    thridWXLoginType,
    thridQQBindType,
    thridWXBindType
};

/**
 订单列表类型：
 MyBuyOrderType                 我买到的
 AppraisalOrderType             鉴定的
 MySellOutOrderType             我卖出的
 MyGoodsOrderType               我的物品
 */
typedef NS_ENUM(NSInteger, OrderListVcType) {
    MyBuyOrderType = 1,
    AppraisalOrderType,
    MySellOutOrderType,
    MyGoodsOrderType
};
