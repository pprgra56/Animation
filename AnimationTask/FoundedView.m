//
//  FoundedView.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "FoundedView.h"
#import "UIColor+GuidesColor.h"
#import "UIView+FrameExtension.h"

@interface FoundedView ()



@end

@implementation FoundedView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cardColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor borderColor].CGColor;
        [self addChildViews];
        
    }
    return self;
}

- (void)addChildViews
{
    UIButton *topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topBtn.userInteractionEnabled = NO;
    [topBtn setTitleColor:[UIColor titleColor] forState:UIControlStateNormal];
    topBtn.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    topBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    [topBtn setImage:[UIImage imageNamed:@"statistics-founded-icon"] forState:UIControlStateNormal];
    [topBtn setTitle:@"FOUNDED" forState:UIControlStateNormal];
    topBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [topBtn sizeToFit];
    self.topBtn = topBtn;
    [self addSubview:topBtn];
    
    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.infoBtn = infoBtn;
    [self addSubview:infoBtn];
    [infoBtn setImage:[UIImage imageNamed:@"statistics-info"] forState:UIControlStateNormal];
    [infoBtn sizeToFit];
    
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.textColor = [UIColor titleColor];
    bottomLabel.font = [UIFont boldSystemFontOfSize:11];
    bottomLabel.text = @"AD";
    [bottomLabel sizeToFit];
    self.bottomLabel = bottomLabel;
    [self addSubview: bottomLabel];
    
    
    UILabel *numberLabel = [[UILabel alloc] init];
    numberLabel.textColor = [UIColor titleColor];
    numberLabel.font = [UIFont fontWithName:@"Futura" size:40];
    numberLabel.text = @"43";
    [numberLabel sizeToFit];
    self.numberlabel = numberLabel;
    [self addSubview:numberLabel];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.topBtn.center = CGPointMake(self.width * 0.5, 15);
    self.numberlabel.center = CGPointMake(self.width * 0.5, self.height * 0.5);
    self.bottomLabel.frame = CGRectMake((self.width - self.bottomLabel.width) * 0.5, self.height - self.bottomLabel.height - 8, self.bottomLabel.width, self.bottomLabel.height);
    self.infoBtn.x = self.width - 8 - self.infoBtn.width;
    self.infoBtn.y = self.height - 8 - self.infoBtn.height;
}

@end
