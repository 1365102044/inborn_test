//
//  YBTestMianViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/5/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBTestMianViewController.h"
#import "YBAttributedStringLabel.h"

@interface YBTestMianViewController ()

@end

@implementation YBTestMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YBAttributedStringLabel *lable = [[YBAttributedStringLabel alloc]init];
    lable.numberOfLines = 0;
    lable.backgroundColor = [UIColor redColor];
    lable.lineBreakMode = UILineBreakModeCharacterWrap;
//    [self setRowSpace:20 testlable:lable str:@"的卡回到卡山东快书的饭卡还是赶快撒的关怀啊上啊上的法式蛋糕请问而且而且玩儿去玩儿千瓦时" font:15];
    [lable  setAttributedStringWithContentArray:@[@{  @"color" : [UIColor brownColor],
                                                       @"content" : @"的卡回到卡山东快书的饭卡还是赶快撒的关怀啊上啊ewewe上的法式蛋糕请问而且而且玩儿去玩儿千",
                                                       @"size" : [UIFont systemFontOfSize:15],
                                                       @"lineSpacing": @20
                                                       }]];
    lable.frame = CGRectMake(40, 100, 100, [self ex_getSpaceLabelHeightwithSpeace:20 withFont:[UIFont systemFontOfSize:15] withWidth:100 testStr:lable.text]);
    [self.view addSubview:lable];
    
    
    YBAttributedStringLabel *lable1 = [[YBAttributedStringLabel alloc]init];
    lable1.numberOfLines = 0;
    lable1.backgroundColor = [UIColor redColor];
//    [self setRowSpace:20 testlable:lable1 str:@"的卡回到卡" font:15];
    [lable1  setAttributedStringWithContentArray:@[@{  @"color" : [UIColor brownColor],
                                                       @"content" : @"的卡回qwerwe到",
                                                       @"size" : [UIFont systemFontOfSize:15],
                                                       @"lineSpacing": @20
                                                       }]];
    lable1.frame = CGRectMake(200, 100, 100, [self ex_getSpaceLabelHeightwithSpeace:20 withFont:[UIFont systemFontOfSize:15] withWidth:100 testStr:lable1.text]);
    [self.view addSubview:lable1];
    
    YBAttributedStringLabel *lable2 = [[YBAttributedStringLabel alloc]init];
    [lable2  setAttributedStringWithContentArray:@[@{  @"color" : [UIColor brownColor],
                                                       @"content" : @"的卡回到卡山东快书的饭卡还是qwerwerrqwer",
                                                       @"size" : [UIFont systemFontOfSize:15],
                                                       @"lineSpacing": @20
                                                       }]];
    lable2.numberOfLines = 0;
    lable2.backgroundColor = [UIColor redColor];
    lable2.lineBreakMode = UILineBreakModeCharacterWrap;
//    [self setRowSpace:20 testlable:lable2 str: @"的卡回到卡山东快书的饭卡还是qwerwerrqwer" font:15];
    lable2.frame = CGRectMake(200, 200, 100, [self ex_getSpaceLabelHeightwithSpeace:20 withFont:[UIFont systemFontOfSize:15] withWidth:100 testStr:lable2.text]);
    [self.view addSubview:lable2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)ex_getSpaceLabelHeightwithSpeace:(CGFloat)lineSpace
                                  withFont:(UIFont*)font
                                 withWidth:(CGFloat)width
                                   testStr:(NSString *)testStr
{
    NSMutableParagraphStyle *paraStyle          = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing                       = lineSpace;
    NSDictionary *dic                           = @{NSFontAttributeName:font,
                                                    NSParagraphStyleAttributeName:paraStyle,
                                                    NSKernAttributeName:@1.5f};
    CGSize size                                 = [testStr boundingRectWithSize:CGSizeMake(width,MAXFLOAT)
                                                                        options:NSStringDrawingUsesLineFragmentOrigin |
                                                   NSStringDrawingUsesFontLeading
                                                                     attributes:dic
                                                                        context:nil].size;
    return size.height-20 < 20 ? size.height : size.height - 20;
}

/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace
          testlable:(UILabel *)testlable
                str:(NSString *)str
               font:(NSInteger)font
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0, [str length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:NSMakeRange(0, [str length])];
    
    testlable.attributedText = attributedString;
}


@end
