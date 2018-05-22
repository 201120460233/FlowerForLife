//
//  SNDefine.h
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#ifndef SNDefine_h
#define SNDefine_h

/*
 *  弱引用 & 强引用
 */
#define SNWeakSelf   __weak typeof(self) weakSelf = self;
#define SNStrongSelf __strong typeof(weakSelf) strongSelf = weakSelf;

/*
 *  上线时: 需要将 DEBUG_MODE 和 DEBUGLOG_FILE 都修改为false
 *  测试模式:true，正式上线模式:false
 */
#define DEBUG_MODE false

/*
 *  是否将输入台内容输入到文本，开启的话会将输入台内容输出到文本
 */
#define DEBUGLOG_FILE false

#if (DEBUG_MODE||DEBUGLOG_FILE)
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DebugLog( s, ... )
#endif

#define DebugLogFUNC DebugLog(@"%s",__FUNCTION__)

/*
 *  创建单例
 */
//单例声明
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;
//单例实现
#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/*
 *  Standard UserDefaults
 */
#define kStandardUserDefaults                   [NSUserDefaults standardUserDefaults]
#define kStandardUserDefaultsObject(_KEY)       [kStandardUserDefaults objectForKey:_KEY]
#define kSaveStandardUserDefaults(_O,_K)        [kStandardUserDefaults setObject:_O forKey:_K]
#define kRemoveStandardUserDefaults(_K)         [kStandardUserDefaults removeObjectForKey:_K]
#define kStandardUserDefaultsSync               [kStandardUserDefaults synchronize]

/*
 *  UIColor
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue, _A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_A]
#define kColorWithRGB(_R,_G,_B)        ((UIColor *)[UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:1.0])
#define kColorWithRGBA(_R,_G,_B,_A)    ((UIColor *)[UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A])

#define kYZBackgroundColor UIColorFromRGB(0x16091B)//页面背景颜色
#define kYZCellSeparatorColor UIColorFromRGB(0xeaeaea) //cell的分割线
#define kYZBlackColor kColorWithRGB(39, 39, 39) //文字-深
#define kYZMidBlackColor kColorWithRGB(102, 102, 102) //文字-中
#define kYZLightBlackColor kColorWithRGB(153, 153, 153) //文字-浅
#define kYZRedColor UIColorFromRGB(0xff3699) //文字-红
#define kYZTabBarColor UIColorFromRGB(0x1D1122) //tabbar背景颜色
#define kYZTabBarTextSelColor UIColorFromRGB(0xffffff) //tabbar文字选中颜色
#define kYZNavigationBarColor UIColorFromRGB(0xffb6d6)//导航栏颜色
//#define kYZNavigationBarTitleTextColor UIColorFromRGB(0x160e12)//导航栏标题文字颜色
#define kYZNavigationBarTitleTextColor UIColorFromRGB(0xffffff)//导航栏标题文字颜色
#define kYZNavigationBarItemTextColor UIColorFromRGB(0xff3699)//导航栏按钮文字颜色
#define kYZBlackBackgroundColor UIColorFromRGB(0x2f2f2f)//黑色背景颜色
#define kYZBtnRedBackgroundColor UIColorFromRGB(0xff69ab)//按钮背景红色(按钮可点击)
#define kYZBtnGrayBackgroundColor UIColorFromRGB(0xc1c1c1)//按钮背景灰色(按钮不可点击)

/*
 *  Screen size
 */
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
#define TabBar_Height  [SNTabBarController sharedSNTabBarController].tabBar.frame.size.height //tab栏高度
#define NAV_Portrait_Status_Height [UIApplication sharedApplication].statusBarFrame.size.height //状态栏高度
#define NAV_Portrait_Height ([UIApplication sharedApplication].statusBarFrame.size.height+NAV_Portrait_NoStatus_Height) //NAV和状态栏的高度

/*
 *  App info
 */
#define kAppDisplayName     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define kAppVersion         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define kAppIdentifier      [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define kAppBuildVersion    [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

#endif /* SNDefine_h */
