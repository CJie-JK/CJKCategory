//
//  NSString+CJCategory.h
//  JuYouQian
//
//  Created by CJ-MacPro on 15/11/4.
//  Copyright © 2015年 Symdata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CJCategory)

+ (BOOL)isNull:(NSString *)str;
+ (BOOL)isNullOrEmpty:(NSString *)str;

//删除所有空格
- (NSString *)removeAllBlankSpace;

//给range内str添加color
- (NSAttributedString *)getAttributedStringWithColor:(UIColor *)color withRange:(NSRange)range;

//给range内str设置font
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font withRange:(NSRange)range;

//获取最后一个range
- (NSRange)lastRangeOfString:(NSString *)string;

@end
