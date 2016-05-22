//
//  ViewController.m
//  AnimationTask
//
//  Created by 臧其龙 on 16/4/6.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "JKViewAnima.h"
#import "JKLayerAnima.h"


static NSString * const kCellID = @"kCellID";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSString *> *animationNames;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationNames = @[@"ViewAnimation", @"LayerAnimation", @"TransitionAnimation", @"DynamicAnimation", @"ParticleAnimation"];
}


#pragma mark - TableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationNames? self.animationNames.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = self.animationNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id vc  = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:self.animationNames[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
