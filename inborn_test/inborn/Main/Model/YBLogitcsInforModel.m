//
//  YBLogitcsInforModel.m
//  inborn
//
//  Created by 刘文强 on 2017/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLogitcsInforModel.h"
#import "NSString+Extension.h"

@interface YBLogitcsRoutesModle ()

@end

@implementation YBLogitcsRoutesModle

- (CGFloat)contentHeight
{
    _contentHeight = self.descHeight +ADJUST_PERCENT_FLOAT(65);
    return _contentHeight;
}

- (CGFloat)descHeight
{
    NSString *descStr;
    descStr = [NSString stringWithFormat:@"%@",_remark];
    if (_address) {
        descStr = [NSString stringWithFormat:@"【%@】%@",_address,_remark];
    }
    NSData *data = [descStr dataUsingEncoding:NSUnicodeStringEncoding];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSMutableAttributedString *html = [[NSMutableAttributedString alloc]initWithData:data
                                                                             options:options
                                                                  documentAttributes:nil
                                                                               error:nil];
    
    CGFloat height =  [html boundingRectWithSize:CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(60)), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    height =  [descStr ex_getSpaceLabelHeightwithSpeace:5
                                               withFont:SYSTEM_REGULARFONT(14)
                                              withWidth:SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(60)];
    if (height < 30) {
        return  15;
    }else if(height >=30){
        return 45;
    }else if (height >= 40){
        return 70;
    }else{
        return height + 30;
    }
    return height;
}

@end


@implementation YBLogitcsInforModel

- (NSArray *)routesModelArr
{
    if (_routes.count<=0) {
        return nil;
    }
    NSMutableArray *temparr = [NSMutableArray array];
    
    for (NSDictionary *dict in _routes) {
         [temparr addObject:[YBLogitcsRoutesModle modelWithDictionary:dict]];
    }
    _routesModelArr = temparr;
    return _routesModelArr;
}


@end
