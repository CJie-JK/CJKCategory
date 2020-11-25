//
//  NSString+URLEncoding.m
//  Soccer
//
//  Created by zhm on 15-8-14.
//  Copyright (c) 2015年 zhm. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString(URLEncoding)

- (NSString *)URLEncodedString {
    NSCharacterSet *charset = [NSCharacterSet     characterSetWithCharactersInString:@"!#$&'()*+,/:;=?@[]"].invertedSet;
    NSString *encoded = [self     stringByAddingPercentEncodingWithAllowedCharacters:charset];
    return encoded;
}

@end
