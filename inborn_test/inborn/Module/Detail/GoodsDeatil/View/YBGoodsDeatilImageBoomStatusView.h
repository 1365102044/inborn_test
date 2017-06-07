//
//  YBGoodsDeatilImageBoomStatusView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBGoodsDeatilBoomBarView.h"
#import "YBGoodsDeatilModel.h"
#import "YBGoddsDeatilCutTimeView.h"

typedef void(^clickboomviewBlock)(NSInteger tag);
@interface YBGoodsDeatilImageBoomStatusView : ZJBaseView
@property(nonatomic,strong) YBGoodsDeatilModel * goodsDeatilModel;
@property(nonatomic,strong) YBGoddsDeatilCutTimeView *cutDownTimeview;
@property(nonatomic,copy) clickBoomViewBtnBlock  clickBlock;

@end
