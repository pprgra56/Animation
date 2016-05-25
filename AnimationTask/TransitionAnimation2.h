//
//  TransitionAnimation2.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/23.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionAnimation2 : UIViewController<UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIView *playView;

@property (weak, nonatomic) IBOutlet UIImageView *playimg;

@property (weak, nonatomic) IBOutlet UIView *blurview;

@property(assign,nonatomic) CGRect imgframe;

@end
