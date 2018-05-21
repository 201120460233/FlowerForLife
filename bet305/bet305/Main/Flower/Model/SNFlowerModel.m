
//
//  SNFlowerModel.m
//  bet305
//
//  Created by shuni on 2018/5/21.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNFlowerModel.h"

@implementation SNFlowerModel

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *modelDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"",@"flowerId",
                                  @"",@"img",
                                  @"",@"name",
                                  @"",@"alias",
                                  @"",@"desc",
                                  [NSArray array], @"imgArray",
                                  [NSArray array], @"infoArray",
//                                  @"", @"characteristics",
//                                  @"", @"ecologicalHabits",
//                                  @"", @"flowerLanguage",
                                  nil];
        return [self initWithDic:modelDic];
    }
    return self;
}

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
//        self.infoArray = [NSMutableArray array];
        for (NSString *key in dic.allKeys) {
            mutDic[key] = dic[key];
//            if ([key isEqualToString:@"desc"] && ![dic[key] isEqualToString:@""]) {
//                [self.infoArray addObject:@{@"介绍": dic[key]}];
//            }else if ([key isEqualToString:@"characteristics"] && ![dic[key] isEqualToString:@""]) {
//                [self.infoArray addObject:@{@"形态特征": dic[key]}];
//            }else if ([key isEqualToString:@"ecologicalHabits"] && ![dic[key] isEqualToString:@""]) {
//                [self.infoArray addObject:@{@"生态习性": dic[key]}];
//            }else if ([key isEqualToString:@"flowerLanguage"] && ![dic[key] isEqualToString:@""]) {
//                [self.infoArray addObject:@{@"花语": dic[key]}];
//            }
        }
        [self setValuesForKeysWithDictionary:mutDic];
    }
    return self;
}

@end
