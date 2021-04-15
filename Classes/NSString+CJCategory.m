//
//  NSString+CJCategory.m
//  JuYouQian
//
//  Created by CJ-MacPro on 15/11/4.
//  Copyright © 2015年 Symdata. All rights reserved.
//

#import "NSString+CJCategory.h"

@implementation NSString (CJCategory)

+ (BOOL)isNull:(NSString *)str {
    if (str==nil || [str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isNullOrEmpty:(NSString *)str {
    if ([self isNull:str]) {
        return YES;
    }
    else if (str.length == 0) {
        return YES;
    }
    return NO;
}

//删除所有空格
- (NSString *)removeAllBlankSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

//给range内str设置color
- (NSAttributedString *)getAttributedStringWithColor:(UIColor *)color withRange:(NSRange)range  {
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:self];
    [attribute addAttribute:NSForegroundColorAttributeName value:color range:range];
    return attribute;
}

//给range内str设置font
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font withRange:(NSRange)range  {
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:self];
    [attribute addAttribute:NSFontAttributeName value:font range:range];
    return attribute;
}

//获取最后一个range
- (NSRange)lastRangeOfString:(NSString *)string {
    NSInteger loc = NSNotFound;
    NSString *tempStr = self;
    while ([tempStr rangeOfString:string].location != NSNotFound)
    {
        NSRange range = [tempStr rangeOfString:string];
        tempStr = [tempStr substringFromIndex:range.location + range.length];
        
        if (loc == NSNotFound) {
            loc = range.location;
        } else {
            loc = loc + string.length + range.location;
        }
    }
    return NSMakeRange(loc, string.length);
}

@end
