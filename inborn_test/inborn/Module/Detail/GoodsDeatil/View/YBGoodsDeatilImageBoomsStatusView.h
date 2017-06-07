//
//  YBGoodsDeatilImageBoomsStatusView.h
//  inborn
//
//  Created by 刘文强 on 2017/4/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBGoodsDeatilModel.h"
#import "YBGoddsDeatilCutTimeView.h"

typedef void(^clickbtnBlock)(NSString *sender);
@interface YBGoodsDeatilImageBoomsStatusView : ZJBaseView

@property(nonatomic,strong) YBGoodsDeatilModel * goodsDeatilModel;
@property(nonatomic,strong) YBGoddsDeatilCutTimeView *cutDownTimeview;
@property(nonatomic,copy) clickbtnBlock clickBtnBlock;

@end
