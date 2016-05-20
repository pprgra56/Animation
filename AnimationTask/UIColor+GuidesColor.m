//
//  UIColor+GuidesColor.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "UIColor+GuidesColor.h"

@implementation UIColor (GuidesColor)

+ (instancetype)cardColor
{
    return [UIColor colorWithRed:28.0/255 green:32.0/255 blue:32.0/255 alpha:1.0];
}

+ (instancetype)backColor
{
    return [self colorWithRed:28.0/255 green:33.0/255 blue:35.0/255 alpha:1.0];
}

+ (instancetype)titleColor
{
    return [self colorWithRed:163.0/255 green:175.0/255 blue:180.0/255 alpha:1.0];
}

+ (instancetype)borderColor
{
    return [UIColor colorWithRed:21.0/255 green:23.0/255 blue:27.0/255 alpha:0.89];
}

@end
