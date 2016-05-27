//
//  JKNavigationController.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/27.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "JKNavigationController.h"
#import "JKTransition.h"

@implementation JKNavigationController

#pragma mark - UIViewControllerTransitioningDelegate
-(void)viewDidLoad{
    [super viewDidLoad];
    self. transitioningDelegate = self;
    self. modalPresentationStyle = UIModalPresentationCustom;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [JKTransition transitionWithType:present];

}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [JKTransition transitionWithType:dismiss];
}
@end
