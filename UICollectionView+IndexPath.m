//
//  UICollectionView+IndexPath.m
//  MiYaApp
//
//  Created by 邵峰 on 2016/5/18.
//  Copyright © 2017年 邵峰. All rights reserved.

#import "UICollectionView+IndexPath.h"
#import <objc/runtime.h>

static NSString * const KIndexPathKey = @"kIndexPathKey";

@implementation UICollectionView (IndexPath)

-(void)setCurrentIndexPath:(NSIndexPath *)indexPath
{
    //通过此函数保存indexPath
    objc_setAssociatedObject(self, &KIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)currentIndexPath
{
    NSIndexPath * indexPath = objc_getAssociatedObject(self, &KIndexPathKey);
    return indexPath;
}

@end
