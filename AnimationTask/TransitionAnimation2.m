//
//  TransitionAnimation2.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/23.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TransitionAnimation2.h"
#import "PingTransition.h"

@interface TransitionAnimation2()



@end

@implementation TransitionAnimation2

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"TransitionAnimation2.h";
    self.view .backgroundColor = [UIColor whiteColor];
    self.playView .frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 100);
    [self.view addSubview:self.playView];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backout)];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    [self.playimg setNeedsLayout];
    [self.playimg layoutIfNeeded];

    self.imgframe = self.playimg.frame;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:.35f animations:^{

         self.playView .frame = CGRectMake(0, self.view.bounds.size.height-100, self.view.bounds.size.width, 100);
    }];
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    [UIView animateWithDuration:.35f animations:^{

        self.playView .frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 100);
    }];
}

- (void)backout{
  
    [self.navigationController popViewControllerAnimated:YES];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    PingTransition *p  = nil;
    if(operation == UINavigationControllerOperationPush){
          p = [PingTransition transitionWithType:NaviPush];

    }else{

        p = [PingTransition transitionWithType:NaviPop];
    }
    return p;

}
@end
