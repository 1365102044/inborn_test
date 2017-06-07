//
//  YBMyInforViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMyInforViewController.h"
#import "YBEditPersonInforViewController.h"
#import "MOFSPickerManager.h"
#import "ZJMineService.h"
#import "YBMemberModel.h"
#import "ImagePicker.h"
#import "System_LocalData.h"
#import "User_LocalData.h"
#import "YBStringTool.h"

static NSString *PERSONCELLINDIFITER = @"PERSONCELLINDIFITER";

static NSString *PERSONHEADERVIEWINDIFITER = @"PERSONHEADERVIEWINDIFITER";

@interface YBMyInforViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) NSArray * cellTileArr;
@property(nonatomic,strong) UITableViewHeaderFooterView * headerView;
@property(nonatomic,strong) UIImageView * personicon;
@property(nonatomic,strong)   YBDefaultLabel *nicknameLable;
@property(nonatomic,strong)  YBDefaultLabel *sexLable;
@property(nonatomic,strong)  YBDefaultLabel *briddayLable;
@property(nonatomic,strong) YBDefaultLabel * phoneLable;
@property(nonatomic,strong) YBDefaultLabel * emailLable;
@property(nonatomic,strong) YBMemberModel * memBerModel;
@property(nonatomic,strong) NSMutableArray * bridArr;

@end

@implementation YBMyInforViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark  *** 网络请求
/**
 获取个人信息
 */
- (void)requestPersonInfor
{
    [[ZJMineService share] getPersonInfoSuccess:^(id objc, id requestInfo) {
        
        self.memBerModel = [YBMemberModel modelWithDictionary:objc[@"data"]];
        self.nicknameLable.text = _memBerModel.nickname;
        self.sexLable.text = @"未知";
        self.sexLable.text = (_memBerModel.sex == 1 ? @"男":@"女");
        
        NSString *bridstr = [[YBStringTool share] returnTimeStrformeTimestr:_memBerModel.birthday timestyle:@"yyyy.MM.dd"];
        self.briddayLable.text = bridstr ;
        self.phoneLable.text = _memBerModel.mobile;
        self.emailLable.text = _memBerModel.email;
        if ([_memBerModel.headImage isEqualToString:@"default"]) {
            self.personicon.image = [UIImage imageNamed:@"mine_defaultphoto_icon"];
        }else{
            NSData *imagedata = [SYSTEM_USERDEFAULTS objectForKey:@"headerimagedata"];
            self.personicon.image = [UIImage imageWithData:imagedata];
            if (imagedata.length==0) {
                [self.personicon sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageUrlStringHeaderIcon, _memBerModel.headImage)] placeholderImage:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
            }
        }
    } fail:^(id error, id requestInfo) {
        
    }];
}

#pragma mark - Third.点击事件
/**
 切换头像
 */
- (void)changeHeaderPic:(UITapGestureRecognizer *)tap
{
    //设置主要参数
    [[ImagePicker sharedManager] dwSetPresentDelegateVC:self SheetShowInView:self.view InfoDictionaryKeys:2 allowsEditing:YES];
    
    //回调
    [[ImagePicker sharedManager] dwGetpickerTypeStr:^(NSString *pickerTypeStr) {
        
    } pickerImagePic:^(UIImage *pickerImagePic) {
        [self updateheaderimage:pickerImagePic];
    }];
}

#pragma mark - Fourth.代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTileArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * str = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    UIView *cellview = [self creatCellSubviewWithIndexPath:indexPath title:self.cellTileArr[indexPath.row] desc:nil];
    cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(46));
    [cell.contentView addSubview:cellview];
    
    return cell;
}

/**
 创建cellsubview
 */
- (UIView *)creatCellSubviewWithIndexPath:(NSIndexPath *)indexPath title:(NSString *)titletext desc:(NSString *)desc
{
    UIView *cellview = [[UIView alloc]init];
    
    UIImageView * righticon = [[UIImageView alloc]init];
    righticon.image = ZJIMAGE(IMAGEFILEPATH_MINE, @"mine_moreitem", ZJProjectLoadImageDefault).firstObject;
    [cellview addSubview:righticon];
    
    YBDefaultLabel *titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                          text:@""
                                                     textColor:ZJCOLOR.color_c4];
    titlelable.text = titletext;
    titlelable.textAlignment = NSTextAlignmentLeft;
    [cellview addSubview:titlelable];
    
    YBDefaultLabel*desclable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                                        text:@""
                                                   textColor:ZJCOLOR.color_c5];
    desclable.textAlignment = NSTextAlignmentRight;
    desclable.text = desc;
    [cellview addSubview:desclable];
    
    
    UIView*lineview = [[UIView alloc]init];
    lineview.backgroundColor = ZJCOLOR.color_c16;
    [cellview addSubview:lineview];
    
    [righticon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(cellview).mas_offset(ADJUST_PERCENT_FLOAT(-10));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
        make.centerY.mas_equalTo(cellview);
    }];
    
    [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cellview).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(75), ADJUST_PERCENT_FLOAT(30)));
        make.centerY.mas_equalTo(cellview);
    }];
    
    [desclable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.right.mas_equalTo(righticon.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.height.mas_equalTo(titlelable.mas_height);
        make.centerY.mas_equalTo(cellview);
    }];
    if (indexPath.row == 3) {
        righticon.hidden = YES;
    }
    if (indexPath.row ==0) self.nicknameLable = desclable;
    else if (indexPath.row == 1) self.sexLable = desclable;
    else if (indexPath.row == 2) self.briddayLable = desclable;
    else if (indexPath.row == 3) self.phoneLable = desclable;
    else if (indexPath.row == 4) self.emailLable = desclable;
    if (indexPath.row <4) {
        [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cellview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(cellview);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
            make.bottom.mas_equalTo(cellview.mas_bottom);
        }];
    }
    
    return cellview;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        /**
         昵称
         */
        YBEditPersonInforViewController *nickvc = [YBEditPersonInforViewController creatEditPersonInforViewControllWithType:1 member:self.memBerModel Extend:nil];
        [self.navigationController pushViewController:nickvc animated:YES];
    }else if (indexPath.row == 4){
        /**
         邮箱
         */
        YBEditPersonInforViewController *nickvc = [YBEditPersonInforViewController creatEditPersonInforViewControllWithType:2 member:self.memBerModel Extend:nil];
        [self.navigationController pushViewController:nickvc animated:YES];
    }else if (indexPath.row ==1){
        /**
         性别
         */
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"请选择性别" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *nanAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sexLable.text = @"男";
            [self commitWithIndexRow:indexPath.row];
        }];
        
        
        UIAlertAction *nvAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sexLable.text = @"女";
            [self commitWithIndexRow:indexPath.row];
        }];
        
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:nanAction];
        [alert addAction:nvAction];//代码块前的括号是代码块返回的数据类型
        [alert addAction:cancleAction];
        [self presentViewController: alert animated:YES completion:nil];
        
    }else if (indexPath.row ==2){
        /**
         生日
         */
        [[MOFSPickerManager shareManger] showDatePickerWithTag:1 commitBlock:^(NSDate *date) {
            
            [self.bridArr removeAllObjects];
            NSArray *dataArr = [[NSString stringWithFormat:@"%@",date] componentsSeparatedByString:@" "];
            NSArray *arr = [dataArr.firstObject componentsSeparatedByString:@"-"];
            [self.bridArr addObjectsFromArray:arr];
            @try {
                self.briddayLable.text = [NSString stringWithFormat:@"%@.%@.%@",arr[0],arr[1],arr[2]];
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
            [self commitWithIndexRow:indexPath.row];
        } cancelBlock:^{
            
        }];
        
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headerView;
}

/**
 提交数据
 */
- (void)commitWithIndexRow:(NSInteger)row
{
    NSInteger sexstr;
    NSString *bridarystr;
    if (row == 1) {
        if([self.sexLable.text isEqualToString:@"男"]){
            sexstr = 2;
        }else if ([self.sexLable.text isEqualToString:@"女"]){
            sexstr = 1;
        }
        bridarystr = nil;
    }else if (row ==2){
        
        @try {
            bridarystr = [NSString stringWithFormat:@"%@-%@-%@",self.bridArr[0],self.bridArr[1],self.bridArr[2]];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        sexstr = 0;
    }
    
    [[ZJMineService share] changePersonInfonickName:nil
                                           birthday:bridarystr
                                                sex:sexstr
                                              email:nil
                                            Success:^(id objc, id requestInfo) {
                                                [self requestPersonInfor];
                                            } fail:^(id error, id requestInfo) {
                                                
                                            }];
}

#pragma mark - Fifth.控制器生命周期
/**
 初始化
 */
+ (instancetype)creatMyInforViewControllExtend:(id)Extend
{
    YBMyInforViewController *vc = [[YBMyInforViewController alloc]init];
    return vc;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestPersonInfor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cellTileArr = @[@"用户昵称",@"性别",@"出生年月",@"手机号",@"邮箱"];
    [self.view addSubview:self.tableview];
    [self creatheaderview];
    
    self.tableview.tableHeaderView = self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(160.f);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - Sixth.界面配置
/**
 tableviewheaderview
 */
- (void)creatheaderview
{
    
}
#pragma mark - Seventh.懒加载
/**
 懒加载
 */
-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(46);
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

#pragma mark  ******************* 上传头像的图片**********************

-(void)updateheaderimage:(UIImage *)image
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSString *token = [User_LocalData getTokenId];
    NSString *uuid = [[System_LocalData alloc]init].UUID;
    if (token) {
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
    }else{
        [manager.requestSerializer setValue:nil forHTTPHeaderField:@"token"];
    }
    [manager.requestSerializer setValue:uuid forHTTPHeaderField:@"uuid"];
    [SVProgressHUD show];
    NSString *URLSTR = [NSString stringWithFormat:@"%@%@",BASE_URL,CHANGEPERSONHEADERICON_URL];
    [manager POST:URLSTR parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        //把图片转换为二进制流
        NSData *imageData = UIImagePNGRepresentation(image);
        if (imageData.length/1024/1024>5) {
            imageData = UIImageJPEGRepresentation(image, 0.5);
        }
        //按照表单格式把二进制文件写入formData表单
        [formData appendPartWithFileData:imageData name:@"headPic" fileName:[NSString stringWithFormat:@"%d.png", 1] mimeType:@"image/png"];
        
        [SVProgressHUD show];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        [SVProgressHUD show];
        
    }  success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        self.personicon.image =  [image ex_drawCircleImage];
        
        NSData *imagedata  = UIImageJPEGRepresentation(image,0.5);
        [SYSTEM_USERDEFAULTS setObject:imagedata forKey:@"headerimagedata"];
        
        YBLog(@"responseObject == %@--++--%@----", [self getResponseObjcWithTask:responseObject],[self getRespodHeaderWithTask:task]);
        
        NSString *heahimage = [self getResponseObjcWithTask:responseObject][@"data"][@"imgUrl"];
        [SYSTEM_USERDEFAULTS setObject:heahimage forKey:@"headImage"];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //         YBLog(@"发送失败+++++%@++++%@",error,[self getRespodHeaderWithTask:task]);
        [SVProgressHUD dismiss];
    }];
}

-(id)getResponseObjcWithTask:(id )responseObect{
    id json;
    NSError *error;
    json = [NSJSONSerialization JSONObjectWithData:responseObect options:0 error:&error];
    if (error) {
        json = [[NSString alloc] initWithData:responseObect encoding:NSUTF8StringEncoding];
    }
    return json;
}

//** 获取响应头 */
- (id)getRespodHeaderWithTask:(NSURLSessionTask *)task
{
    NSHTTPURLResponse *respond = (NSHTTPURLResponse *)task.response;
    return respond.allHeaderFields;
}


- (NSMutableArray *)bridArr {
    if (!_bridArr) {
        _bridArr = [NSMutableArray array];
    }
    return _bridArr;
}

- (UITableViewHeaderFooterView *)headerView
{
    if (!_headerView) {
        
        ZJBaseView *bgView = [ZJBaseView new];
        _headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:PERSONHEADERVIEWINDIFITER];
        _headerView.backgroundView = bgView;
        
        UIImageView *personicon = [[UIImageView alloc]init];
        [_headerView addSubview:personicon];
        personicon.image = [UIImage imageNamed:@"mine_defaultphoto_icon"];
        self.personicon = personicon;
        personicon.layer.masksToBounds = YES;
        personicon.layer.cornerRadius = ADJUST_PERCENT_FLOAT(30);
        [personicon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(60), ADJUST_PERCENT_FLOAT(60)));
            make.centerX.mas_equalTo(_headerView.mas_centerX);
            make.top.mas_equalTo(_headerView).mas_offset(ADJUST_PERCENT_FLOAT(40));
        }];
        
        UIView *greyVeiw = [[UIView alloc]init];
        greyVeiw.backgroundColor = [UIColor blackColor];
        greyVeiw.alpha = 0.3;
        [personicon addSubview:greyVeiw];
        
        [greyVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(personicon);
        }];
        
        UIImageView *camericon = [[UIImageView alloc]init];
        camericon.backgroundColor = [UIColor clearColor];
        camericon.image = [UIImage imageNamed:@"mineInfor_camera_n"];
        [personicon addSubview:camericon];
        
        [camericon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(27), ADJUST_PERCENT_FLOAT(27)));
            make.center.mas_equalTo(personicon.center);
        }];
        
        personicon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeHeaderPic:)];
        [personicon addGestureRecognizer:tap];
    }
    return _headerView;
}

@end
