//
//  UIImage+CJExtension.h
//  JuYouQian
//
//  Created by CJ-MacPro on 15/8/11.
//  Copyright (c) 2015年 Symdata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CJExtension)

/*
 * 创建纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/*
 * 缩放图片
 */
- (UIImage *)scaleToSize:(CGSize)size;

/*
 * 裁剪图片
 */
- (UIImage *)croppingWithRect:(CGRect)rect;

/*
 * 旋转图片
 */
- (UIImage *)rotationWithOrientation:(UIImageOrientation)orientation;

@end
