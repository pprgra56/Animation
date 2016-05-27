//
//  DetailPage.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "DetailPage.h"
#import "JKTransition.h"
#import "UIView+Extension.h"

@interface DetailPage()<UIViewControllerTransitioningDelegate>

@property(strong,nonatomic) UITextView *textview;

@end


@implementation DetailPage
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidLoad{
    [super viewDidLoad ];
    self.view.backgroundColor = [UIColor whiteColor];



    UINavigationBar *bar = (UINavigationBar *) self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageNamed:@"topbarPac"] forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;

    self.imgview =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imgname]];
    self.imgview.frame = CGRectMake(0, 0, self.view.frame.size.width, 195);
    [self.view addSubview:self.imgview];


    self.textview = [[UITextView alloc] init];
    [self.textview setText:@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"];
    self.textview.frame = CGRectMake(0, self.view.height, self.view.width, self.view.height-195);
    [self.view addSubview:self.textview];
}
-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    [UIView animateWithDuration:.75f delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        self.textview.frame = CGRectMake(0, self.imgview.size.height, self.view.width, self.view.height-195);


    } completion:^(BOOL finished) {

    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:.75f delay:0.0 usingSpringWithDamping:0.55 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        self.textview.frame = CGRectMake(0, self.view.height, self.view.width, self.view.height-195);


    } completion:^(BOOL finished) {
        
    }];



}


@end
