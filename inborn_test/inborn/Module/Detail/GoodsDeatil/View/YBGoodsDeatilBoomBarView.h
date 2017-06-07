//
//  YBGoodsDeatilBoomBarView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBGoodsDeatilModel.h"
#import "YBGoddsDeatilCutTimeView.h"

typedef void(^clickBoomViewBtnBlock)(NSInteger btntag);
@interface YBGoodsDeatilBoomBarView : ZJBaseView
- (void)setGoodsDeatilBoomBarSubviewWithType:(BoomBarType)barType dataModel:(YBGoodsDeatilModel *)dataModel clickboomviewBtnBlock:(clickBoomViewBtnBlock)clickBoomViewBtnBlock;
@property(nonatomic,strong) YBGoddsDeatilCutTimeView *cutDownTimeview;

/**
 关注
 */
- (void)setLikeImageViewWithIscollect:(BOOL)iscollect;

@end
