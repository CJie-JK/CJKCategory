//
//  UIImage+CJExtension.m
//  JuYouQian
//
//  Created by CJ-MacPro on 15/8/11.
//  Copyright (c) 2015年 Symdata. All rights reserved.
//

#import "UIImage+CJCategory.h"

@implementation UIImage (CJExtension)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)scaleToSize:(CGSize)size
{    
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)croppingWithRect:(CGRect)rect
{
    CGImageRef imageRef = self.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *cropImage = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return cropImage;
}

- (UIImage *)rotationWithOrientation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    CGRect rect;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, height, width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, height, width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, width, height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, width, height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), self.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    return newPic;
}

@end
