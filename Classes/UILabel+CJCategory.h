//
//  UILabel+CJCategory.h
//  wobaifu
//
//  Created by CJ-MacPro on 2018/4/8.
//  Copyright © 2018年 hisuntech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CJCategory)

//获取str的frame
- (CGRect)getFrameForString:(NSString *)string;

//给金额设置动画
- (void)setAnimateAmount:(NSString *)text;

//文字中划线
- (void)setLine:(NSString *)text lineTxt:(NSString *)lineTxt lineColr:(UIColor *)lineColr;

@end
