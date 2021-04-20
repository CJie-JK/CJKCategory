//
//  NSDictionary+CJCategory.m
//  Mobile-IM
//
//  Created by CJ-MacPro on 15/5/26.
//  Copyright (c) 2015年 DENNY ZHANG (EUCD-EUC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "NSDictionary+CJCategory.h"
#import <objc/message.h>

@implementation NSDictionary (CJCategory)

+ (void)load {
    Method dd = class_getClassMethod(NSDictionary.class, @selector(dictionaryWithDictionary:));
    Method ff = class_getClassMethod(NSDictionary.class, @selector(cj_dictionaryWithDictionary:));
    //交换方法
    method_exchangeImplementations(dd, ff);
}

//过滤掉接口返回的非字典类型数据，如"<null>"等
+ (NSDictionary *)cj_dictionaryWithDictionary:(NSDictionary *)dict {
    if ([dict isKindOfClass:NSDictionary.class]) {
        return [self cj_dictionaryWithDictionary:dict];
    }
    return [NSDictionary dictionary];
}

#pragma mark -

- (NSDictionary *)dictionaryValueForKey:(NSString *)key {
    NSDictionary *dictionary = [self objectForKey:key];
    if (dictionary && [dictionary isKindOfClass:[NSDictionary class]]) {
        return [NSDictionary dictionaryWithDictionary:[self objectForKey:key]];
    }
    return [NSDictionary dictionary];
}

- (NSArray *)arrayValueForKey:(NSString *)key {
    NSArray *array = [self objectForKey:key];
    if (array && [array isKindOfClass:[NSArray class]]) {
        return [NSArray arrayWithArray:array];
    }
    return [NSArray array];
}

- (NSString *)stringValueForKey:(NSString *)key {
    NSString *string = [self objectForKey:key];
    if (string && ![string isKindOfClass:[NSNull class]]) {
        return [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    }
    return @"";
}

- (NSInteger)integerValueForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]]) {
        return 0;
    }
    return [[self objectForKey:key] integerValue];
}

- (float)floatValueForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]]) {
        return 0.0;
    }
    return [[self objectForKey:key] floatValue];
}

- (BOOL)boolValueForKey:(NSString *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]]) {
        return NO;
    }
    return [[self objectForKey:key] boolValue];
}

@end
