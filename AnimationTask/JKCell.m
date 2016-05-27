//
//  JKCell.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "JKCell.h"

@interface JKCell()


@end

@implementation JKCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){

    }
    return self;
}

-(void)setImgName:(NSString *)imgName{
    [self.imgview setImage:[UIImage imageNamed:imgName]];
}
@end
