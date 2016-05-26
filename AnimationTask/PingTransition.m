//
//  PingTransition.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/22.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "PingTransition.h"
#import "TransitionAnima.h"
#import "TransitionAnimation2.h"


@interface PingTransition ()
@property(assign,nonatomic) NvPushTyep type;
@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;
@property(strong,nonatomic) TransitionAnima   *transitionAnima;
@property(strong,nonatomic) TransitionAnimation2 *transitionAnimation2;

@end

@implementation PingTransition


+ (instancetype)transitionWithType:(NvPushTyep)type{
    return [[self alloc] initWithTransitionType:type];
}
-(instancetype)initWithTransitionType:(NvPushTyep)type{
    self = [super init];
    if(self){
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return .75f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{

    if(self.type == NaviPush){
        //1
        TransitionAnima *fromvc =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        TransitionAnimation2 *tovc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];


        //2
        UIView *containerView = [transitionContext containerView];

        //3
        UIView *templeView =  [fromvc.img snapshotViewAfterScreenUpdates:NO];
        templeView.frame = fromvc.imgFrame;
        fromvc.img.hidden = YES;


        [containerView addSubview:tovc.view];
        [containerView addSubview:templeView];
        tovc.view.alpha = 0;

        //4
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            CGRect rect =  CGRectMake(0, 0, tovc.view.frame.size.width, tovc.view.frame.size.height-44);

            templeView.frame = CGRectMake((rect.size.width/2.0f)-92, (rect.size.height/2.0f-10+64)-92, 184, 184);
            NSLog(@"### %@ %s(%d) " ,[NSValue valueWithCGRect: templeView.frame] , __PRETTY_FUNCTION__, __LINE__);
            fromvc.blurview.alpha = 1;
        }completion:^(BOOL finished) {

            [transitionContext completeTransition:YES];
            fromvc.blurview.alpha = 0;
            fromvc.img.hidden = NO;
            tovc.view.alpha = 1;
            [templeView removeFromSuperview];
        }];



    }else{

        //1
        TransitionAnimation2 *fromvc =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        TransitionAnima *tovc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        NSLog(@"### %@ %s(%d) " ,[NSValue valueWithCGRect: fromvc.imgframe], __PRETTY_FUNCTION__, __LINE__);
        //2
        UIView *containerView =  [transitionContext containerView];


        //3
        UIView *templeview = [fromvc.playimg snapshotViewAfterScreenUpdates:NO];
        fromvc.playimg.hidden = YES;
        CGRect rect =  CGRectMake(fromvc.imgframe.origin.x,fromvc.imgframe.origin.y+64, fromvc.imgframe.size.width, fromvc.imgframe.size.height);

        templeview.frame = rect;


        [containerView addSubview:tovc.view];
        [containerView addSubview:templeview];
        tovc.view .alpha = 0;
        //4
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            templeview.frame = tovc.imgFrame;
            fromvc.blurview.alpha = 0;

        }completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            tovc.view .alpha =1 ;
            [templeview removeFromSuperview];

        }];

    }



 }




@end
