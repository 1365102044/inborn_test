//
//  YBUploadImageModel.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBUploadImageModel : ZJBaseModel

/**
 选中原图
 */
@property (nonatomic, strong) UIImage *originalImage;

/**
 是否是系统按钮
 */
@property (nonatomic, assign) BOOL isSystemButton;

/**
 图片路径
 */
@property (nonatomic, copy) NSString *imgUrl;

/**
 imageSort-图片排序
 */
@property (nonatomic, copy) NSString *imageSort;

/**
 图片名称
 */
@property (nonatomic, copy) NSString *imageNamed;

/**
 num
 */
@property (nonatomic, assign) NSInteger num;

/**
 是否成功 YES.上传失败  NO.上传成功
 */
@property (nonatomic, assign, getter=isFailed) BOOL failed;

/**
 上传进度
 */
@property (nonatomic, assign) CGFloat progress;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *customId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *imgW;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *imgH;

/**
 服务器图片名称
 */
@property (nonatomic, copy) NSString *imgName;

/**
 <#descrption#>
 */
@property (nonatomic, strong) UIImage *placeholderImage;

@end
