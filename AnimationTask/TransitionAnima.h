//
//  TransitionAnima.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/22.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionAnima : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UIView *blurview;

@property(assign,nonatomic) CGRect imgFrame;
@end
