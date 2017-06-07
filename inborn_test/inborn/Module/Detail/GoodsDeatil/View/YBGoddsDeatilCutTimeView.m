//
//  YBGoddsDeatilCutTimeView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoddsDeatilCutTimeView.h"
#import "ZJTimerManager.h"
//** 16进制颜色 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface YBGoddsDeatilCutTimeView (){
    CGFloat _passTime;
}
@property (strong, nonatomic)  UILabel *dayLabel;
@property (strong, nonatomic)  UILabel *hourLabel;
@property (strong, nonatomic)  UILabel *minuteLabel;
@property (strong, nonatomic)  UILabel *secondLabel;
@property(nonatomic,strong) UILabel * spaceLable1;
@property(nonatomic,strong) UILabel * spaceLable2;
@property(nonatomic,strong) UILabel * spaceLable3;
@end

@implementation YBGoddsDeatilCutTimeView

/**
 移除通知
 */
-(void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:TIMER_NOTIFICATION object:nil];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
        
        /**
         倒计时通知
         */
        [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(timerAction) name:TIMER_NOTIFICATION object:nil];
    }
    return self;
}
///布局UI
-(void)setUI{
    
    self.spaceLable1 = [self setspaclable];
    [self addSubview:self.spaceLable1];
    
    self.spaceLable2 = [self setspaclable];
    [self addSubview:self.spaceLable2];
    
    self.spaceLable3 = [self setspaclable];
    self.spaceLable3.text = @".";
    [self addSubview:self.spaceLable3];
 
    self.dayLabel =[self setlable];
    [self addSubview:self.dayLabel];
    
    
    self.hourLabel = [self setlable];
    [self addSubview:self.hourLabel];
    
    self.minuteLabel = [self setlable];
    [self addSubview:self.minuteLabel];
    
    
    self.secondLabel = [self setlable];
    [self addSubview:self.secondLabel];
    
    _passTime=0.0;
}

- (UILabel *)setspaclable
{
    
    UILabel *lable = [[UILabel alloc]init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = SYSTEM_LIGHTFONT(12);
    lable.text = @":";
    lable.textColor = ZJCOLOR.color_c0;
    return lable;
}

- (UILabel *)setlable
{
    UIColor *lableBackcolor =UIColorFromRGB(0x6e7273);
    UILabel *lable = [[UILabel alloc]init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = SYSTEM_LIGHTFONT(12);
    lable.textColor = ZJCOLOR.color_c0;
    lable.backgroundColor = lableBackcolor;
    lable.layer.masksToBounds = YES;
    lable.layer.cornerRadius = 3;
    lable.alpha = 0.7;
    return lable;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat label_width = ADJUST_PERCENT_FLOAT(26);
    CGFloat label_Height = label_width;
    CGFloat spaceW = ADJUST_PERCENT_FLOAT(10);
    
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(label_width, label_Height));
        make.left.mas_equalTo(self).mas_offset(0);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.spaceLable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.dayLabel.mas_height);
        make.width.mas_equalTo(spaceW);
        make.left.mas_equalTo(self.dayLabel.mas_right);
        make.centerY.mas_equalTo(self);
    }];
    [self.hourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.dayLabel);
        make.left.mas_equalTo(self.spaceLable1.mas_right);
        make.centerY.mas_equalTo(self);
    }];
    [self.spaceLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.spaceLable1);
        make.left.mas_equalTo(self.hourLabel.mas_right);
        make.centerY.mas_equalTo(self);
    }];
    [self.minuteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.dayLabel);
        make.left.mas_equalTo(self.spaceLable2.mas_right);
        make.centerY.mas_equalTo(self);

    }];
    [self.spaceLable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.spaceLable1);
        make.left.mas_equalTo(self.minuteLabel.mas_right);
        make.centerY.mas_equalTo(self);
    }];
    [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.dayLabel);
        make.left.mas_equalTo(self.spaceLable3.mas_right);
        make.centerY.mas_equalTo(self);

    }];
}


//得到未来某个日期的时间戳，与当前时间戳相比，得到两者的时间差，生成定时器
- (void)setTimeInterval:(double)timeInterval
{
    /*
     NSDateFormatter *dataFormatter = [[NSDateFormatter alloc] init];
     dataFormatter.dateFormat = @"MM/dd/yyyy HH:mm:ss.SSS";
     
     //获取当前系统的时间，并用相应的格式转换
     [dataFormatter stringFromDate:[NSDate date]];
     NSString *currentDayStr = [dataFormatter stringFromDate:[NSDate date]];
     NSDate *currentDate = [dataFormatter dateFromString:currentDayStr];
     
     //优惠结束的时间，也用相同的格式去转换
     NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval/1000.0];
     NSString *deadlineStr = [dataFormatter stringFromDate:date];
     NSDate *deadlineDate = [dataFormatter dateFromString:deadlineStr];
     
     _timeInterval=[deadlineDate timeIntervalSinceDate:currentDate]*1000;
     
     */
    _timeInterval = timeInterval ;
    
    
    if (_timeInterval!=0)
    {
        
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:0.1f];
        
//        //时间间隔是100毫秒，也就是0.1秒
//        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//        
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
//        [_timer fireDate];
    }else{
        self.dayLabel.text = @"00";
        self.hourLabel.text = @"00";
        self.minuteLabel.text = @"00";
        self.secondLabel.text = @"00";
    }
}


// 每间隔100毫秒定时器触发执行该方法
- (void)timerAction
{    
    [self getTimeFromTimeInterval:_timeInterval] ;

    // 当时间间隔为0时干掉定时器
    if (_timeInterval-_passTime == 0)
    {
        [[ZJTimerManager shareTimer] stopTimer];
        self.dayLabel.text = @"00";
        self.hourLabel.text = @"00";
        self.minuteLabel.text = @"00";
        self.secondLabel.text = @"00";
    }
}

// 通过时间间隔计算具体时间(小时,分,秒,毫秒)
- (void)getTimeFromTimeInterval : (double)timeInterval
{
    //毫秒数从0-9，所以每次过去100毫秒 1s=1000毫秒
    _passTime += 100.f;
    
    //小时数
    NSString *hours = [NSString stringWithFormat:@"%ld", (NSInteger)((timeInterval-_passTime)/1000/60/60)];
    //分钟数
    NSString *minute = [NSString stringWithFormat:@"%ld", (NSInteger)((timeInterval-_passTime)/1000/60)%60];
    //秒数
    NSString *second = [NSString stringWithFormat:@"%ld", ((NSInteger)(timeInterval-_passTime))/1000%60];
    //毫秒数
    CGFloat sss = ((NSInteger)((timeInterval - _passTime)))%1000/100;
    NSString *ss = [NSString stringWithFormat:@"%.lf", sss];
    if (minute.integerValue < 10) {
        minute = [NSString stringWithFormat:@"0%@", minute];
    }
    
    self.dayLabel.text = [NSString stringWithFormat:@"%@",hours];
    self.hourLabel.text = [NSString stringWithFormat:@"%@",minute];
    self.minuteLabel.text = [NSString stringWithFormat:@"%@",second];
    self.secondLabel.text = [NSString stringWithFormat:@"%@",ss];
    
    if (timeInterval - _passTime <= 0) {
        
        [self removeFromSuperview];
    }
}

@end
