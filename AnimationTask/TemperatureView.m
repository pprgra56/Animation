//
//  TemperatureView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TemperatureView.h"
#import "UIColor+GuidesColor.h"

@interface TemperatureView ()
@property (weak, nonatomic) IBOutlet UIButton *centerView;

@end

@implementation TemperatureView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.centerView.layer.cornerRadius = 10;
    self.centerView.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor borderColor].CGColor;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

+ (instancetype)temperatureView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TemperatureView" owner:self options:nil] lastObject];
}

@end
