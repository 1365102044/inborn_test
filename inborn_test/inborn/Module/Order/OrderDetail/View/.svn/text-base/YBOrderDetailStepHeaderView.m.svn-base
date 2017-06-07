//
//  YBOrderDetailStepHeaderView.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailStepHeaderView.h"
#import "YBOrderDetailViewModel.h"

/**
 *  YBOrderDetailStepHeaderView
 */
NSString * const YBOrderDetailStepHeaderViewReuseIdentifier = @"YBOrderDetailStepHeaderViewReuseIdentifier";

@interface YBOrderDetailStepHeaderView()

@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray *titleLabelsArray;
@property (strong, nonatomic) IBOutletCollection(ZJBaseImageView) NSArray *statusLogoImageViewsArray;
@property (strong, nonatomic) IBOutletCollection(ZJBaseImageView) NSArray *stepLineImageViewsArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *statusLogoImageViewHeightWidthCons;

@end

@implementation YBOrderDetailStepHeaderView

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setOrderDetailViewModel:(YBOrderDetailViewModel *)orderDetailViewModel
{
    _orderDetailViewModel = orderDetailViewModel;
    
    /**
     *  判断状态展示不同的样式
     */
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 10
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 20
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 21
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 22) {
        
        [self setStatusWithIndex:0 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"待付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"待发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"待收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }
    
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 30
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 31) {
        [self setStatusWithIndex:1 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"待发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"待收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }
    
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 40
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 41) {
        [self setStatusWithIndex:2 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"已发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"待收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }
    
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 50
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 51) {
        [self setStatusWithIndex:3 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"已发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"已收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }
    
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 61
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 52
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 60) {
        [self setStatusWithIndex:4 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"已发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"已收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"已确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }
}


/**
 我卖出的订单详情
 */
- (void)setSelloutdeatilModel:(YBMySellOutModel *)selloutdeatilModel
{
    _selloutdeatilModel = selloutdeatilModel;
    
    if (selloutdeatilModel.saleShowStatus == 10) {
        [self setStatusWithIndex:0 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"待付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"待发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"待收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];

    }else if (selloutdeatilModel.saleShowStatus == 20
              || selloutdeatilModel.saleShowStatus == 21
              || selloutdeatilModel.saleShowStatus == 22
              || selloutdeatilModel.saleShowStatus == 23
              || selloutdeatilModel.saleShowStatus == 24){
        [self setStatusWithIndex:1 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"待发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"待收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }else if (selloutdeatilModel.saleShowStatus == 30
              || selloutdeatilModel.saleShowStatus == 31){
        [self setStatusWithIndex:2 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"已发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"待收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }else if (selloutdeatilModel.saleShowStatus == 40
              || selloutdeatilModel.saleShowStatus == 41){
        [self setStatusWithIndex:3 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"已发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"已收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"待确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }else if (selloutdeatilModel.saleShowStatus == 50
              || selloutdeatilModel.saleShowStatus == 51){
        [self setStatusWithIndex:4 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                                 @"logoImageViewNamed":@"orderdetails_order_icon"},
                                               @{@"title":ZJSTRING(@"已付款"),
                                                 @"logoImageViewNamed":@"orderdetails_pay"},
                                               @{@"title":ZJSTRING(@"已发货"),
                                                 @"logoImageViewNamed":@"orderdetails_send"},
                                               @{@"title":ZJSTRING(@"已收货"),
                                                 @"logoImageViewNamed":@"orderdetails_receive"},
                                               @{@"title":ZJSTRING(@"已确认"),
                                                 @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
    }
    
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}
- (void)test
{
    [self setStatusWithIndex:0 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                              @"logoImageViewNamed":@"orderdetails_order_icon"},
                                            @{@"title":ZJSTRING(@"待付款"),
                                              @"logoImageViewNamed":@"orderdetails_pay"},
                                            @{@"title":ZJSTRING(@"待发货"),
                                              @"logoImageViewNamed":@"orderdetails_send"},
                                            @{@"title":ZJSTRING(@"待收货"),
                                              @"logoImageViewNamed":@"orderdetails_receive"},
                                            @{@"title":ZJSTRING(@"待确认"),
                                              @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:1];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupCustomUI];
    
    [self setStatusWithIndex:4 dataArray:@[@{@"title":ZJSTRING(@"已下单"),
                                             @"logoImageViewNamed":@"orderdetails_order_icon"},
                                           @{@"title":ZJSTRING(@"已付款"),
                                             @"logoImageViewNamed":@"orderdetails_pay"},
                                           @{@"title":ZJSTRING(@"已发货"),
                                             @"logoImageViewNamed":@"orderdetails_send"},
                                           @{@"title":ZJSTRING(@"已收货"),
                                             @"logoImageViewNamed":@"orderdetails_receive"},
                                           @{@"title":ZJSTRING(@"已确认"),
                                             @"logoImageViewNamed":@"orderdetails_confirmed"}] alph:0];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    ZJBaseView *bgView = [[ZJBaseView alloc] init];
    self.backgroundView = bgView;
    
    self.titleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(18.f);
    [self.statusLogoImageViewHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                          NSUInteger idx,
                                                                          BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(36.f);
    }];
}

/**
 配置状态配置

 @param index               下标
 @param dataArray           数据
 */
- (void)setStatusWithIndex:(NSInteger)index
                 dataArray:(NSArray *)dataArray
                      alph:(CGFloat)alph
{
    [self.titleLabelsArray enumerateObjectsUsingBlock:^(YBDefaultLabel *  _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        NSDictionary *dict = dataArray[idx];
        ZJBaseImageView *logoImageView = self.statusLogoImageViewsArray[idx];
        ZJBaseImageView *stepLineImageView;
        
        if (idx <= self.titleLabelsArray.count - 2) {
            stepLineImageView = self.stepLineImageViewsArray[idx];
        }
        
        obj.font = SYSTEM_REGULARFONT(12.f);
        obj.text = dict[@"title"];
        obj.alpha = alph;
        stepLineImageView.alpha = alph;
        logoImageView.alpha = alph;
        
        if (idx == 0) {
            logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_ORDERDETAIL,
                                                 dict[@"logoImageViewNamed"],
                                                 ZJProjectLoadImageDefault);
            obj.textColor = ZJCOLOR.color_c6;
        }else{
            if (idx <= index) {
                
                logoImageView.image = ZJIMAGE(IMAGEFILEPATH_ORDERDETAIL,
                                              dict[@"logoImageViewNamed"],
                                              ZJProjectLoadImageDefault).lastObject;
                obj.textColor = ZJCOLOR.color_c6;
                
            }else{
            
                logoImageView.image = ZJIMAGE(IMAGEFILEPATH_ORDERDETAIL,
                                              dict[@"logoImageViewNamed"],
                                              ZJProjectLoadImageDefault).firstObject;
                obj.textColor = ZJCOLOR.color_c5;
            }
            
        }
        
    }];
    
    [self.stepLineImageViewsArray enumerateObjectsUsingBlock:^(ZJBaseImageView *  _Nonnull obj,
                                                               NSUInteger idx,
                                                               BOOL * _Nonnull stop) {
        
        if (idx <= index) {

            obj.image = ZJIMAGE(IMAGEFILEPATH_ORDERDETAIL,
                                @"orderdetails_dot",
                                ZJProjectLoadImageDefault).lastObject;
            
        }else{
            
            obj.image = ZJIMAGE(IMAGEFILEPATH_ORDERDETAIL,
                                @"orderdetails_dot",
                                ZJProjectLoadImageDefault).firstObject;
        
        }
    }];

}

#pragma mark - Seventh.懒加载

@end
