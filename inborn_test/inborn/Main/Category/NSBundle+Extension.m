//
//  NSBundle+Extension.m
//  Project
//
//  Created by 郑键 on 17/1/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "NSBundle+Extension.h"

@implementation NSBundle (Extension)

#pragma mark - 获取文字文件路径

/**
 *  获取本地化string文件bundle
 *
 *  @return 返回string文件bundle对象
 */
+ (instancetype)ex_stringBundle
{
    static NSBundle *stringBundle = nil;
    if (stringBundle == nil) {
        stringBundle = [NSBundle bundleWithPath: [[NSBundle mainBundle]
                                                  pathForResource:RESOURCESBUNDLE_STRING
                                                  ofType:nil]];
    }
    return stringBundle;
}

/**
 *  根据Key获取文本文字
 *
 *  @param key         文字对应的Key
 *
 *  @return            返回文本文字
 */
+ (NSString *)ex_localizedStringForKey:(NSString *)key
{
    return [self ex_localizedStringForKey:key value:nil];
}


/**
 *  根据key和value获取文本文字
 *
 *  @param key         文字对应的key
 *  @param value       value
 *
 *  @return            返回文本文字
 */
+ (NSString *)ex_localizedStringForKey:(NSString *)key
                                 value:(NSString *)value
{
    static NSBundle *bundle                     = nil;
    if (bundle == nil) {
        NSString *language                      = [NSLocale preferredLanguages].firstObject;
        if ([language hasPrefix:@"en"]) {
            language                            = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language                        = @"zh-Hans";
            } else { // zh-Hant\zh-HK\zh-TW
                language                        = @"zh-Hant";
            }
        } else {
            language                            = @"en";
        }
        
        bundle                                  = [NSBundle bundleWithPath:[[NSBundle ex_stringBundle] pathForResource:language ofType:@"lproj"]];
    }
    value                                       = [bundle localizedStringForKey:key value:value table:nil];

    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

#pragma mark - 获取资源文件路径

/**
 *  获取本地化Image文件bundle
 *
 *  @return 返回Image文件bundle对象
 */
+ (NSString *)ex_imageBundlePath
{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: RESOURCESBUNDLE_IMAGE];
}

/**
 *  获取color的JSON文件路径
 *
 *  @return 返回路径
 */
+ (NSString *)ex_colorBundlePath
{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: RESOURCESBUNDLE_COLOR];
}

@end
