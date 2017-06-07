//
//  YBGoodsDeatilModel.h
//  inborn
//
//  Created by 刘文强 on 2017/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"
#import "YBMemberModel.h"
#import "YBGoodListGoodModel.h"
@class YBGoodsDeatilBoomBarView;

 /**
  商品详细中的 猜你喜欢的大模型
  */
@interface YBGoodsDeatilGuessGodosModel : ZJBaseModel
/**
 总共的页数
 */
@property(nonatomic,assign) NSInteger  pages;
/**
 每页的数目
 */
@property(nonatomic,assign) NSInteger  pageSize;
/**
 总数
 */
@property(nonatomic,assign) NSInteger  total;
/**
 当前页数
 */
@property(nonatomic,assign) NSInteger   pageNum;

@property(nonatomic,strong) NSArray * pageData;

@end

/**
 商品图
 */
@interface YBGoodsImagesModel : ZJBaseModel
@property(nonatomic,copy) NSString *  imgUrl;
@end

/**
 商品信息模型
 */
@interface YBGoodsSpecListModel : ZJBaseModel
@property(nonatomic,copy) NSString *  attrId;
@property(nonatomic,copy) NSString *  attrName;
@property(nonatomic,copy) NSString *  attrValueColor;
@property(nonatomic,copy) NSString *  attrValueId;
@property(nonatomic,copy) NSString *  attrValueName;
@property(nonatomic,copy) NSString *  attrValuePic;
@property(nonatomic,copy) NSString *  goodsId;
@property(nonatomic,copy) NSString *  customId;

@end
/**
 attrId = 2;
 attrName = "\U6750\U8d281";
 attrValueColor = "\U767d\U8272";
 attrValueId = 5;
 attrValueName = "\U725b\U76ae";
 attrValuePic = "http://inbornpai-dev.img-cn-beijing.aliyuncs.com/3/ad9ce3a6069545aaa56daf52d2f61ff5.jpg";
 goodsId = 657054300009987;
 id = 9;
 isColor = 1;
 isPic = 1;
 sortSeq = 1;
 */

/**
 收藏用户列表模型
 */
@interface YBGoodsCollectionsModel : ZJBaseModel
@property(nonatomic,copy) NSString  *headImage;
@property(nonatomic,copy) NSString *  customId;

@end

/**
 品牌模型
 */
@interface YBBrandModel : ZJBaseModel

@property(nonatomic,copy) NSString *  brandCnName;
@property(nonatomic,copy) NSString *  brandEnName;
@property(nonatomic,copy) NSString *  brandPic;
@property(nonatomic,copy) NSString *  blackPic;
@property(nonatomic,copy) NSString *  whitePic;


@end
/**
 brandCnName = "\U7231\U9a6c\U4ed5";
 brandEnName = Hermes;
 brandPic = "http://inbornpai-dev.img-cn-beijing.aliyuncs.com/3/67252274c7384f08a3cbd7698aabbf65.jpg";

 */

@interface YBGoodsDeatilModel : ZJBaseModel

/**
 商品名称
 */
@property (nonatomic, copy) NSString *goodsName;

/**
 商品图片
 */
@property (nonatomic, copy) NSString *squareImage;

/**
 * 编号
 */
@property(nonatomic,copy) NSString  *goodsId;

/**
 * 商品状态：1不符合，10待审核，20待确认，30待付费，40待鉴定，50待上架，60出售中，70已出售，71已售出下架，80已下架，90待退回，91退回中，92已退回，93已取消
 */
@property(nonatomic,assign) NSInteger  goodsStatus;

/**
 * 活动类型：0无，1限时抢购，2竞拍，
 */
@property(nonatomic,assign) NSInteger  activityType;

/**
 * 发布类型：1平台，2个人
 */
@property(nonatomic,assign) NSInteger  publishType;

/**
 * 发布方式：1平台，2个人，3平台代发布
 */
@property(nonatomic,assign) NSInteger  publishWay;

/**
 * 卖家ID
 */
@property(nonatomic,copy) NSString * sellerId;

/**
 * 卖家描述
 */
@property(nonatomic,copy) NSString *  sellerDesc;

/**
 * 卖家商品配件：发票，保修卡(多个用逗号隔开)
 */
@property(nonatomic,copy) NSString * sellerGoodsParts;

/**
 * 商品细节
 */
@property(nonatomic,copy) NSString *  goodsMinutia;

/**
 * 商城价（单位：分）
 */
@property(nonatomic,copy) NSString*  mallPrice;

/**
 * 是否允许定金支付：0不允许，1允许
 */
@property(nonatomic,assign) NSInteger  isAllowBargainPay;

/**
 * 定金（单位：分）
 */
@property(nonatomic,copy) NSString * bargainMoney;

/**
 * 视频地址
 */
@property(nonatomic,copy) NSString *  videoUrl;

/**
 * 商品关注数
 */
@property(nonatomic,assign) NSInteger  countCollection;

/**
 * 商品浏览数
 */
@property(nonatomic,assign) NSInteger  countBrowse;

/**
 * 分类名称
 */
@property(nonatomic,copy) NSString * catName;

/**
 * 是否收藏，1表示收藏
 */
@property(nonatomic,assign) NSInteger  isCollect;

/**
 * 品牌
 */
@property(nonatomic,strong) NSDictionary * brand;

@property(nonatomic,strong) YBBrandModel * BrandModel;

/**
 * 用户信息
 */
@property(nonatomic,strong) NSDictionary * member;

@property(nonatomic,strong) YBMemberModel * MemberModel;

/**
 * 商品图片
 */
@property(nonatomic,strong) NSArray * goodsImgs;

/**
 * 商品属性
 */
@property(nonatomic,strong) NSArray * goodsSpecList;

/**
 * 收藏用户列表
 */
@property(nonatomic,strong) NSArray * collections;

/**
 * 0预展商品，1未售出，2未出售可支付定金，3已售罄，4他人付款中，5本人付款中
 */
@property(nonatomic,assign) NSInteger  showStatus;


/**
 底部状态条的状态
 */
@property(nonatomic,assign) BoomBarType  boombarType;

@property(nonatomic,assign) CGFloat  collectHeaderViewHeight;


/**
 猜你喜欢 模型数组
 */
@property(nonatomic,strong) NSArray * guessDataModelArr;

/**
 * 倒计时时间差
 */
@property(nonatomic,assign) double  diffTime;

/**
 订单号
 */
@property(nonatomic,copy) NSString * orderId;

@end
