//
//  CALayer+CJExtension.m
//  JuYouQian
//
//  Created by CJ-MacPro on 15/10/27.
//  Copyright © 2015年 Symdata. All rights reserved.
//

#import "CALayer+CJCategory.h"

@implementation CALayer (CJCategory)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
