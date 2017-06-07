//
//  UIApplication+Extension.h
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extension)

/**
 *  跳转到 设置首页
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_shipToSetHome;

/**
 *  跳转到 root->通用页
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToGeneral;

/**
 *  跳到 root->wifi设置页
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToWifi;

/**
 *  跳转到 root->通用->关于页
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToAbout;

/**
 *  跳转到 root->通用->辅助功能
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToAccessibility;

/**
 *  跳转到 root->通用->自动锁定
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToAutoLock;

/**
 *  跳转到 root->显示与亮度
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToBrightness;

/**
 *  跳转到 root->蓝牙
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToBluetooth;

/**
 *  跳转到 root->通用->日期与时间
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToDateTime;

/**
 *  跳转到 root->FaceTime
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToFaceTime;

/**
 *  跳转到 root->通用->键盘
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToKeyboard;

/**
 *  跳转到 root->iClound
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToiCloud;

/**
 *  跳转到 root->iClound->储存空间
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToiCloudStorage;

/**
 *  跳转到 root->通用->语言与地区
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipInternational;

/**
 *  跳转到 root->隐私->定位服务
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToLocationServices;

/**
 *  跳转到 root->音乐
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToMusic;

/**
 *  跳转到 root->音乐->音量
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToMusicVolumeLimit;

/**
 *  跳转到 root->蜂窝移动网络
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToCellular;

/**
 *  跳转到 root->备忘录
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToNotes;

/**
 *  跳转到 root->通知
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToNotification;

/**
 *  跳转到 root->相册
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToPhotos;

/**
 *  跳转到 root->隐私
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToPrivacy;

/**
 *  跳转到 root->通用->描述文件
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToProfile;

/**
 *  跳转到 root->通用->还原
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToReset;

/**
 *  跳转到 root->safari
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToSafari;

/**
 *  跳转到 root->通用->siri
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToSiri;

/**
 *  跳转到 root->声音
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToSounds;

/**
 *  跳转到 root->通用->软件更新
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToSoftwareUpdate;

/**
 *  跳转到 root->iTunes Store & AppStore
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToStore;

/**
 *  跳转到 root->Twitter
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToTwitter;

/**
 *  跳转到 root->通用->储存空间与iCloud
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToUsage;

/**
 *  跳转到 root->通用->VPN
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToVPN;

/**
 *  跳转到 root->墙纸
 *
 *  @return 是否跳转成功
 */
- (BOOL)ex_skipToWallpaper;

@end
