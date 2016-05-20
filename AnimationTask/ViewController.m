//
//  ViewController.m
//  AnimationTask
//
//  Created by 臧其龙 on 16/4/6.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewController.h"

static NSString * const kCellID = @"kCellID";

static NSString * const kShowViewAnimationVC = @"kShowViewAnimationVC";
static NSString * const kShowLayerAnimationVC = @"kShowLayerAnimationVC";
static NSString * const kShowTransitionAnimationVC = @"kShowTransitionAnimationVC";
static NSString * const kShowDynamicAnimationVC = @"kShowDynamicAnimationVC";
static NSString * const kShowParticleAnaimationVC = @"kShowParticleAnaimationVC";
static NSString * const kShowCityguidesVC = @"kShowCityguidesVC";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSString *> *animationNames;
@property (nonatomic, strong) NSArray *segueArray;


@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationNames = @[@"ViewAnimation", @"LayerAnimation", @"TransitionAnimation", @"DynamicAnimation", @"ParticleAnimation",@"CityGuidesAnimation"];
    self.segueArray = @[kShowViewAnimationVC,kShowLayerAnimationVC,kShowTransitionAnimationVC,kShowDynamicAnimationVC,kShowParticleAnaimationVC,kShowCityguidesVC];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
   // TODO: Finish Click Action
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self performSegueWithIdentifier:self.segueArray[indexPath.row] sender:nil];
    
}

@end
