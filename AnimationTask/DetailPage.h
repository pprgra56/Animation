//
//  DetailPage.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPage : UIViewController<UIViewControllerTransitioningDelegate>


@property(nonatomic,copy)  NSString *imgname;


@property(strong,nonatomic) UIImageView *imgview;

@end
