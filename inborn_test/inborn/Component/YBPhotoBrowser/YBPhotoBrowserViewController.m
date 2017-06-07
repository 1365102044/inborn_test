//
//  YBPhotoBrowserViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPhotoBrowserViewController.h"

@interface YBPhotoBrowserViewController () <PBViewControllerDataSource, PBViewControllerDelegate>

@end

@implementation YBPhotoBrowserViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setImageUrlStringArray:(NSArray *)imageUrlStringArray
{
    _imageUrlStringArray = imageUrlStringArray;
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <PBViewControllerDataSource>

- (NSInteger)numberOfPagesInViewController:(PBViewController *)viewController
{
    return self.imageUrlStringArray.count ? self.imageUrlStringArray.count : 1 ;
}

- (void)viewController:(PBViewController *)viewController presentImageView:(UIImageView *)imageView forPageAtIndex:(NSInteger)index progressHandler:(void (^)(NSInteger, NSInteger))progressHandler
{
    if (!self.imageUrlStringArray.count) {
        return;
    }
    NSString *imageUrl = self.imageUrlStringArray[index];
    [imageView sd_setImageWithURL:[NSURL URLWithString: ZJIMAGEURLSTRING(ZJProjectImageURLStringDefault,
                                                                         imageUrl)]
                 placeholderImage:nil
                          options:SDWebImageRetryFailed];
    
    /**
     告诉 view index
     */
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"scrollerImageVCindex" object:nil userInfo:@{@"scrollerindex":[NSString stringWithFormat:@"%ld",(long)index]}];
}

#pragma mark <PBViewControllerDelegate>

- (void)viewController:(PBViewController *)viewController
didSingleTapedPageAtIndex:(NSInteger)index
        presentedImage:(UIImage *)presentedImage
{
    
}

#pragma mark - Fifth.控制器生命周期

/**
 获取图片预览控制器
 
 @return 图片预览控制器
 */
+ (instancetype)photoBrowserViewControllerImageUrlStingArray:(NSArray<NSString *> *)imageUrlStingArray
{
    YBPhotoBrowserViewController *pbViewController  = [YBPhotoBrowserViewController new];
    pbViewController.pb_dataSource                  = pbViewController;
    pbViewController.pb_delegate                    = pbViewController;
//    NSAssert(imageUrlStingArray, @"图片URLString数组不能为空");
    pbViewController.imageUrlStringArray            = imageUrlStingArray;
    return pbViewController;
}

/**
 视图加载完毕
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
