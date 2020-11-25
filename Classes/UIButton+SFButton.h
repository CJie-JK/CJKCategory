//
//  UIButton+SFButton.h
//  MiYaApp
//
//  Created by 邵峰 on 2016/5/18.
//  Copyright © 2017年 邵峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SFButton)

@property(nonatomic ,copy)void(^block)(UIButton*);

-(void)addTapBlock:(void(^)(UIButton*btn))block;

@end
