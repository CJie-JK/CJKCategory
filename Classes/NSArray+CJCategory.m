//
//  NSArray+CJCategory.m
//  
//
//  Created by CJ-MacPro on 2021/4/20.
//

#import "NSArray+CJCategory.h"
#import <objc/message.h>

@implementation NSArray (CJCategory)

+ (void)load {
    Method dd = class_getClassMethod(NSArray.class, @selector(arrayWithArray:));
    Method ff = class_getClassMethod(NSArray.class, @selector(cj_arrayWithArray:));
    //交换方法
    method_exchangeImplementations(dd, ff);
}

//过滤掉接口返回的非数组类型数据，如"<null>"等
+ (NSArray *)cj_arrayWithArray:(NSArray *)ary {
    if ([ary isKindOfClass:NSArray.class]) {
        return [self cj_arrayWithArray:ary];
    }
    return [NSArray array];
}

@end
