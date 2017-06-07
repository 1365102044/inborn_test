
/**
 *  头文件说明
 *  1、公用app定义Block
 */

#ifndef ZJBlockDefine_h
#define ZJBlockDefine_h

//** =========================================================================================== */
//** ===========================================网络请求========================================== */
//** =========================================================================================== */

/**
 *  网络请求成功Block
 *
 *  @param objc             网络返回结果数据
 *  @param requestInfo      请求信息
 */
typedef void(^ZJNetRequestSuccessBlock)(id objc, id requestInfo);

/**
 *  网络请求失败Block
 *
 *  @param error            错误码
 *  @param requestInfo      请求信息
 */
typedef void(^ZJNetRequestFailureBlock)(id error, id requestInfo);

//** =========================================================================================== */
//** =========================================viewModel======================================== */
//** =========================================================================================== */

/**
 *  viewModel成功回调
 *
 *  @param model            数据模型
 */
typedef void(^ZJViewModelCallBackSuccessBlock)(id model);

/**
 *  viewModel失败回调
 *
 *  @param error            错误信息
 */
typedef void(^ZJViewModelCallBackFailureBlock)(id error);

//** =========================================================================================== */
//** ===========================================event========================================== */
//** =========================================================================================== */

/**
 *  事件回调Block
 */
typedef void(^ZJEventCallBackBlock)(id sender);

/**
 输入框开始编辑回调Block
 
 @param textField           输入框
 */
typedef void(^ZJTextFieldBeginEditingCallBackBlock)(UITextField *textField);

/**
 输入框结束编辑回调Block

 @param textField           输入框
 */
typedef void(^ZJTextFieldEndEditingCallBackBlock)(UITextField *textField);

//** =========================================================================================== */
//** ===========================================image========================================== */
//** =========================================================================================== */

/**
 图片选择器回调

 @param imageArray imageArray 选中图片
 @param assetArray assetArray asset
 @param BOOL BOOL
 */
typedef void(^ZJImagePickerCallBackBlock)(NSArray *imageArray, NSArray *assetArray, BOOL sender);

#endif /* ZJBlockDefine_h */
