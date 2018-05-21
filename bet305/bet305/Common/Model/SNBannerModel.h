//
//  SNBannerModel.h
//  bet305
//
//  Created by shuni on 2018/5/18.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNBaseModel.h"

@interface SNBannerModel : NSObject

@property (nonatomic, strong) NSString *bannerId;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *jumpUrl;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
