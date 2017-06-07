//
//  ZJScanningController.m
//  Project
//
//  Created by 郑键 on 17/2/28.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJScanningController.h"
#import "ZJScanningManager.h"
#import "ZJScanningView.h"
#import "YBAttributedStringLabel.h"
#import "ZBarSDK.h"
/**
 *  最大检测次数
 */
#define kMaxDetectedCount   5

@interface ZJScanningController () <AVCaptureMetadataOutputObjectsDelegate,ZBarReaderDelegate>

/**
 链接对象（会话对象）
 */
@property (nonatomic, strong) AVCaptureSession *session;

/**
 预览层Layer
 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

/**
 *  扫描视图
 */
@property (nonatomic, strong) ZJScanningView *scanningView;

/**
 当前是扫描识别次数
 */
@property (nonatomic, assign) NSInteger currentDetectedCount;

@property(nonatomic,copy) identifyQRcodeWithImageResultBlock    scanImageResultBlock;

/**
 未扫码到二维码的覆盖层
 */
@property(nonatomic,strong) YBAttributedStringLabel * NotResultCoverView;

@end

@implementation ZJScanningController

#pragma mark - Zero.Other

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <AVCaptureMetadataOutputObjectsDelegate>

/**
 扫描结果代理
 
 @param captureOutput               captureOutput
 @param metadataObjects             metadataObjects
 @param connection                  connection
 */
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection
{
    /**
     *  扫描成功之后的提示音
     */
    //    [self playSoundEffect:@""];
    
    /**
     *  如果扫描完成，停止会话
     */
//    [self.session stopRunning];
    
    /**
     *  删除预览图层
     */
//    [self.previewLayer removeFromSuperlayer];
    
    /**
     *  判断，当扫描次数小于限定次数，识别二维码，并调整焦距
     */
    if (self.currentDetectedCount++ < kMaxDetectedCount) {
//      [self.session stopRunning];
        [self.view addSubview:self.NotResultCoverView];
    }
    
    /**
     *  设置界面显示扫描结果
     */
    if (metadataObjects.count > 0) {
        
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        
        NSLog(@"metadataObjects = %@", metadataObjects);
        
        if ([obj.stringValue hasPrefix:@"http"]) {
            
        } else {
            
            /**
             *  扫描结果为条形码
             */
        }
    }
}

- (void)IdentifyQRcodeWithImage:(UIImage *)Image scanImageResultBlock:(identifyQRcodeWithImageResultBlock)scanImageResultBlock{
    if (Image == nil) return;
    _scanImageResultBlock = scanImageResultBlock;
//    NSData *imageData = UIImagePNGRepresentation(Image);
//    CIImage *ciImage = [CIImage imageWithData:imageData];
//    
//    //创建探测器
//    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyLow}];
//    NSArray *feature = [detector featuresInImage:ciImage];
//    
//    NSString *ResultConten = @"";
//    //取出探测到的数据
//    for (CIQRCodeFeature *result in feature) {
//        NSString * content = result.messageString;
//        ResultConten = content;
//    }
  
    
//    ZBarReaderController* read = [ZBarReaderController new];
    
//    read.readerDelegate = self;
//    
//    CGImageRef cgImageRef = Image.CGImage;
//    
//    ZBarSymbol* symbol = nil;
//    
//    for(symbol in [read scanImage:cgImageRef]) {
//        NSString *qrText = symbol.data ;
//        NSLog(@"result:%@",qrText);
//    }
    
//    NSString *qrResult = nil;
//    ZBarReaderController* read = [ZBarReaderController new];
//    CGImageRef cgImageRef = Image.CGImage;
//    ZBarSymbol* symbol = nil;
//    for(symbol in [read scanImage:cgImageRef]) break;
//    qrResult = symbol.data ;
//    
//    if (self.scanImageResultBlock) {
//        self.scanImageResultBlock(qrResult);
//    }
}


/**
 播放音效文件
 
 @param name 音效文件名
 */
- (void)playSoundEffect:(NSString *)name{
    
    /**
     *  获取音效
     */
    NSString *audioFile = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *fileUrl = [NSURL fileURLWithPath:audioFile];
    
    /**
     *  获得系统声音ID
     */
    SystemSoundID soundID = 0;
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(fileUrl), &soundID);
    
    /**
     *  如果需要在播放完之后执行某些操作，可以调用如下方法注册一个播放完成回调函数
     */
    AudioServicesAddSystemSoundCompletion(soundID, NULL, NULL, soundCompleteCallback, NULL);
    
    /**
     *  播放音频
     */
    AudioServicesPlaySystemSound(soundID);
}

/**
 *  播放完成回调函数
 *
 *  @param soundID    系统声音ID
 *  @param clientData 回调时传递的数据
 */
void soundCompleteCallback(SystemSoundID soundID, void *clientData){
    NSLog(@"播放完成...");
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigation];
    [self setupScanning];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.scanningView removeTimer];
    [self.session stopRunning];
//    [self.scanningView removeFromSuperview];
//    self.scanningView = nil;
}
- (void)viewWillAppear:(BOOL)animated
{
    if (self.scanningView) {
        [self.scanningView addTimer];
        [self.session startRunning];
    }
}

/**
 点击 覆盖层
 */
- (void)clickCoverView
{
    [self.NotResultCoverView removeFromSuperview];
    [self.session startRunning];
}

#pragma mark - Sixth.界面配置

- (void)setupNavigation
{
    self.navigationItem.title = @"扫一扫";
}

- (void)setupScanning
{
    /**
     *  添加扫描视图
     */
    [self.view addSubview:self.scanningView];
    
    [ZJScanningManager zj_scanningCodeWithOutsideViewController:self
                                                        session:self.session
                                                   previewLayer:self.previewLayer];
}

#pragma mark - Seventh.懒加载

- (ZJScanningView *)scanningView
{
    if (!_scanningView) {
        _scanningView = [ZJScanningView scanningQRCodeViewWithFrame:self.view.frame
                                                   outsideViewLayer:self.view.layer];
    }
    return _scanningView;
}

- (AVCaptureVideoPreviewLayer *)previewLayer
{
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    }
    return _previewLayer;
}

- (AVCaptureSession *)session
{
    if (!_session) {
        _session = [[AVCaptureSession alloc] init];
    }
    return _session;
}
/**
 "color" : color,
 "content" : "文字内容",
 "size" : 文字大小,
 "lineSpacing": 行间距
 */
- (YBAttributedStringLabel *)NotResultCoverView {
    if (!_NotResultCoverView) {
        
        [self.session stopRunning];
        [self.scanningView removeTimer];
        
        _NotResultCoverView = [[YBAttributedStringLabel alloc]init];
        _NotResultCoverView.alpha = 0.5;
        [_NotResultCoverView setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c0,
                                                                     @"content":@"未发现二维码/条码\n",
                                                                     @"size":SYSTEM_REGULARFONT(16),
                                                                     @"lineSpacing":@0},
                                                                   @{@"color":ZJCOLOR.color_c0,
                                                                     @"content":@"轻触屏幕继续扫描",
                                                                     @"size":SYSTEM_REGULARFONT(12),
                                                                     @"lineSpacing":@0}]];
        _NotResultCoverView.userInteractionEnabled = YES;
        _NotResultCoverView.numberOfLines = 2;
        _NotResultCoverView.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCoverView)];
        [_NotResultCoverView addGestureRecognizer:tap];
        _NotResultCoverView.backgroundColor = [UIColor blackColor];
    }
    return _NotResultCoverView;
}
@end
