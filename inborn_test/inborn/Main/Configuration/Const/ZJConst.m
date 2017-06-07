#import "ZJConst.h"

//** =========================================================================================== */
//** ============================================系统=========================================== */
//** =========================================================================================== */

/**
 *  系统网络请求分页页面大小
 */
NSInteger const SEVRIES_PAGESIZE                            = 8;

/**
 *  系统网络请求超时时间
 */
CGFloat const SEVRIES_TIMEOUT                               = 20.f;

/**
 *  主题样式
 */
NSString * const PROJECT_THEME_DEFAULT                      = @"Default";

/**
 *  高亮图片拼接后缀
 */
NSString * const PROJECT_THEME_IMAGE_HIG                    = @"h";

/**
 *  普通图片拼接后缀
 */
NSString * const PROJECT_THEME_IMAGE_NOR                    = @"n";

/**
 *  禁用图片拼接后缀
 */
NSString * const PROJECT_THEME_IMAGE_DIS                    = @"d";

/**
 * 状态栏高度
 */
CGFloat const STATUS_BAR_HEIGHT                             = 20.f;

/**
 * NaviBar高度
 */
CGFloat const NAVIGATION_BAR_HEIGHT                         = 44.f;

/**
 * 分钟秒数
 */
CGFloat const TIME_MINUTE                                   = 60.f;

/**
 * 小时秒数
 */
CGFloat const TIME_HOUR                                     = 3600.f;

/**
 * 天秒数
 */
CGFloat const TIME_DAY                                      = 86400.f;

/**
 * 星期秒数
 */
CGFloat const TIME_WEEK                                     = 604800.f;

/**
 * 月秒数
 */
CGFloat const TIME_MONTH                                    = 2592000.f;

/**
 * 年秒数
 */
CGFloat const TIME_YEAR                                     = 31556926.f;

/**
 * 网络请求超时时间
 */
CGFloat const NETREQUEST_TIMEOUT                            = 3600.f;

/**
 * 默认时间格式
 */
NSString * const TIME_FORMATTER_DEFAULT                     = @"yyyy-HH-mm";

/**
 * 图片资源文件路径
 */
NSString * const RESOURCESBUNDLE_IMAGE                      = @"Image.bundle";

/**
 * string资源文件路径
 */
NSString * const RESOURCESBUNDLE_STRING                     = @"String.bundle";

/**
 * color资源文件路径
 */
NSString * const RESOURCESBUNDLE_COLOR                      = @"Color.bundle";

/**
 * 本地数据路径(测试使用)
 */
NSString * const LOCALEDATAPATH                             = @"/Users/zhengjian/Desktop/orderDetail.json";

//** =========================================================================================== */
//** =========================================第三方资源配置====================================== */
//** =========================================================================================== */

/**
 * 百度统计APP_KEY
 */
NSString * const STYTEM_THIRD_BAIDU_STATISTICS_APPKEY       = @"8d67a39089";

/**
 * JPush APP_KEY
 */
NSString * const STYTEM_THIRD_JUPSH_APPKEY                  = @"9868ac2a557a05c7c20e91fe";

/**
 * JPush channel
 */
NSString * const STYTEM_THIRD_JUPSH_CHANNEL                 = @"Publish channel";

/**
 * MEIQIA APP_KEY 生产
 */
NSString * const STYTEM_THIRD_MEIQIA_APPKEY_PRO             = @"dfdec3376ff3a865552ffbf319651bd8";

/**
 * MEIQIA APP_KEY 测试
 */
NSString * const STYTEM_THIRD_MEIQIA_APPKEY_DEV             = @"87f108653fbf6d23c5b8914395523fc3";

/**
 * SHARE APP_KEY
 */
NSString * const STYTEM_THIRD_SHARE_APPKEY                  = @"1ab50ca89464a";

/**
 * WECHAT APP_KEY_PRO
 */
NSString * const STYTEM_THIRD_WECHAT_APPKEY_PRO             = @"wxf86bce5c6d2ffbf4";

/**
 * WECHAT APP_SECRET_PRO
 */
NSString * const STYTEM_THIRD_WECHAT_SECRET_PRO             = @"5f1a8779a6d9d4faee3e2017c51bd66d";

/**
 * WECHAT AUTHSCOPE_PRO
 */
NSString * const STYTEM_THIRD_WECHAT_AUTHSCOPE_PRO          = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact";

/**
 * WECHAT AUTHSTATE_PRO
 */
NSString * const STYTEM_THIRD_WECHAT_AUTHSTATE_PRO          = @"1230";

/**
 * WEIBO APP_KEY
 */
NSString * const STYTEM_THIRD_WEIBO_APPKEY_PRO              = @"644464596";

/**
 * WEIBO SECRET
 */
NSString * const STYTEM_THIRD_WEIBO_SECRET_PRO              = @"14d11d5d45a6ad6820a8a161a2663cdc";

/**
 * TENCEOPEN APP_KEY
 */
NSString * const STYTEM_THIRD_TENCEOPEN_APPKEY_PRO          = @"1105919178";

/**
 环信 APP_URL_SCHEMES
 */
NSString * const SYUYEM_THIRD_CUSTOMERSERVICE_URLSCHEMES    = @"MyTestApp://Liuwq.testapp";

//** =========================================================================================== */
//** ==========================================正则表达式========================================= */
//** =========================================================================================== */

/**
 * 正则表达式_验证邮箱号码
 */
NSString * const REGULAREXPRESSION_ISMAIL                   = @"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";

/**
 * 正则表达式_验证昵称 
 * 昵称正则匹配  支持中文、字母、数字、'-''_'的组合，4-10个字符"
 */
NSString * const REGULAREXPRESSION_ISNICKNAEM                   = @"^[\u4e00-\u9fa5-_a-zA-Z0-9]{4,10}$";

/**
 * 正则表达式_验证密码规则
 */
NSString * const REGULAREXPRESSION_ISPWD                    = @"^(?![\\d]+$)(?![a-zA-Z]+$)(?![!#$%^&*]+$)[\\da-zA-Z!#$%^&*]{8,20}$";

/**
 * 正则表达式_验证数字
 */
NSString * const REGULAREXPRESSION_ISNUM                    = @"^(0|[1-9][0-9]*)$";

/**
 * 正则表达式_手机号码
 *  [1]\d{10}
 */
//NSString * const REGULAREXPRESSION_PHONENUMBER_MOBILE       = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
NSString * const REGULAREXPRESSION_PHONENUMBER_MOBILE       = @"[1]\\d{10}";

/**
 * 中国移动：China Mobile
 * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
 */
NSString * const REGULAREXPRESSION_PHONENUMBER_CM           = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";

/**
 * 中国联通：China Unicom
 * 130,131,132,152,155,156,185,186
 */
NSString * const REGULAREXPRESSION_PHONENUMBER_CU           = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";

/**
 * 中国电信：China Telecom
 * 133,1349,153,180,189
 */
NSString * const REGULAREXPRESSION_PHONENUMBER_CT           = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";

/**
 * 大陆地区固话及小灵通
 * 区号：010,020,021,022,023,024,025,027,028,029
 * 号码：七位或八位
 */
NSString * const REGULAREXPRESSION_PHONENUMBER_PHS          = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";

/**
 * 正则表达式_虚拟号码
 */
NSString * const REGULAREXPRESSION_PHONENUMBER_XNHM         = @"^1(77)\\d{8}$";

/**
 * 正则表达式_控制输入不含特殊符号(能够输入汉字、字母、数字)
 */
NSString * const REGULAREXPRESSION_ISSTR                    = @"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D\\w]{0,50}";

/**
 * 正则表达式_验证身份证
 */
NSString * const REGULAREXPRESSION_IDENTITYCARD             = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
/**
 * 正则表达式_url
 */
NSString * const REGULAREXPRESSION_URL                      = @"[a-zA-z]+://[^s]*";
