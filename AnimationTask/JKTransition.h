//
//  JKTransition.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/27.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef enum{
    present = 0,
    dismiss
}presentType;


@interface JKTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithType:(presentType )type;

@property(assign,nonatomic) presentType type;
@end
