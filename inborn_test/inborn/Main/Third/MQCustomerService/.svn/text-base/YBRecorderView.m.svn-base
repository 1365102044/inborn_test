//
//  YBRecorderView.m
//  inborn
//
//  Created by 郑键 on 17/4/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRecorderView.h"
#import "MQAssetUtil.h"
#import "MQToast.h"
#import <MQChatAudioRecorder.h>
#import "YBVoiceTipsView.h"

@interface YBRecorderView()<MQChatAudioRecorderDelegate>

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBVoiceTipsView *voiceTipsView;

@end

@interface YBRecorderView() <MQChatAudioRecorderDelegate>

@end

@implementation YBRecorderView
{
    UIView *recordButton;
    UIImageView *micImageView;
    CALayer *volumeLayer;
    
    MQChatAudioRecorder *recorder;
    UILongPressGestureRecognizer *longGesture;
    CGPoint point;
    CGFloat recordTime;
    
    YBDefaultLabel *_voiceLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
//    _tipLabel = [[UILabel alloc] init];
//    _tipLabel.font = [UIFont systemFontOfSize:18];
//    _tipLabel.textColor = [UIColor colorWithRed:118/255.0 green:125/255.0 blue:133/255.0 alpha:1];
//    _tipLabel.text = @"按住说话";
//    _tipLabel.textAlignment = NSTextAlignmentCenter;
//    _tipLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:_tipLabel];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tipLabel]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_tipLabel)]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_tipLabel(25)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_tipLabel)]];
    
    YBDefaultLabel *voiceLabel = [[YBDefaultLabel alloc]init];
    
    voiceLabel.text = ZJSTRING(@"按住 说话");
    voiceLabel.textColor = ZJCOLOR.color_c4;
    voiceLabel.font = SYSTEM_REGULARFONT(14.f);
    [voiceLabel.layer setBorderWidth:1.0];;
    [voiceLabel.layer setBorderColor:ZJCOLOR.color_c16.CGColor];
    voiceLabel.layer.cornerRadius = 4.f;
    voiceLabel.layer.masksToBounds = YES;
    voiceLabel.backgroundColor = ZJCOLOR.color_c0;
    voiceLabel.textAlignment = NSTextAlignmentCenter;
    voiceLabel.userInteractionEnabled = YES;
    _voiceLabel = voiceLabel;
    
//    CGFloat micImageViewWH = 48;
//    CGFloat recordButtonWH = 90;
//    micImageView = [[UIImageView alloc] initWithImage:[MQAssetUtil imageFromBundleWithName:@"rectangle9Copy5"]];
//    recordButton = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width - recordButtonWH) / 2, 100, recordButtonWH, recordButtonWH)];
//    recordButton.backgroundColor = [UIColor colorWithRed: 23/255.0 green: 199/255.0 blue: 209/255.0 alpha: 1];
//    [recordButton setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin)];
//    recordButton.layer.cornerRadius = recordButtonWH / 2;
//    
//    micImageView.frame = CGRectMake((recordButtonWH - 48)/2, (recordButtonWH - 48)/2, micImageViewWH, micImageViewWH);
//    [recordButton addSubview:micImageView];
//    [self addSubview:recordButton];
//    [micImageView setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin)];
    [self addSubview:voiceLabel];
    [voiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    
    longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    longGesture.delaysTouchesBegan = NO;
    longGesture.delaysTouchesEnded = NO;
    longGesture.minimumPressDuration = 0;
    [voiceLabel addGestureRecognizer:longGesture];
    
    volumeLayer = [CALayer layer];
    volumeLayer.opacity = 0.25;
    [self changeVolumeLayerDiameter:volumeLayer.frame.size.width];
    [self.layer insertSublayer:volumeLayer below:recordButton.layer];
    
    recorder = [[MQChatAudioRecorder alloc] initWithMaxRecordDuration:0];
    recorder.delegate = self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    volumeLayer.position = CGPointMake(self.center.x, volumeLayer.position.y);
}

- (void)changeVolumeLayerDiameter:(CGFloat)dia_ {
    
    CGFloat dia = dia_ > 1 ? dia_ : recordButton.frame.size.width + 8 * sqrt(dia_ * 100);
    
    CGRect frame = CGRectMake(recordButton.center.x - dia/2, recordButton.center.y - dia/2, dia, dia);
    volumeLayer.frame = frame;
    volumeLayer.cornerRadius = dia/2;
    volumeLayer.backgroundColor = recordButton.backgroundColor.CGColor;
    
    CGFloat time = [self getRecordTime];
    if (time >= 50) {
        if (point.y < 50) {
            self.tipLabel.text = [NSString stringWithFormat:@"录音将在%li秒后结束", (long)(60 - time)];
        }else{
            self.tipLabel.text = [NSString stringWithFormat:@"录音将在%li秒后发送", (long)(60 - time)];
        }
    }
    YBLog(@"%f", dia_);
    NSInteger index = 1;
    if (dia_ > .66) {
        //[self.voiceTipsView setVoiceValueWithNumber:7];
        index = 7;
    }else if (dia_ > .57){
        //[self.voiceTipsView setVoiceValueWithNumber:7];
        index = 7;
    }else if (dia_ > .48){
        //[self.voiceTipsView setVoiceValueWithNumber:6];
        index = 6;
    }else if (dia_ > .39){
        //[self.voiceTipsView setVoiceValueWithNumber:5];
        index = 5;
    }else if (dia_ > .30){
        //[self.voiceTipsView setVoiceValueWithNumber:4];
        index = 4;
    }else if (dia_ > .21){
        //[self.voiceTipsView setVoiceValueWithNumber:3];
        index = 3;
    }else if (dia_ > .12){
        //[self.voiceTipsView setVoiceValueWithNumber:2];
        index = 2;
    }else if (dia_ > .03){
        //[self.voiceTipsView setVoiceValueWithNumber:1];
        index = 1;
    }else{
        //[self.voiceTipsView setVoiceValueWithNumber:1];
        index = 1;
    }
    
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"MQVoiceValue" object:nil userInfo:@{@"value":@(index)}];
}

- (CGFloat)getRecordTime {
    if (recordTime > 0) {
        return CFAbsoluteTimeGetCurrent() - recordTime;
    } else {
        return 0;
    }
}

- (void)panGestureRecognizerAction:(UIGestureRecognizer*)sender {
    point = [sender locationInView:self];
    if(sender.state == UIGestureRecognizerStateBegan) {
        recordTime = CFAbsoluteTimeGetCurrent();
        _voiceLabel.backgroundColor = ZJCOLOR.color_c14;
        
        if ([self.delegate respondsToSelector:@selector(recordStarted)]) {
            [self.delegate recordStarted];
        }
        self.tipLabel.text = @"手指上滑，取消发送";
        if ([self.delegate respondsToSelector:@selector(recorderView:type:extend:)]) {
            [self.delegate recorderView:self type:YBRecorderViewBegan extend:nil];
        }
//        [self.voiceTipsView setTipsImageWithIsCancel:YES];
//        [[UIApplication sharedApplication].keyWindow addSubview:self.voiceTipsView];
//        [self.voiceTipsView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.centerY.mas_equalTo([UIApplication sharedApplication].keyWindow);
//            make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(130.f));
//        }];
        
    } else if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        _voiceLabel.backgroundColor = ZJCOLOR.color_c0;
        
        
        if ([self.delegate respondsToSelector:@selector(recorderView:type:extend:)]) {
            [self.delegate recorderView:self type:YBRecorderViewEnd extend:nil];
        }
        
        if (point.y < -50) {
            if ([self.delegate respondsToSelector:@selector(recordCanceld)]) {
                [self.delegate recordCanceld];
            }
        }else{
            //录音时间需要大于1秒
            if ([self getRecordTime] < 1) {
                [MQToast showToast:@"录音时间太短" duration:0.2 window:self.window];
                if ([self.delegate respondsToSelector:@selector(recordCanceld)]) {
                    [self.delegate recordCanceld];
                }
            }else{
                //[self.voiceTipsView removeFromSuperview];
                if ([self.delegate respondsToSelector:@selector(recordEnd)]) {
                    [self.delegate recordEnd];
                }
            }
        }
        
        [self reUI];
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        YBLog(@"%@", NSStringFromCGPoint(point));
        if (point.y < -50) {
            if ([self getRecordTime] < 50) {
                
                if ([self.delegate respondsToSelector:@selector(recorderView:type:extend:)]) {
                    [self.delegate recorderView:self type:YBRecorderViewChangeCancel extend:nil];
                }
            }
            micImageView.image = [MQAssetUtil imageFromBundleWithName:@"exit_recording"];
            recordButton.backgroundColor = [UIColor colorWithRed: 150/255.0 green: 159/255.0 blue: 170/255.0 alpha: 1];
        }else{
            if ([self getRecordTime] < 50) {
                self.tipLabel.text = @"手指上滑，取消发送";
                
                if ([self.delegate respondsToSelector:@selector(recorderView:type:extend:)]) {
                    [self.delegate recorderView:self type:YBRecorderViewChangeContinue extend:nil];
                }
            }
            micImageView.image = [MQAssetUtil imageFromBundleWithName:@"rectangle9Copy5"];
            recordButton.backgroundColor = [UIColor colorWithRed: 23/255.0 green: 199/255.0 blue: 209/255.0 alpha: 1];
        }
    }
}

- (void)reUI {
    recordTime = -1;
    [self changeVolumeLayerDiameter:recordButton.frame.size.width];
    self.tipLabel.text = @"按住说话";
    micImageView.image = [MQAssetUtil imageFromBundleWithName:@"rectangle9Copy5"];
    recordButton.backgroundColor = [UIColor colorWithRed: 23/255.0 green: 199/255.0 blue: 209/255.0 alpha: 1];
}

- (YBVoiceTipsView *)voiceTipsView
{
    if (!_voiceTipsView) {
        
        _voiceTipsView = [[YBVoiceTipsView alloc] init];
        
    }
    return _voiceTipsView;
}

@end
