//
//  LayerAnimationVC.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/18.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "LayerAnimationVC.h"

@interface LayerAnimationVC ()
@property (weak, nonatomic) IBOutlet UIButton *blueBtn;

@end

@implementation LayerAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LayerAnimation";
    self.blueBtn.layer.cornerRadius = self.blueBtn.bounds.size.width * 0.5;
    self.blueBtn.layer.masksToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)blueBtnclicked:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    CABasicAnimation *cornerRadiusAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    CABasicAnimation *boundsAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
     CAAnimationGroup *groupAni = [CAAnimationGroup animation];
    if (sender.isSelected) {
        cornerRadiusAni.fromValue = @(sender.bounds.size.width * 0.5);
        cornerRadiusAni.toValue = @5;

        boundsAni.fromValue = [NSValue valueWithCGRect:sender.bounds];
        boundsAni.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 20, 20)];

    }else {        
        cornerRadiusAni.fromValue = @5;
        cornerRadiusAni.toValue = @(sender.bounds.size.width * 0.5);
  
        boundsAni.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 20, 20)];
        boundsAni.toValue = [NSValue valueWithCGRect:sender.bounds];
        
    }
    groupAni.animations = @[cornerRadiusAni, boundsAni];
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    groupAni.fillMode = kCAFillModeForwards;
    groupAni.removedOnCompletion = NO;
    [sender.layer addAnimation:groupAni forKey:nil];
    
    
}

//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    [self.blueBtn.layer removeAllAnimations];
//}

@end
