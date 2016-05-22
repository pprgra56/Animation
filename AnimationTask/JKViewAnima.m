//
//  JKViewAnima.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/22.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "JKViewAnima.h"

@implementation JKViewAnima
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title =@"JKViewAnima.h";
    self.btn.layer.cornerRadius = 40;
    self.btn.clipsToBounds = YES;
    [self.btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)clickBtn:(UIButton *)sender{


    CABasicAnimation *basic1 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    CABasicAnimation *basic2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];

    if(sender.layer.cornerRadius== 40){


        basic1.toValue = @10;
        basic2.fromValue = @1;
        basic2.toValue = @.6;
    }else{

        basic1.toValue = @40;
        basic2.fromValue = @.6;
        basic2.toValue = @1;
    }

    CAAnimationGroup *group2 = [CAAnimationGroup animation];
    group2.animations = @[basic1 ,basic2];
    group2.duration = 1;
    group2.removedOnCompletion  =NO;
    group2.fillMode = kCAFillModeForwards;
    group2.delegate = self;
    [sender.layer addAnimation:group2  forKey:@"group"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{


    if(self.btn.layer.cornerRadius == 10){

        self.btn.layer.cornerRadius =40;
    }
    else{

        self.btn.layer.cornerRadius = 10;
    }
   // [self.btn.layer removeAnimationForKey:@"group"];
}
@end
