
/**
 *  头文件说明
 *  1、所有app使用系统及工具类宏
 */

#ifndef ZJProjectMacro_h
#define ZJProjectMacro_h

//** =========================================================================================== */
//** ===========================================系统尺寸========================================== */
//** =========================================================================================== */

/**
 * 状态栏 ＋ 导航栏 高度
 */
#define STATUS_AND_NAVIGATION_HEIGHT                                    ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

/**
 * 屏幕 rect
 */
#define SCREEN_RECT                                                     [UIScreen mainScreen].bounds

/**
 * 屏幕宽
 */
#define SCREEN_WIDTH                                                    ([UIScreen mainScreen].bounds.size.width)

/**
 * 屏幕高
 */
#define SCREEN_HEIGHT                                                   ([UIScreen mainScreen].bounds.size.height)

/**
 * 屏幕显示内容净高度
 */
#define CONTENT_HEIGHT                                                  (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

/**
 * 屏幕分辨率
 */
#define SCREEN_RESOLUTION                                               (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))

/**
 * 屏幕缩放因子
 */
#define SCREEN_SCALE                                                    ([UIScreen mainScreen].scale)

/**
 *  屏幕适配比例，以iPhone6为基准
 */
#define ADJUST_PERCENT_FLOAT(float)                                     ([ZJProjectSizeFatory projectSizeFatoryAdjustPercentFloat:float])

/**
 *  获取字并根据大小适配_系统字体
 */
#define SYSTEM_FONT(float)                                              [UIFont systemFontOfSize: ADJUST_PERCENT_FLOAT(float)]

/**
 *  获取字并根据大小适配_Regular
 */
#define SYSTEM_REGULARFONT(float)                                       [UIFont systemFontOfSize:ADJUST_PERCENT_FLOAT(float) weight:UIFontWeightRegular]

/**
 *  获取字并根据大小适配_Regular
 */
#define SYSTEM_REGULARFONT(float)                                       [UIFont systemFontOfSize:ADJUST_PERCENT_FLOAT(float) weight:UIFontWeightRegular]

/**
 *  获取字并根据大小适配_Light
 */
#define SYSTEM_LIGHTFONT(float)                                         [UIFont systemFontOfSize:ADJUST_PERCENT_FLOAT(float) weight:UIFontWeightLight]

/**
 *  获取字并根据大小适配_Medium
 */
#define SYSTEM_MEDIUMFONT(float)                                        [UIFont systemFontOfSize:ADJUST_PERCENT_FLOAT(float) weight:UIFontWeightMedium]

//** =========================================================================================== */
//** =========================================系统路径&单例======================================= */
//** =========================================================================================== */

/**
 * 沙盒Temp文件夹路径
 */
#define SYSTEM_SENDBOX_TEMP                                             NSTemporaryDirectory()

/**
 * 沙盒Document路径
 */
#define SYSTEM_SENDBOX_DOCUMENT                                         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 * 沙盒Cache路径
 */
#define SYSTEM_SENDBOX_CACHE                                            [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 * 主窗口
 */
#define SYSTEM_KEYWINDOW                                                [UIApplication sharedApplication].keyWindow

/**
 * 系统偏好设置单例
 */
#define SYSTEM_USERDEFAULTS                                             [NSUserDefaults standardUserDefaults]

/**
 * 系统通知中心
 */
#define SYSTEM_NOTIFICATIONCENTER                                       [NSNotificationCenter defaultCenter]

//** =========================================================================================== */
//** =======================================设备&系统版本判断====================================== */
//** =========================================================================================== */

/**
 * 判断是否是iPhone
 */
#define IS_IPHONE                                                       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//#define IS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])

/**
 * 判断是否为iPad
 */
#define IS_IPAD                                                         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//#define IS_IPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])

/**
 * 判断是否为ipod
 */
#define IS_IPOD                                                         ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/**
 * 判断是否为 iPhone 5SE
 */
#define iPhone5SE                                                       SCREEN_RECT.size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

/**
 * 判断是否为iPhone 6/6s/7
 */
#define iPhone6_6s                                                      SCREEN_RECT.size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

/**
 * 判断是否为iPhone 6Plus/6sPlus/7Plus
 */
#define iPhone6Plus_6sPlus                                              SCREEN_RECT.size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

/**
 * 判断是否相同版本
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                                      ([SYSTEM_VERSIONSTRING compare:v options:NSNumericSearch] == NSOrderedSame)

/**
 * 判断是否大于版本
 */
#define SYSTEM_VERSION_GREATER_THAN(v)                                  ([SYSTEM_VERSIONSTRING compare:v options:NSNumericSearch] == NSOrderedDescending)

/**
 * 判断大于等于版本
 */
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)                      ([SYSTEM_VERSIONSTRING compare:v options:NSNumericSearch] != NSOrderedAscending)

/**
 * 判断小于版本
 */
#define SYSTEM_VERSION_LESS_THAN(v)                                     ([SYSTEM_VERSIONSTRING compare:v options:NSNumericSearch] == NSOrderedAscending)

/**
 * 判断小于等于版本
 */
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)                         ([SYSTEM_VERSIONSTRING compare:v options:NSNumericSearch] != NSOrderedDescending)

/**
 * 是否大于等于iOS6.0
 */
#define IS_IOS6                                                         ((SYSTEM_VERSION >= 6.0) ? YES : NO)

/**
 * 是否大于等于iOS7.0
 */
#define IS_IOS7                                                         ((SYSTEM_VERSION >= 7.0) ? YES : NO)

/**
 * 是否大于等于iOS8.0
 */
#define iOS8                                                            ((SYSTEM_VERSION >= 8.0) ? YES : NO)

/**
 * 是否大于等于iOS9.0
 */
#define iOS9                                                            ((SYSTEM_VERSION >= 9.0) ? YES : NO)

/**
 * 是否大于等于iOS10
 */
#define iOS10                                                           ((SYSTEM_VERSION >= 10.0) ? YES : NO)

//** =========================================================================================== */
//** ============================================工具宏========================================== */
//** =========================================================================================== */

/**
 * 打印Log宏
 */
#ifdef DEBUG
# define YBLog(fmt, ...) NSLog((@"\n[文件名:%s]\n""[函数名:%s]\n""[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define YBLog(...);
#endif

/**
 * 角度转弧度
 */
#define DEGREESTORADIAN(x)                                                  (M_PI * (x) / 180.0)

/**
 * 弧度转角度
 */
#define RADIANTODEGREES(radian)                                             (radian * 180.0)/(M_PI)

/**
 * 获取系统版本字符串
 */
#define SYSTEM_VERSIONSTRING                                                [[UIDevice currentDevice] systemVersion]

/**
 * 获取系统版本
 */
#define SYSTEM_VERSION                                                      ([[[UIDevice currentDevice] systemVersion] floatValue])

/**
 * 获取APP名称
 */
#define APPNAME                                                             ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])

/**
 * 获取APP版本
 */
#define APPVERSION                                                          ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

/**
 * 获取APP build版本
 */
#define APPBUILDVERSION                                                     ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

/**
 * 弱化指针
 */
#define WEAKSELF(type)                                                      __weak typeof(type) weak##type = type;

/**
 * 获取本地文件(测试使用)
 */
#define LOADLOCALDATA_DATA                                                  [NSData dataWithContentsOfFile:LOCALEDATAPATH]

/**
 *  加载普通及高亮图片
 */
#define ZJIMAGE(fileName, imageName, type)                                  [[ZJProjectThemeManager sharedManager] loadImageWithFileName:fileName imageNamed:imageName imageType:type]

/**
 *  加载单张图片
 */
#define ZJCURRENTIMAGE(fileName, imageName, type)                           [[ZJProjectThemeManager sharedManager] loadCurrentImageWithFileName:fileName imageNamed:imageName imageType:type]

/**
 *  加载颜色
 */
#define ZJCOLOR                                                             [[ZJProjectThemeManager sharedManager] themeColorFatory]

/**
 *  加载文字
 */
#define ZJSTRING(stringKey)                                                 [NSBundle ex_localizedStringForKey:stringKey]

/**
 *  处理图片URLString
 */
#define ZJIMAGEURLSTRING(type, urlString)                                   [[ZJProjectThemeManager sharedManager] resetImageURLStringWithImageType:type URLString:urlString]

/**
 *  角度换算
 */
#define DegreesToRadians(angle)                                             (angle*M_PI/180)

#endif /* ZJProjectMacro_h */
