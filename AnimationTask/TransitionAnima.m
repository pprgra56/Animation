//
//  TransitionAnima.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/22.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TransitionAnima.h"
#import "PingTransition.h"
#import "TransitionAnimation2.h"

@implementation TransitionAnima
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"TransitionAnima.h";


}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basic.duration = 3;
    basic.repeatCount = CGFLOAT_MAX;

    basic.toValue = @(M_PI *2);
    [self.img.layer addAnimation:basic forKey:@"rotation"];

    self.blurview.alpha =0;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.imgFrame = self.img.frame;
}



- (IBAction)clickBtn:(UIButton *)sender {
    TransitionAnimation2 *t2 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TransitionAnimation2"];

    self.navigationController.delegate = t2;
    [self.navigationController pushViewController:t2 animated:YES];
}


@end
