//
//  NSObject+Check.m
//  YZUser
//
//  Created by Damon on 2017/7/13.
//  Copyright © 2017年 shuni. All rights reserved.
//

#import "NSObject+Check.h"
#import <UIKit/UIKit.h>
#import "SNDefine.h"

@implementation NSObject (Check)

- (BOOL)IsNotNull {
    if (!self && ![self isEqual:[NSNull null]]) {
        return YES;
    }else {
        if ([self isKindOfClass:[NSString class]]) {
            if ([((NSString*)self) isEqualToString:@"null"] || [((NSString*)self) isEqualToString:@"<null>"]  || [((NSString*)self) isEqualToString:@"(null)"]) {
                return NO;
            }
            return ((NSString*)self).length>0;
        }
        if ([self isKindOfClass:[NSArray class]]) {
            return [((NSArray*)self) count]>0;
        }
        if ([self isKindOfClass:[NSSet class]]) {
            return [(NSSet*)self count]>0;
        }
        if ([self isKindOfClass:[NSDictionary class]]) {
            return [((NSDictionary*)self) allKeys].count>0;
        }
        if ([self isKindOfClass:[NSNumber class]]) {
            return [(NSNumber*)self integerValue] > 0;
        }
        if ([self isKindOfClass:[UIImage class]]) {
            NSData *data1 = UIImagePNGRepresentation((UIImage*)self);
            return data1.length>0;
        }
//        else{
//            DebugLog(@"无法判断该类型:%@",self);
//            NSAssert(NO, @"无法判断该类型");
//        }
        return NO;
    }
}

@end
