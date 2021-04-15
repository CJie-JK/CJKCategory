//
//  CJUserDefault.h
//  Mobile-IM
//
//  Created by wbfCsMacPc on 15-4-21.
//  Copyright (c) 2015年 DENNY ZHANG (EUCD-EUC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>

#define UDKey_authUser @"authenticateUser" //指纹解锁

@interface CJUserDefault : NSObject

+ (void)SaveBoolValueToUserDefault:(BOOL)value forKey:(NSString *)keyString;
+ (BOOL)GetBoolValueFromUserDefaultByKey:(NSString *)keyString;

+ (void)SaveObjectToUserDefault:(id)value forKey:(NSString *)keyString;
+ (id)GetObjectFromUserDefaultByKey:(NSString *)keyString;

+ (void)SaveCustomObjectToUserDefault:(id)customValue forKey:(NSString *)keyString;
+ (id)GetCustomObjectFromUserDefaultByKey:(NSString *)keyString;

+ (void)removeValueFromUserDefaultByKey:(NSString *)keyString;
//+ (void)removeAllValueFromUserDefault;

@end
