//
//  YBGoodsDeatilModel.m
//  inborn
//
//  Created by 刘文强 on 2017/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilModel.h"

@implementation YBGoodsDeatilGuessGodosModel

@end

@implementation YBGoodsImagesModel

@end

@implementation YBGoodsSpecListModel

@end

@implementation YBGoodsCollectionsModel

-(NSString *)headImage
{
    return ZJIMAGEURLSTRING(ZJProjectImageUrlStringHeaderIcon, _headImage);
}

@end

@implementation YBBrandModel

@end

@implementation YBGoodsDeatilModel

/**
 个人信息模型
 */
-(void)setMember:(NSDictionary *)member
{
    if (member == nil) return;
    
    _MemberModel = [YBMemberModel modelWithDictionary:member];
}

/**
 品牌
 */
- (void)setBrand:(NSDictionary *)brand
{
    if (brand == nil) return;
    _BrandModel = [YBBrandModel modelWithDictionary:brand];
}

/**
 详情 底部状态条的状态
 * 0 预展商品，1未售出，2未出售可支付定金，3已售罄，4他人付款中，5本人付款中 ，6 已下架
 */
- (BoomBarType)boombarType
{
    if (_showStatus ==0) return willStartSellType;
    if (_showStatus == 1) return immediateGoBuyNoEnsureMoneyType;
    if (_showStatus == 2) return immediateGoBuyType;
    if (_showStatus == 3) return alearySellOutType;
    if (_showStatus == 4) return paymentBuyingType;
    if (_showStatus == 5) return continuePaymentType;
    if (_showStatus == 6) return  goodsUndershelf;
    return boomBarNuknowType;
}

/**
 把收藏数组转成收藏模型数组返回
 */
- (void)setCollections:(NSArray *)collections
{
    if (collections== nil ||collections.count ==0) return;
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = [NSDictionary dictionary];
    YBGoodsCollectionsModel * collectionsModel;
    for (dict in collections) {
        collectionsModel = [YBGoodsCollectionsModel modelWithDictionary:dict];
        [tempArr addObject:collectionsModel];
    }
    _collections = tempArr;
}

/**
 属性模型
 */
- (void)setGoodsSpecList:(NSArray *)goodsSpecList
{
   if (goodsSpecList== nil ||goodsSpecList.count ==0) return;
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = [NSDictionary dictionary];
    YBGoodsSpecListModel * specListModel;
    for (dict in goodsSpecList) {
        specListModel = [YBGoodsSpecListModel modelWithDictionary:dict];
        [tempArr addObject:specListModel];
    }
    _goodsSpecList = tempArr;
}

/**
 商品图片地址模型
 */
-(void)setGoodsImgs:(NSArray *)goodsImgs
{
    if (goodsImgs== nil ||goodsImgs.count ==0) return;
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = [NSDictionary dictionary];
    YBGoodsImagesModel * goodsImagesModel;
    for (dict in goodsImgs) {
        goodsImagesModel = [YBGoodsImagesModel modelWithDictionary:dict];
        [tempArr addObject:goodsImagesModel];
    }
    _goodsImgs = tempArr;
}

- (CGFloat)collectHeaderViewHeight
{
    CGFloat tempheight = ADJUST_PERCENT_FLOAT(60);
    NSString *des = [NSString stringWithFormat:@"%@ %@",_BrandModel.brandCnName,_sellerDesc];
    CGFloat  descHEI = [des ex_getSpaceLabelHeightwithSpeace:10 withFont:SYSTEM_MEDIUMFONT(13) withWidth:SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(62+57)];
    if (!descHEI) {
        descHEI = ADJUST_PERCENT_FLOAT(25);
    }
    CGFloat imageWith                   = (SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(57+62))/3;
    CGFloat goodsImageHEI = 0.0 ;
    if (_goodsImgs.count) {
        if (_goodsImgs.count<=3) {
            goodsImageHEI = imageWith;
        }else if (_goodsImgs.count<=6){
            goodsImageHEI = imageWith*2+10;
        }else if (_goodsImgs.count<=9) {
            goodsImageHEI = imageWith*3+20;
        }
    }else {
        goodsImageHEI = 0;
    }
    
    if (iPhone5SE) {
        return ADJUST_PERCENT_FLOAT(tempheight + descHEI + goodsImageHEI+75+25);
    }else{
        return ADJUST_PERCENT_FLOAT(tempheight + descHEI + goodsImageHEI+75);
    }
}
@end
