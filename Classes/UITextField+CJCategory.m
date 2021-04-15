//
//  UITextField+CJExtension.m
//  Mobile-IM
//
//  Created by CJ-MacPro on 14-12-1.
//  Copyright (c) 2014年 DENNY ZHANG (EUCD-EUC-ISD-OOCLL/ZHA). All rights reserved.
//

#import "UITextField+CJCategory.h"

@implementation UITextField (CJExtension)

//禁用输入框功能按钮
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO;
}

- (void)setPlaceholderColor:(UIColor *)color {
    if (self.placeholder == nil || self.placeholder.length == 0) {
        return;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, nil];
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dict];
    [self setAttributedPlaceholder:attribute];
}

- (void)setPlaceholderFont:(UIFont *)font {
    if (self.placeholder == nil || self.placeholder.length == 0) {
        return;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:self.placeholder attributes:dict];
    [self setAttributedPlaceholder:attribute];
}

- (void)setClearButton {
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [clearBtn setImage:[UIImage imageNamed:@"ic_tf_clear"] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearClick:) forControlEvents:UIControlEventTouchUpInside];
    [clearBtn setTag:121];
    [clearBtn setHidden:YES];
    self.rightView = clearBtn;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)setSeePasswordButton {
    UIButton *tf_rightBt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [tf_rightBt setImage:[UIImage imageNamed:@"ic_eye_close"] forState:UIControlStateNormal];
    [tf_rightBt setImage:[UIImage imageNamed:@"ic_eye_open"] forState:UIControlStateSelected];
    [tf_rightBt addTarget:self action:@selector(seePasswordClick:) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = tf_rightBt;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.secureTextEntry = YES;
}

- (void)setSeePasswordAndClearButton {
    UIView *vi_right = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 65, 40)];
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 40)];
    [clearBtn setImage:[UIImage imageNamed:@"ic_tf_clear"] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearClick:) forControlEvents:UIControlEventTouchUpInside];
    [clearBtn setTag:121];
    [clearBtn setHidden:YES];
    [vi_right addSubview:clearBtn];
    
    UIButton *tf_rightBt = [[UIButton alloc] initWithFrame:CGRectMake(25, 0, 40, 40)];
    [tf_rightBt setImage:[UIImage imageNamed:@"ic_eye_close"] forState:UIControlStateNormal];
    [tf_rightBt setImage:[UIImage imageNamed:@"ic_eye_open"] forState:UIControlStateSelected];
    [tf_rightBt addTarget:self action:@selector(seePasswordClick:) forControlEvents:UIControlEventTouchUpInside];
    [tf_rightBt setTag:122];
    [vi_right addSubview:tf_rightBt];
    
    self.rightView = vi_right;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.secureTextEntry = YES;
}


#pragma mark - private

- (void)clearClick:(UIButton *)sender {
    self.text = @"";
    sender.hidden = YES;
}

- (void)seePasswordClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        self.secureTextEntry = YES;
    } else {
        sender.selected = YES;
        self.secureTextEntry = NO;
        self.keyboardType = UIKeyboardTypeASCIICapable;
    }
}


@end
