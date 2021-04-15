//
//  UILabel+CJCategory.m
//  wobaifu
//
//  Created by CJ-MacPro on 2018/4/8.
//  Copyright © 2018年 hisuntech. All rights reserved.
//

#import "UILabel+CJCategory.h"
#import "NSString+CJCategory.h"

@implementation UILabel (CJCategory)

//获取str的frame
- (CGRect)getFrameForString:(NSString *)string {
    
    NSTextStorage *textStorage = [NSTextStorage new];
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    NSTextContainer *textContainer = [NSTextContainer new];
    
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    
    textContainer.size = self.bounds.size;
    textContainer.lineFragmentPadding = 0;
    textContainer.maximumNumberOfLines = self.numberOfLines;
    textContainer.lineBreakMode = self.lineBreakMode;
    
    NSMutableAttributedString *atrStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    [textStorage setAttributedString:atrStr];
    
    NSRange characterRange = [self.text rangeOfString:string];
    NSRange glyphRange = [layoutManager glyphRangeForCharacterRange:characterRange actualCharacterRange:nil];
    
    CGRect range = [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
    return range;
}

//给金额设置动画
- (void)setAnimateAmount:(NSString *)text {
    self.tag = 101;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSCharacterSet *nonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSString *fromAmtText = [self.text stringByTrimmingCharactersInSet:nonDigits];
        NSString *toAmtText = [text stringByTrimmingCharactersInSet:nonDigits];
        
        float addAmt = (toAmtText.floatValue - fromAmtText.floatValue)/100.0;
        if (addAmt) {
            self.tag = 1;
            [self addAmount:addAmt text:text];
        } else {
            self.text = text;
        }
    });
}

- (void)addAmount:(float)amt text:(NSString *)text {
    self.tag++;
    
    if (self.tag < 100) {
        NSCharacterSet *nonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        NSString *fromAmtText = [self.text stringByTrimmingCharactersInSet:nonDigits];
        float fromAmount = fromAmtText.floatValue;
        float toAmount = fromAmount + amt;
        NSString *toAmtText = [NSString stringWithFormat:@"%.2f", toAmount];
        if (![NSString isNullOrEmpty:fromAmtText]) {
            self.text = [self.text stringByReplacingOccurrencesOfString:fromAmtText withString:toAmtText];
        } else {
            fromAmtText = [text stringByTrimmingCharactersInSet:nonDigits];
            self.text = [text stringByReplacingOccurrencesOfString:fromAmtText withString:toAmtText];
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self addAmount:amt text:text];
        });
    } else if (self.tag == 100) {
        self.text = text;
        self.tag = 1;
    }
}

//文字中划线
- (void)setLine:(NSString *)text lineTxt:(NSString *)lineTxt lineColr:(UIColor *)lineColr {    
    NSRange range = [text rangeOfString:lineTxt];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text attributes:nil];
    [attrStr addAttribute:NSForegroundColorAttributeName value:lineColr range:range]; //颜色
    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range]; //中划线
    self.attributedText = attrStr;
}

@end
