//
//  AreaView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "AreaView.h"

@implementation AreaView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.topBtn setTitle:@"AREA" forState:UIControlStateNormal];
        [self.topBtn setImage:[UIImage imageNamed:@"statistics-area-icon"] forState:UIControlStateNormal];
  
        self.topBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.topBtn sizeToFit];
        
        self.numberlabel.text = @"1,706";
        self.bottomLabel.text = @"SQ KM";
        [self.numberlabel sizeToFit];
        [self.bottomLabel sizeToFit];
        
        [self.infoBtn setHidden:YES];
    }
    return self;
}

@end
