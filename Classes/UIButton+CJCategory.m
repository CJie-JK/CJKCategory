//
//  UIButton+CJExtension.m
//  信用卡特惠
//
//  Created by CJ-MacPro on 16/6/6.
//  Copyright © 2016年 逸帆 黄. All rights reserved.
//

#import "UIButton+CJCategory.h"

@implementation UIButton (CJExtension)

//垂直排列
- (void) setImage:(UIImage *)image withTitle:(NSString *)title withFont:(UIFont *)font forState:(UIControlState)stateType {
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:font}];
    
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-30.0, 0.0, 0.0, -titleSize.width)];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:font];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(60.0, -image.size.width, 0.0, 0.0)];
    [self setTitle:title forState:stateType];
}

@end
