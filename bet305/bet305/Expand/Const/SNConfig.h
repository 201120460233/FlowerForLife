//
//  SNConfig.h
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#ifndef SNConfig_h
#define SNConfig_h

/**********************************   枚举类型定义  **********************************/

typedef NS_ENUM(NSInteger, SNBarItemPostion) {
    SNBarItemPostionLeft = 0,
    SNBarItemPostionRight
};

typedef NS_ENUM(NSUInteger, SNLanguage) {
    SNLanguageEn = 1,  //英文
    SNLanguageTC,      //繁体中文
    SNLanguageCN       //简体
};

typedef NS_ENUM(NSUInteger, SNPrivateAuth) {
    SNAuthorized = 1,  //用户允许
    SNAuthDenied,      //用户拒绝
    SNAuthNotDetermined//用户尚未选择
};

typedef NS_ENUM(NSUInteger, SNFoodType) {
    SNChineseFood = 1, //中餐
    SNWesternFood,     //西餐
    SNDessert          //甜点
};


#endif /* SNConfig_h */
