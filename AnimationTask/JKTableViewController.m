//
//  JKTableViewController.m
//  AnimationTask
//
//  Created by 常琼 on 16/5/26.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "JKTableViewController.h"
#import "JKCell.h"
#import "DetailPage.h"

@interface JKTableViewController()
@property(strong,nonatomic) NSArray  *data_array;


@end

@implementation JKTableViewController

static NSString *const ID  = @"cell";

-(NSArray *)data_array{

    if(_data_array == nil){
        _data_array = @[@"a",@"b",@"c",@"d",@"e",@"f"];
    }
    return _data_array;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data_array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JKCell *cell = (JKCell *) [tableView dequeueReusableCellWithIdentifier:ID];
    cell.imgName = _data_array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexpath = indexPath;
    JKCell *cell = [tableView cellForRowAtIndexPath:indexPath];


    UIViewController *nv = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"NVDetailPage"];
   DetailPage *detailvc =  [nv.childViewControllers lastObject];
    detailvc.imgname = self.data_array[indexPath.row];
    [self presentViewController:nv animated:YES completion:nil];
}
@end
