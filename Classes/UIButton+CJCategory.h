//
//  UIButton+CJExtension.h
//  信用卡特惠
//
//  Created by CJ-MacPro on 16/6/6.
//  Copyright © 2016年 逸帆 黄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CJExtension)

//垂直排列
- (void) setImage:(UIImage *)image withTitle:(NSString *)title withFont:(UIFont *)font forState:(UIControlState)stateType;

@end
