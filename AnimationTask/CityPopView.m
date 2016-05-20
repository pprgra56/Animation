//
//  CityPopView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "CityPopView.h"

@implementation CityPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.topBtn setImage:[UIImage imageNamed:@"statistics-population-icon"] forState:UIControlStateNormal];
        [self.topBtn setTitle:@"CITY POP." forState:UIControlStateNormal];
          self.topBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.topBtn sizeToFit];
        
        self.numberlabel.text = @"7,927,08";
        [self.numberlabel sizeToFit];
        
        [self.bottomLabel setHidden:YES];
        
        
    }
    return self;
}

@end
