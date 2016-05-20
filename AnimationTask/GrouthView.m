//
//  GrouthView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "GrouthView.h"

@implementation GrouthView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.topBtn setTitle:@"GROWTH RATE" forState:UIControlStateNormal];
          self.topBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.topBtn sizeToFit];
        
        self.numberlabel.text = @"0.14";
        [self.numberlabel sizeToFit];
        self.bottomLabel.text = @"%";
        [self.bottomLabel sizeToFit];
    }
    return self;
}

@end
