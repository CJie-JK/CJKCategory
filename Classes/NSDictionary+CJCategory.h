//
//  NSDictionary+CJCategory.h
//  Mobile-IM
//
//  Created by CJ-MacPro on 15/5/26.
//  Copyright (c) 2015年 DENNY ZHANG (EUCD-EUC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CJCategory)

- (NSDictionary *)dictionaryValueForKey:(NSString *)key;
- (NSArray *)arrayValueForKey:(NSString *)key;
- (NSString *)stringValueForKey:(NSString *)key;
- (NSInteger)integerValueForKey:(NSString *)key;
- (float)floatValueForKey:(NSString *)key;
- (BOOL)boolValueForKey:(NSString *)key;

@end
