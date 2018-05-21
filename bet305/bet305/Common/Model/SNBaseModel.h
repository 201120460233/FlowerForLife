//
//  SNBaseModel.h
//  bet305
//
//  Created by shuni on 2018/5/18.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNBaseModel : NSObject

@property (nonatomic, strong) NSString *modelId;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
