//
//  UIColor+CJExtension.h
//  JuYouQian
//
//  Created by CJ-MacPro on 15/9/23.
//  Copyright (c) 2015年 Symdata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CJExtension)

+ (UIColor *)fromHexValue:(NSUInteger)hex;
+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)fromShortHexValue:(NSUInteger)hex;
+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithString:(NSString *)string; // {#FFF|#FFFFFF|#FFFFFFFF}{,0.6}
+ (UIColor *)colorWithString:(NSString *)string alpha:(CGFloat)alpha;

@end
