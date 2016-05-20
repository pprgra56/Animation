//
//  ElevationView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ElevationView.h"

@implementation ElevationView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.topBtn setImage:[UIImage imageNamed:@"statistics-elevation-icon"] forState:UIControlStateNormal];
        [self.topBtn setTitle:@"ELEVATION" forState:UIControlStateNormal];
        NSLog(@"%@",NSStringFromCGRect(self.topBtn.frame));
        [self.topBtn sizeToFit];
        
        self.numberlabel.text = @"61";
        [self.infoBtn setHidden:YES];
        self.bottomLabel.text = @"METERS";
        [self.bottomLabel sizeToFit];
    }
    return self;
}
//


@end
