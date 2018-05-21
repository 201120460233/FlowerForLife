//
//  SNFlowerModel.h
//  bet305
//
//  Created by shuni on 2018/5/21.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNFlowerModel : NSObject

@property (nonatomic, strong) NSString *flowerId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSArray *imgArray;
@property (nonatomic, strong) NSArray *infoArray;
//@property (nonatomic, strong) NSString *characteristics;
//@property (nonatomic, strong) NSString *ecologicalHabits;
//@property (nonatomic, strong) NSString *flowerLanguage;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
