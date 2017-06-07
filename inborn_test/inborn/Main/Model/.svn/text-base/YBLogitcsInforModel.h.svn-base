//
//  YBLogitcsInforModel.h
//  inborn
//
//  Created by 刘文强 on 2017/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseModel.h"

@interface YBLogitcsRoutesModle : ZJBaseModel

@property(nonatomic,copy) NSString *  address;
@property(nonatomic,copy) NSString *  opcode;
@property(nonatomic,copy) NSString *  remark;
@property(nonatomic,copy) NSString *  time;

/**
 内容高度
 */
@property(nonatomic,assign) CGFloat  contentHeight;
@property(nonatomic,assign) CGFloat  descHeight;

@end

@interface YBLogitcsInforModel : ZJBaseModel

@property(nonatomic,copy) NSString * expComName;
@property(nonatomic,copy) NSString  *expressNum;
@property(nonatomic,strong) NSArray * routes;

@property(nonatomic,strong) NSArray * routesModelArr;

@end
/**
 {
 -"data": {
 -"routes": [
 -{
 "address": "广州市",
 "opcode": "50",
 "remark": "已收件",
 "time": "2015-06-16 18:08:23"
 },
 -{
 "address": "广州市",
 "opcode": "3036",
 "remark": "快件在 <font color='red'>广州集散中心 </font>,准备送往下一站 <font color='red'>深圳集散中心\t </font>",
 "time": "2015-06-16 21:54:57"
 },
 -{
 "address": "深圳市",
 "opcode": "3036",
 "remark": "快件在 <font color='red'>深圳集散中心\t </font>,准备送往下一站 <font color='red'>北京集散中心\t </font>",
 "time": "2015-06-17 13:42:00"
 },
 -{
 "address": "北京市",
 "opcode": "3137",
 "remark": "快件到达北京集散中心",
 "time": "2015-06-17 15:15:27"
 },
 -{
 "address": "北京市",
 "opcode": "3036",
 "remark": "快件在 <font color='red'>北京集散中心\t </font>,准备送往下一站 <font color='red'>北京 </font>",
 "time": "2015-06-17 17:09:30"
 },
 -{
 "address": "北京市",
 "opcode": "44",
 "remark": "正在派件..(派件人:黄飞鸿,电话:15889377777)",
 "time": "2015-06-17 18:33:11"
 },
 -{
 "address": "北京市",
 "opcode": "70",
 "remark": "与客户约定更改派送时间",
 "time": "2015-06-17 21:06:21"
 },
 -{
 "address": "北京市",
 "opcode": "44",
 "remark": "正在派件..(派件人:黄飞鸿,电话:15889377777)",
 "time": "2015-06-18 08:02:26"
 },
 -{
 "address": "北京市",
 "opcode": "80",
 "remark": "派件已签收",
 "time": "2015-06-18 09:30:11"
 }
 ],
 "expComName": "顺丰",
 "expressNum": "444004726041"
 },
 "errorMsg": "",
 "status": "1",
 "v": "2.0"
 }
 */
