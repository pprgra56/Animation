//
//  PingTransition.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/22.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TransitionAnima.h"

typedef NS_ENUM(NSUInteger,NvPushTyep){
    NaviPush = 0,
    NaviPop
};

@interface PingTransition : NSObject<UIViewControllerAnimatedTransitioning>


+ (instancetype)transitionWithType:(NvPushTyep)type;

@end
