//
//  JKCell.h
//  AnimationTask
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKCell : UITableViewCell


@property(nonatomic,copy)  NSString *imgName;
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *text;

@end
