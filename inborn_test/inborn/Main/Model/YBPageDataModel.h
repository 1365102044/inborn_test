//
//  YBPageDataModel.h
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBPageDataModel : ZJBaseModel

/**
 当前页号
 */
@property (nonatomic, copy) NSString *pageNum;


/**
 页面大小
 */
@property (nonatomic, copy) NSString *pageSize;

/**
 总页数
 */
@property (nonatomic, copy) NSString *pages;

/**
 总条数
 */
@property (nonatomic, copy) NSString *total;

//pageNum = 1;
//pageSize = 16;
//pages = 2;
//total = 17;

//** =========================================================================================== */
//** ==========================================老项目参数========================================= */
//** =========================================================================================== */

/**
 totalRows
 */
@property (nonatomic, copy) NSString *totalRows;

/**
 curPage
 */
@property (nonatomic, copy) NSString *curPage;

@end
