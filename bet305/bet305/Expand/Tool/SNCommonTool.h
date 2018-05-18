//
//  SNCommonTool.h
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "SNDefine.h"
#import "SNConfig.h"

@interface SNCommonTool : NSObject

DEFINE_SINGLETON_FOR_HEADER(SNCommonTool)

//工具的单例
+ (SNCommonTool *)sharedYZCommonTools;

//软件版本
- (NSString*)getAppVersion;

//build版本
- (NSString*)getAppBuildVersion;

//ios版本
- (NSString*)getIOSVersion;

//获取系统语言
- (NSString*)getIOSLanguage;

//软件Bundle Identifier
- (NSString*)getBundleIdentifier;

//模拟软件唯一标示idfa
- (NSString*)getIphoneIdfa;

//获取具体的手机型号
- (NSString*)getDetailModel;

//是否是平板
- (BOOL)isPad;

//是否是iphoneX
-(BOOL)isPhoneX;

//是否是英文语言环境
- (BOOL)isEnglishLanguage;

//返回系统使用语言
- (SNLanguage)getLanguage;

//是否有麦克风权限
- (SNPrivateAuth)hasAVMediaTypeAudio;

//是否有拍照权限
- (SNPrivateAuth)hasAVMediaTypeVideo;

//是否有相册权限
- (SNPrivateAuth)hasPhotoLibrary;

//是否有定位权限
- (SNPrivateAuth)hasGPSLibrary;

//申请定位权限
//-(void)getGPSLibrary;

//申请麦克风权限
- (void)getAVMediaTypeAudio;

//申请拍照权限
-(void)getAVMediaTypeVideo;

//申请相册权限
- (void)getPhotoLibrary;

//打开系统设置
- (void)openSetting;

//将字典或者数组转化为Data数据
- (NSData *)toJSONData:(id)theData;

//将字典或者数组转化为json字符串数据
- (NSString *)toJSONStr:(id)theData;

//将JSON Data串转化为字典或者数组
- (id)DataToArrayOrNSDictionary:(NSData *)jsonData;

//将JSON串转化为字典或者数组
- (id)StrToArrayOrNSDictionary:(NSString *)jsonStr;

//NSArray转为NSString
- (NSString*)ArrayToString:(NSArray*)array;

//NSString转为NSArray
- (NSArray*)StringToArray:(NSString*)str;

//unicode转换为中文
- (NSString*)convertUnicodeString:(NSString*)unicodeStr;

//从文件获取json内容
- (id)getJsonDataFromFileName:(NSString*)jsonName;

//压缩一张图片并返回
- (UIImage*)compressImage:(UIImage*)img WithQuality:(float)quality;

//图片压缩数组，返回压缩过的图片数组
- (NSArray*)compressImageArray:(NSArray*)imgArray WithQuality:(float)quality;

//将Data内容写入本地保存，重新命名，返回保存过的路径
- (NSString*)savedPathWithData:(NSData*)data WithFileName:(NSString*)fileName;

//MD5加密
- (NSString*)getMD5withStr:(NSString*)str;

//获取时间戳
- (NSString*)getTimeStamp;

/*
 * 文件管理
 */
//在Document创建子文件夹
-(NSString*)createFolder:(NSString*)folderName;

//检查文件夹下是否有指定文件名文件
-(BOOL)isExistFileWithName:(NSString*)fileName InFolder:(NSString*)folderName;


@end
