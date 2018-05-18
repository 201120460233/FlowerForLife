//
//  SNCommonTool.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNCommonTool.h"
#import "SimulateIDFA.h"
#import "sys/utsname.h"
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreLocation/CLLocationManager.h>
#import "NSObject+Check.h"

@interface SNCommonTool() {
    SNLanguage m_language;
}

@property (nonatomic, strong) CLLocationManager *manager;

@end


@implementation SNCommonTool

static SNCommonTool *tools = nil;

DEFINE_SINGLETON_FOR_CLASS(SNCommonTool)

+ (SNCommonTool *)sharedYZCommonTools {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[SNCommonTool alloc] init];
    });
    return tools;
}

//软件版本
- (NSString*)getAppVersion {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)@"CFBundleShortVersionString"];
    return version;
}

//build版本
- (NSString*)getAppBuildVersion {
    NSString *buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)@"CFBundleVersion"];
    return buildVersion;
}

//ios版本
- (NSString*)getIOSVersion {
    return [[UIDevice currentDevice] systemVersion];
}

//获取系统语言
- (NSString*)getIOSLanguage {
    //暂时没有多语言版
    return @"CN";
    
    NSString *language =  [[NSBundle mainBundle] preferredLocalizations][0];
    if ([language isEqualToString:@"zh-Hans"]) {
        m_language = SNLanguageCN;
        return @"CN";   //中文
    }else if ([language isEqualToString:@"zh-Hant"]) {
        m_language = SNLanguageTC;
        return @"TC";   //繁体中文
    }else{
        m_language = SNLanguageEn;
        return @"EN";   //英文
    }
}

//软件包名Bundle Identifier
- (NSString*)getBundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

//模拟软件唯一标示idfa
- (NSString*)getIphoneIdfa {
    return [SimulateIDFA createSimulateIDFA];
}

//获取具体的型号
- (NSString*)getDetailModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"]
        || [deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"]
        || [deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"]
        || [deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"]
        || [deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"]
        || [deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";
    
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceString isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    if ([deviceString isEqualToString:@"iPad5,1"]
        || [deviceString isEqualToString:@"iPad5,2"])      return @"iPad mini 4";
    
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([deviceString isEqualToString:@"iPad6,3"]
        || [deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7-inch";
    if ([deviceString isEqualToString:@"iPad6,7"]
        || [deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9-inch";
    if ([deviceString isEqualToString:@"iPad6,11"]
        || [deviceString isEqualToString:@"iPad6,12"])      return @"iPad 5Th";//五代
    
    if ([deviceString isEqualToString:@"iPad7,1"]
        || [deviceString isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch 2nd";
    if ([deviceString isEqualToString:@"iPad7,3"]
        || [deviceString isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch";
    
    //AirPods
    if ([deviceString isEqualToString:@"AirPods1,1"])      return @"AirPods";
    
    //Apple TV
    if ([deviceString isEqualToString:@"AppleTV2,1"])      return @"AppleTV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"]
        ||[deviceString isEqualToString:@"AppleTV3,2"])      return @"AppleTV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])      return @"AppleTV 4";
    if ([deviceString isEqualToString:@"AppleTV6,2"])      return @"AppleTV 4K";
    
    //Apple Watch
    if ([deviceString isEqualToString:@"Watch1,1"]
        ||[deviceString isEqualToString:@"Watch1,2"])      return @"Apple Watch1";
    if ([deviceString isEqualToString:@"Watch2,6"]
        ||[deviceString isEqualToString:@"Watch2,7"])      return @"Apple Watch Series 1";
    if ([deviceString isEqualToString:@"Watch2,3"]
        ||[deviceString isEqualToString:@"Watch2,4"])      return @"Apple Watch Series 2";
    if ([deviceString isEqualToString:@"Watch3,1"]
        ||[deviceString isEqualToString:@"Watch3,2"]
        ||[deviceString isEqualToString:@"Watch3,3"]
        ||[deviceString isEqualToString:@"Watch3,4"])      return @"Apple Watch Series 3";
    
    //HomePod
    if ([deviceString isEqualToString:@"AudioAccessory1,1"])      return @"HomePod";
    
    //模拟器
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    
    return deviceString;
}

//是否是平板
- (BOOL)isPad {
    return [[UIDevice currentDevice].model isEqualToString:@"iPad"];
}

//是否是iphoneX
- (BOOL)isPhoneX {
    return [[self getDetailModel] isEqualToString:@"iPhone X"];
}

//是否是英文语言环境
- (BOOL)isEnglishLanguage {
    return [self getLanguage] == SNLanguageEn;
}

//返回系统使用语言
- (SNLanguage)getLanguage {
    [self getIOSLanguage];
    return m_language;
}

//是否有麦克风权限
- (SNPrivateAuth)hasAVMediaTypeAudio {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusAuthorized) {
        return SNAuthorized;
    }else if (status == AVAuthorizationStatusNotDetermined) {
        return SNAuthNotDetermined;
    }else {
        return SNAuthDenied;
    }
}

///是否有拍照权限
- (SNPrivateAuth)hasAVMediaTypeVideo {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusAuthorized) {
        return SNAuthorized;
    }else if (status == AVAuthorizationStatusNotDetermined) {
        return SNAuthNotDetermined;
    }else {
        return SNAuthDenied;
    }
}

///是否有相册权限
- (SNPrivateAuth)hasPhotoLibrary {
    PHAuthorizationStatus status=[PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized) {
        return SNAuthorized;
    }else if (status == PHAuthorizationStatusNotDetermined) {
        return SNAuthNotDetermined;
    }else {
        return SNAuthDenied;
    }
}

///是否有定位权限
- (SNPrivateAuth)hasGPSLibrary
{
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus]  == kCLAuthorizationStatusAuthorizedAlways)) {
        //定位功能可用
        return SNAuthorized;
        
    }else if ( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        return SNAuthNotDetermined;
    }
    else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied || [CLLocationManager authorizationStatus] ==kCLAuthorizationStatusRestricted) {
        //定位不能用
        return SNAuthDenied;
    }
    return SNAuthDenied;
}

///申请麦克风权限
- (void)getAVMediaTypeAudio {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        
    }];
}

///申请拍照权限
- (void)getAVMediaTypeVideo {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        
    }];
}

///申请相册权限
- (void)getPhotoLibrary {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
    }];
}

///打开系统设置
- (void)openSetting {
    NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
        [[UIApplication sharedApplication] openURL:settingUrl];
    }
}

// 将字典或者数组转化为Data数据
- (NSData *)toJSONData:(id)theData{
    NSError *error = nil;
    if (!theData) {
        NSAssert(NO, @"转换数据为空");
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}

/// 将字典或者数组转化为json字符串数据
- (NSString *)toJSONStr:(id)theData {
    if (!theData) {
        NSAssert(NO, @"转换数据为空");
        return nil;
    }
    NSData *jsonData = [self toJSONData:theData];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

// 将JSONDATA转化为字典或者数组
- (id)DataToArrayOrNSDictionary:(NSData *)jsonData{
    if (!jsonData) {
        NSAssert(NO, @"转换数据为空");
        return nil;
    }
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
}

// 将JSON串转化为字典或者数组
- (id)StrToArrayOrNSDictionary:(NSString *)jsonStr {
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    return [self DataToArrayOrNSDictionary:jsonData];
}

///NSArray转为NSString
- (NSString*)ArrayToString:(NSArray*)array {
    return [array componentsJoinedByString:@","];
}

///NSString转为NSArray
- (NSArray*)StringToArray:(NSString*)str {
    if (![str IsNotNull]) {
        return [NSArray array];
    }
    else if ([str containsString:@","]) {
        return [str componentsSeparatedByString:@","];
    }
    else{
        return [NSArray arrayWithObjects:str, nil];
    }
}

///unicode转换为中文
- (NSString*)convertUnicodeString:(NSString*)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

///从文件获取json内容
- (id)getJsonDataFromFileName:(NSString*)jsonName {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:jsonName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return result;
}


-(NSString*)saveImgWithUIImage:(UIImage*)img WithFileName:(NSString*)fileName{
    NSData *imagedata = UIImageJPEGRepresentation(img, 0.7);
    NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    NSString *savedImagePath=[documentsDirectory stringByAppendingPathComponent:fileName];
    [imagedata writeToFile:savedImagePath atomically:YES];
    return savedImagePath;
}

///压缩图片并返回
- (UIImage*)compressImage:(UIImage*)img WithQuality:(float)quality
{
    NSData *data = UIImageJPEGRepresentation(img, quality);
    UIImage*image = [UIImage imageWithData:data];
    return image;
}

///图片压缩数组，返回压缩过的图片数组
- (NSArray*)compressImageArray:(NSArray*)imgArray WithQuality:(float)quality
{
    NSMutableArray*array = [NSMutableArray array];
    for (int i=0; i<imgArray.count; i++) {
        UIImage*img = [imgArray objectAtIndex:i];
        UIImage*compressImg = [self compressImage:img WithQuality:quality];
        if (!compressImg) {
            [array addObject:img];
        }
        else{
            [array addObject:compressImg];
        }
    }
    return array;
}

///将Data内容写入本地保存，重新命名，返回保存过的路径
- (NSString*)savedPathWithData:(NSData*)data WithFileName:(NSString*)fileName {
    NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    NSString *savedImagePath=[documentsDirectory stringByAppendingPathComponent:fileName];
    [data writeToFile:savedImagePath atomically:YES];
    return savedImagePath;
}

///MD5加密
- (NSString*)getMD5withStr:(NSString*)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

///获取时间戳
- (NSString*)getTimeStamp {
    return [NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970]];
}

///在Document创建子文件夹
-(NSString*)createFolder:(NSString*)folderName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    
    NSString *folderPath = [path stringByAppendingPathComponent:folderName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = FALSE;
    BOOL isDirExist = [fileManager fileExistsAtPath:folderPath isDirectory:&isDir];
    
    if(!(isDirExist && isDir)) {
        BOOL bCreateDir = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
        if(!bCreateDir){
            DebugLog(@"创建文件夹失败");
            return @"";
        }
        return folderPath;
    }
    return folderPath;
}

///检查文件夹下是否有指定文件名文件
-(BOOL)isExistFileWithName:(NSString*)fileName InFolder:(NSString*)folderName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [[path stringByAppendingPathComponent:folderName] stringByAppendingPathComponent:fileName];
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

@end
