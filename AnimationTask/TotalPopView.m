//
//  TotalPopView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TotalPopView.h"

@implementation TotalPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.topBtn setImage:[UIImage imageNamed:@"statistics-population-icon"] forState:UIControlStateNormal];
        [self.topBtn setTitle:@"TOTAL COUNTRY POP." forState:UIControlStateNormal];
        self.topBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.topBtn sizeToFit];
        
        self.numberlabel.text = @"63,395,580";
        [self.numberlabel sizeToFit];
        
        [self.infoBtn setHidden:YES];
        [self.bottomLabel setHidden:YES];
    
    }
    return self;
}

@end
