//
//  UITextField+CJExtension.h
//  Mobile-IM
//
//  Created by CJ-MacPro on 14-12-1.
//  Copyright (c) 2014年 DENNY ZHANG (EUCD-EUC-ISD-OOCLL/ZHA). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CJExtension)

- (void)setPlaceholderColor:(UIColor *)color;
- (void)setPlaceholderFont:(UIFont *)font;

- (void)setClearButton;
- (void)setSeePasswordButton;
- (void)setSeePasswordAndClearButton;

@end
