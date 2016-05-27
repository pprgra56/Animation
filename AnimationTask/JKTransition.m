//
//  JKTransition.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/27.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "JKTransition.h"
#import "DetailPage.h"
#import "JKTableViewController.h"
#import "JKCell.h"
#import "UIView+Extension.h"
#import "JKNavigationController.h"

@implementation JKTransition

+ (instancetype)transitionWithType:(presentType )type{
   return  [[self alloc] initWithPresentType:type];
}
- (instancetype)initWithPresentType:(presentType)type{
    self = [super init];
    if(self){
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return _type?.25f:.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{

    if(self.type == present){

        [self presentWithTransitionContext:transitionContext];
    }else{
        [self dismissWithTransitionContext:transitionContext];
    }
}

-(void)presentWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext{

    //1
    JKNavigationController *tovc =  [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UINavigationController  *fromvc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    JKTableViewController *tableviewvc = [fromvc.viewControllers lastObject];
    DetailPage *detailvc = [tovc.viewControllers lastObject];

    //2
    UIView *containerView =  [transitionContext containerView];

    //3.1 (rect)
  
    JKCell *cell = [tableviewvc.tableView cellForRowAtIndexPath:tableviewvc.indexpath];
    CGRect cellrect = cell.frame;
    cellrect.size. height = 195;
    CGRect imagerect = cellrect;// key begin


    UIImageView *tempview = [[UIImageView alloc] initWithImage:cell.imgview.image];
    tempview.frame = imagerect;
    tempview.alpha = 0;
    detailvc.imgview .hidden = YES;
    //3.2

    detailvc.imgview.hidden = YES;


    [containerView addSubview:tovc.view];
    [containerView addSubview:fromvc.view];
    [containerView addSubview:tempview];




    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromvc.view.alpha = 0;
        tempview.alpha = 1;
        tempview.frame = CGRectMake(0, 0, cellrect.size.width, cellrect.size.height);

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        [tempview removeFromSuperview];
        detailvc.imgview .hidden = NO;

    }];


}
-(void)dismissWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext{

    //1
    UINavigationController *tovc =  [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    JKNavigationController *fromvc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    JKTableViewController *tableviewvc = [tovc.viewControllers lastObject];
    DetailPage *detailvc = [fromvc.viewControllers lastObject];
    //2
    UIView *containerView = [transitionContext containerView];



    //3

    JKCell *cell = [tableviewvc.tableView cellForRowAtIndexPath:tableviewvc.indexpath];
    CGRect cellrect = cell.frame;
    cellrect.size. height = 195;
    CGRect imagerect = cellrect;// key end

    UIView *tempview =  [detailvc.imgview snapshotViewAfterScreenUpdates:NO];
    tempview.frame = CGRectMake(0, 0, tovc.view.width, 195);

    [containerView addSubview:tovc.view];
    [containerView addSubview:tempview];
    tempview.alpha = 1;


    //4
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempview.y = tovc.view.height;
        tempview.alpha = 0;

        tovc.view.alpha =1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        [tempview removeFromSuperview];

        tovc.view .hidden = NO;


    }];
}
@end
