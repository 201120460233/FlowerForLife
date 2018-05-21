//
//  SNBannerModel.m
//  bet305
//
//  Created by shuni on 2018/5/18.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNBannerModel.h"

@implementation SNBannerModel

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *modelDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"",@"bannerId",
                                  @"",@"img",
                                  @"",@"jumpUrl",
                                  nil];
        return [self initWithDic:modelDic];
    }
    return self;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
        for (NSString *key in dic.allKeys) {
            mutDic[key] = dic[key];
        }
        [self setValuesForKeysWithDictionary:mutDic];
    }
    return self;
}

@end
