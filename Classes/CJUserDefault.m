//
//  CJUserDefault.m
//  Mobile-IM
//
//  Created by wbfCsMacPc on 15-4-21.
//  Copyright (c) 2015年 DENNY ZHANG (EUCD-EUC-ISD-OOCLL/ZHA). All rights reserved.
//

//    [[NSUserDefaults standardUserDefaults] synchronize];  //同步到plist

#import "CJUserDefault.h"

@implementation CJUserDefault

+ (void)SaveBoolValueToUserDefault:(BOOL)value forKey:(NSString *)keyString {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:keyString];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)GetBoolValueFromUserDefaultByKey:(NSString *)keyString {
    return [[NSUserDefaults standardUserDefaults] boolForKey:keyString];
}

+ (void)SaveObjectToUserDefault:(id)value forKey:(NSString *)keyString {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:keyString];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (id)GetObjectFromUserDefaultByKey:(NSString *)keyString {
    return [[NSUserDefaults standardUserDefaults] objectForKey:keyString];
}

+ (void)SaveCustomObjectToUserDefault:(id)customValue forKey:(NSString *)keyString {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:customValue];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:keyString];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (id)GetCustomObjectFromUserDefaultByKey:(NSString *)keyString {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:keyString];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (void)removeValueFromUserDefaultByKey:(NSString *)keyString {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:keyString];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//+ (void)removeAllValueFromUserDefault {
//    NSString *name = [CustomFunction getValueForKey:@"CFBundleIdentifier" withConfig:nil];
//    name = [name stringByAppendingPathExtension:@"plist"];
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
//    path = [path stringByAppendingPathComponent:@"Preferences"];
//    path = [path stringByAppendingPathComponent:name];
//    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
//}

@end
