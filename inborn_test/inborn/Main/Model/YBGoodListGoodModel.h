//
//  YBGoodListGoodModel.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"
#import "YBGoodListCollectionModel.h"

@interface YBGoodListGoodModel : ZJBaseModel

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *activityType;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *catId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *catName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consignWay;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *countBrowse;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *countCollection;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsCode;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsDesc;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsLabel;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsMinutia;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsStatus;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *customId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *mallPrice;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *rectangleImage;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *rectangleImageH;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *rectangleImageW;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerDesc;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerNickName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *seriesId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *seriesName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *squareImage;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBGoodListCollectionModel *goodListCollectionModel;

@property(nonatomic,copy) NSString * goodsId;


//** =========================================================================================== */
//** ===========================================本地添加========================================== */
//** =========================================================================================== */

/**
 当前数组中所处的下标位置
 */
@property (nonatomic, assign) NSInteger currentIndex;

/**
 记录当前item的实际宽度
 */
@property (nonatomic, assign) CGFloat itemWidth;

/**
 通过宽高比例计算出item 的实际高度
 */
@property (nonatomic, assign) CGFloat itemHeight;

/**
 文字区高度
 */
@property (nonatomic, assign) CGFloat textAreHeight;

//activityType = 0;
//brandId = 1;
//brandName = "";
//catId = 0;
//catName = "";
//consignWay = 1;
//countBrowse = 0;
//countCollection = 0;
//goodsCode = "";
//goodsDesc = "";
//goodsLabel = "";
//goodsMinutia = "";
//goodsName = "";
//goodsStatus = 60;
//id = 10001;
//mallPrice = 1;
//rectangleImage = "http://inbid-pro.img-cn-beijing.aliyuncs.com/3/9054bb2989f0441bbcade0f2db419a69.jpg?x-oss-process=style/ah450";
//rectangleImageH = 0;
//rectangleImageW = 0;
//sellerDesc = "\U5b9e\U6253\U5b9e\U5927\U5e08";
//sellerId = 0;
//sellerNickName = "";
//seriesId = 0;
//seriesName = "";
//squareImage = "http://inbid-pro.img-cn-beijing.aliyuncs.com/3/7d7f49e4abbb49198589880f6b70cd26.jpg?x-oss-process=style/ss450";

@end
