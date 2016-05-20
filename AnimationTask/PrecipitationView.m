//
//  PrecipitationView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "PrecipitationView.h"
#import "UIColor+GuidesColor.h"

@implementation PrecipitationView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor borderColor].CGColor;

}

+ (instancetype)precipitationView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"PrecipitationView" owner:self options:nil] lastObject];
}

@end
