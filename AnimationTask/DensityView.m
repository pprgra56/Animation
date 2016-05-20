//
//  DensityView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "DensityView.h"

@implementation DensityView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.topBtn setTitle:@"POP. DENSITY" forState:UIControlStateNormal];
        self.topBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.topBtn sizeToFit];
        
        self.numberlabel.text = @"4,647";
        [self.numberlabel sizeToFit];
        
        self.bottomLabel.text = @"PER SQ KILOMETER";
        [self.bottomLabel sizeToFit];
    }
    return self;
}

@end
