//
//  YBUploadImageModel.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBUploadImageModel.h"

@implementation YBUploadImageModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return@{@"customId" : @"id"};
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:COMPOSE_UPLOADIMAGE_PROGRESS_NOTIFICATION object:nil];
}

- (void)setFailed:(BOOL)failed
{
    _failed = failed;
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:COMPOSE_UPLOADIMAGE_ISSUCCESS_NOTIFICATION object:nil];
    
}

- (NSString *)imageSort
{
    if (!_imageSort) {
        
        _imageSort = [NSString stringWithFormat:@"%zd", self.num];
        
    }
    return _imageSort;
}

- (UIImage *)originalImage
{
    if (!_originalImage) {
        
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        NSString *cacheImageKey = [manager cacheKeyForURL:[NSURL URLWithString:self.imgUrl]];
        SDImageCache *cache = [SDImageCache sharedImageCache];
        _originalImage = [cache imageFromDiskCacheForKey:cacheImageKey];
        
    }
    return _originalImage;
}

- (UIImage *)placeholderImage
{
    if (!_placeholderImage) {
        
        _placeholderImage = [UIImage imageNamed:@"details_default_bg"];
        
    }
    return _placeholderImage;
}

@end
