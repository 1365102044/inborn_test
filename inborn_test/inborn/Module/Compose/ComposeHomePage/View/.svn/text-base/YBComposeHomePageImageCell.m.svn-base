//
//  YBComposeHomePageImageCell.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageImageCell.h"
#import "YBUploadImageModel.h"
#import "M13ProgressViewPie.h"
#import <UIButton+WebCache.h>

/**
 *  imageCell
 */
NSString * const YBComposeHomePageImageCellReuseIdentifier               = @"YBComposeHomePageImageCellReuseIdentifier";

@interface YBComposeHomePageImageCell()

/**
 图片
 */
@property (nonatomic, strong) YBDefaultButton *imageButton;

/**
 删除按钮
 */
@property (nonatomic, strong) YBDefaultButton *cancelButton;

/**
 蒙版视图
 */
@property (nonatomic, strong) M13ProgressViewPie *uploadStatusMaskView;

/**
 失败提示视图
 */
@property (nonatomic, strong) YBDefaultLabel *failedTipsLabel;

@end

@implementation YBComposeHomePageImageCell

#pragma mark - First.通知

- (void)progressUpdate:(NSNotification *)no
{
    /**
     *  更新进度
     */
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.uploadImageModle.progress >= 1
            || self.uploadImageModle.isSystemButton
            || self.uploadImageModle.imgUrl) {
            self.uploadStatusMaskView.alpha = 0;
        }else{
            self.uploadStatusMaskView.alpha = self.uploadImageModle.failed ? 0 : 1;
            [self.uploadStatusMaskView setProgress:self.uploadImageModle.progress animated:YES];
        }
    });
}

- (void)successStatusUpdate:(NSNotification *)no
{
    /**
     *  成功失败状态更新
     */
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.uploadImageModle.isFailed) {
            self.failedTipsLabel.alpha = 1.f;
            self.cancelButton.alpha = 0.f;
        }else{
            self.failedTipsLabel.alpha = 0.f;
            self.cancelButton.alpha = self.uploadImageModle.isSystemButton ?  0.f : 1.f;
        }
    });
}

#pragma mark - Second.赋值

- (void)setUploadImageModle:(YBUploadImageModel *)uploadImageModle
{
    _uploadImageModle = uploadImageModle;
    
    /**
     *  是否是添加资源按钮
     */
    if ([uploadImageModle isSystemButton]) {
        self.cancelButton.alpha = 0;
        self.imageButton.tag = -1001;
        [self.imageButton setImage:ZJIMAGE(uploadImageModle.imgUrl,
                                          uploadImageModle.imageNamed,
                                           ZJProjectLoadImageDefault).firstObject
                          forState:UIControlStateNormal];
        [self.imageButton setImage:ZJIMAGE(uploadImageModle.imgUrl,
                                           uploadImageModle.imageNamed,
                                           ZJProjectLoadImageDefault).lastObject
                          forState:UIControlStateHighlighted];
        self.uploadStatusMaskView.alpha = 0;
        self.failedTipsLabel.alpha = 0;
    }else{
        
        /**
         *  重置按钮
         */
        self.imageButton.tag = -1009;
        if (!uploadImageModle.originalImage
            && uploadImageModle.imgUrl) {
            
            [self.imageButton sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, uploadImageModle.imgUrl)] forState:UIControlStateNormal placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                _uploadImageModle.originalImage = image;
            }];
            [self.imageButton sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, uploadImageModle.imgUrl)] forState:UIControlStateHighlighted placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                _uploadImageModle.originalImage = image;
            }];
            
        }else{
            self.cancelButton.alpha = 1;
            [self.imageButton setImage:uploadImageModle.originalImage
                              forState:UIControlStateNormal];
            [self.imageButton setImage:uploadImageModle.originalImage
                              forState:UIControlStateHighlighted];
        }
    }
}

#pragma mark - Third.点击事件

- (void)reUploadTap:(UITapGestureRecognizer *)tap
{
    /**
     *  将重新上传视图，强行转换为UIButton
     *  作用：不报警告
     *  传递给代理后，只用于tag区分
     */
    if ([self.delegate respondsToSelector:@selector(composeHomePageImageCell:clickButton:model:)]) {
        [self.delegate composeHomePageImageCell:self clickButton:(UIButton *)self.failedTipsLabel model:self.uploadImageModle];
    }
}

- (void)cancelButtonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(composeHomePageImageCell:clickButton:model:)]) {
        [self.delegate composeHomePageImageCell:self clickButton:sender model:self.uploadImageModle];
    }
}

- (void)imageButtonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(composeHomePageImageCell:clickButton:model:)]) {
        [self.delegate composeHomePageImageCell:self clickButton:sender model:self.uploadImageModle];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
        [self registerNotification];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(20.f));
        make.left.top.mas_equalTo(self.imageButton).mas_offset(ADJUST_PERCENT_FLOAT(-7));
    }];
    
    [self.uploadStatusMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
    
    [self.failedTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.mas_equalTo(self.contentView);
    }];
}

- (void)dealloc
{
    [self removeNotification];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [self.contentView addSubview:self.imageButton];
    [self.contentView addSubview:self.cancelButton];
    [self.contentView addSubview:self.uploadStatusMaskView];
    [self.contentView addSubview:self.failedTipsLabel];
}

- (void)registerNotification
{
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(progressUpdate:)
                                      name:COMPOSE_UPLOADIMAGE_PROGRESS_NOTIFICATION
                                    object:nil];
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(successStatusUpdate:)
                                      name:COMPOSE_UPLOADIMAGE_ISSUCCESS_NOTIFICATION
                                    object:nil];
}

- (void)removeNotification
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:COMPOSE_UPLOADIMAGE_PROGRESS_NOTIFICATION object:nil];
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:COMPOSE_UPLOADIMAGE_ISSUCCESS_NOTIFICATION object:nil];
}

#pragma mark - Seventh.懒加载

- (YBDefaultLabel *)failedTipsLabel
{
    if (!_failedTipsLabel) {
        
        _failedTipsLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(9.f)
                                                    text:@"照片上传失败，点击重新上传"
                                               textColor:ZJCOLOR.color_c4];
        _failedTipsLabel.numberOfLines = 0;
        _failedTipsLabel.textAlignment = NSTextAlignmentCenter;
        _failedTipsLabel.alpha = 0;
        _failedTipsLabel.backgroundColor = [ZJCOLOR.color_c0 colorWithAlphaComponent:0.6];
        _failedTipsLabel.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reUploadTap:)];
        [_failedTipsLabel addGestureRecognizer:tap];
        
        _failedTipsLabel.tag = -1003;
        
    }
    return _failedTipsLabel;
}

- (M13ProgressViewPie *)uploadStatusMaskView
{
    if (!_uploadStatusMaskView) {
        
        _uploadStatusMaskView = [[M13ProgressViewPie alloc] init];
        _uploadStatusMaskView.alpha = 0;
        
        _uploadStatusMaskView.backgroundRingWidth = 0.5;
        //** 控件背景色 */
        _uploadStatusMaskView.backgroundColor = [UIColor clearColor];
        //** 进度条颜色 */
        _uploadStatusMaskView.primaryColor = [ZJCOLOR.color_c6 colorWithAlphaComponent:0.5];
        //** 圆环颜色 */
        _uploadStatusMaskView.secondaryColor = [ZJCOLOR.color_c6 colorWithAlphaComponent:0.5];
        
    }
    return _uploadStatusMaskView;
}

- (YBDefaultButton *)cancelButton
{
    if (!_cancelButton) {
        
        _cancelButton = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLISH
                                                           imageNamed:@"publish_off"
                                                                 type:ZJProjectButtonSetImage
                                                               target:self
                                                             selector:@selector(cancelButtonClick:)];
        _cancelButton.tag = -1002;
        
    }
    return _cancelButton;
}

- (YBDefaultButton *)imageButton
{
    if (!_imageButton) {
        _imageButton = [[YBDefaultButton alloc] init];
        [_imageButton addTarget:self
                         action:@selector(imageButtonClick:)
               forControlEvents:UIControlEventTouchUpInside];
        _imageButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageButton;
}

@end
