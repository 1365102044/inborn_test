//
//  UIApplication+Extension.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

- (BOOL)skipTo:(NSString *)URLString{
    NSURL*url=[NSURL URLWithString:URLString];
    return [self openURL:url];
}

- (BOOL)ex_shipToSetHome{
    return [self skipTo:@"prefs:root"];
}

- (BOOL)ex_skipToGeneral{
    return [self skipTo:@"prefs:root=General"];
}

- (BOOL)ex_skipToWifi{
    return [self skipTo:@"prefs:root=WIFI"];
}

- (BOOL)ex_skipToAbout{
    return [self skipTo:@"prefs:root=General&path=About"];
}

- (BOOL)ex_skipToAccessibility{
    return [self skipTo:@"prefs:root=General&path=AUTOLOCK"];
}

- (BOOL)ex_skipToAutoLock{
    return [self skipTo:@"prefs:root=General&path=ACCESSIBILITY"];
}

- (BOOL)ex_skipToBrightness{
    return [self skipTo:@"prefs:root=Brightness"];
}

- (BOOL)ex_skipToBluetooth{
    return [self skipTo:@"prefs:root=General&path=Bluetooth"];
}

- (BOOL)ex_skipToDateTime{
    return [self skipTo:@"prefs:root=General&path=DATE_AND_TIME"];
}

- (BOOL)ex_skipToFaceTime{
    return [self skipTo:@"prefs:root=FACETIME"];
}

- (BOOL)ex_skipToKeyboard{
    return [self skipTo:@"prefs:root=General&path=Keyboard"];
}

- (BOOL)ex_skipToiCloud{
    return [self skipTo:@"prefs:root=CASTLE"];
}

- (BOOL)ex_skipToiCloudStorage{
    return [self skipTo:@"prefs:root=CASTLE&path=STORAGE_AND_BACKUP"];
}

- (BOOL)ex_skipInternational{
    return [self skipTo:@"prefs:root=General&path=INTERNATIONAL"];
}

- (BOOL)ex_skipToLocationServices{
    return [self skipTo:@"prefs:root=LOCATION_SERVICES"];
}

- (BOOL)ex_skipToMusic{
    return [self skipTo:@"prefs:root=Music"];
}


- (BOOL)ex_skipToMusicVolumeLimit{
    return [self skipTo:@"prefs:root=MUSIC&path=VolumeLimit"];
}

- (BOOL)ex_skipToCellular{
    return [self skipTo:@"prefs:root=Cellular"];
}

- (BOOL)ex_skipToNotes{
    return [self skipTo:@"prefs:root=NOTES"];
}

- (BOOL)ex_skipToNotification{
    return [self skipTo:@"prefs:root=NOTIFICATIONS_ID"];
}


- (BOOL)ex_skipToPhotos{
    return [self skipTo:@"prefs:root=Photos"];
}

- (BOOL)ex_skipToPrivacy{
    return [self skipTo:@"prefs:root=Privacy"];
}

- (BOOL)ex_skipToProfile{
    return [self skipTo:@"prefs:root=General&path=ManagedConfigurationList"];
}

- (BOOL)ex_skipToReset{
    return [self skipTo:@"prefs:root=General&path=Reset"];
}

- (BOOL)ex_skipToSafari{
    return [self skipTo:@"prefs:root=Safari"];
}

- (BOOL)ex_skipToSiri{
    return [self skipTo:@"prefs:root=General&path=Assistant"];
}

- (BOOL)ex_skipToSounds{
    return [self skipTo:@"prefs:root=Sounds"];
}

- (BOOL)ex_skipToSoftwareUpdate{
    return [self skipTo:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
}

- (BOOL)ex_skipToStore{
    return [self skipTo:@"prefs:root=STORE"];
}

- (BOOL)ex_skipToTwitter{
    return [self skipTo:@"prefs:root=TWITTER"];
}

- (BOOL)ex_skipToUsage{
    return [self skipTo:@"prefs:root=General&path=USAGE"];
}

- (BOOL)ex_skipToVPN{
    return [self skipTo:@"prefs:root=General&path=Network/VPN"];
}

- (BOOL)ex_skipToWallpaper{
    return [self skipTo:@"prefs:root=Wallpaper"];
}

@end
