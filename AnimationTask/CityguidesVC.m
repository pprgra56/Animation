//
//  CityguidesVC.m
//  AnimationTask
//
//  Created by XUN WANG on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "CityguidesVC.h"
#import "UIView+FrameExtension.h"
#import "FoundedView.h"
#import "UIColor+GuidesColor.h"
#import "ElevationView.h"
#import "TemperatureView.h"
#import "PrecipitationView.h"
#import "AreaView.h"
#import "CityPopView.h"
#import "GrouthView.h"
#import "DensityView.h"
#import "PopulationView.h"
#import "TotalPopView.h"

static CGFloat const kMargin = 10.0;

@interface CityguidesVC () <UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView *guidesView;
@property (nonatomic, weak) FoundedView *foundedView;
@property (nonatomic, weak) ElevationView *elevationView;
@property (nonatomic, weak) TemperatureView *temperatureView;
@property (nonatomic, weak) PrecipitationView *precipitationView;
@property (nonatomic, weak) AreaView *areaView;
@property (nonatomic, weak) CityPopView *cityPopView;
@property (nonatomic, weak) GrouthView *grouthView;
@property (nonatomic, weak) DensityView *densityView;
@property (nonatomic, weak) UIView *bigView;
@property (nonatomic, weak) UIView *lastView;
@end

@implementation CityguidesVC
{
    CGFloat orangeX;
    CGFloat blackX;
}

+ (void)initialize
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    [self addScrollView];
    [self addChildViews];
}

- (void)setUpNavigationBar
{
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.userInteractionEnabled = NO;
    titleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
//    [titleBtn setTitleColor:[UIColor titleColor] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"main-menu-iphone-essentials-selected"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"Stats" forState:UIControlStateNormal];
    titleBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [titleBtn sizeToFit];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bar"] forBarMetrics:UIBarMetricsDefault];

    self.navigationItem.titleView = titleBtn;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"weather-radar-back-arrow-ipad"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClicked)];
}

- (void)backBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addScrollView
{
    
    UIScrollView *guidesView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.guidesView = guidesView;
    [self.view addSubview:guidesView];
    guidesView.backgroundColor = [UIColor backColor];
    self.view.backgroundColor = [UIColor backColor];
    
    self.guidesView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [UIView animateWithDuration:0.3 animations:^{
//        self.guidesView.height = [UIScreen mainScreen].bounds.size.height;
//    }];
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
         self.guidesView.y = 0;
    } completion:nil];
    
}

- (void)addChildViews
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;

    FoundedView *foundedView = [[FoundedView alloc] initWithFrame:CGRectMake(kMargin, kMargin, (screenWidth - 3 * kMargin) * 0.5, 138)];
    self.foundedView = foundedView;
    [self.guidesView addSubview:foundedView];
    
    ElevationView *elevationView = [[ElevationView  alloc] initWithFrame:CGRectMake(CGRectGetMaxX(foundedView.frame) + kMargin, foundedView.y, foundedView.width, foundedView.height)];
    self.elevationView = elevationView;
    [self.guidesView addSubview:elevationView];

    orangeX = elevationView.x;
    
    TemperatureView *temperatureView = [TemperatureView temperatureView];
    temperatureView.frame = CGRectMake(kMargin, CGRectGetMaxY(foundedView.frame) + kMargin, screenWidth - 2 * kMargin, 100);
    self.temperatureView = temperatureView;
    [self.guidesView addSubview:temperatureView];
    
    PrecipitationView *precipitationView = [PrecipitationView precipitationView];
    precipitationView.frame = CGRectMake(kMargin, CGRectGetMaxY(temperatureView.frame) + kMargin, temperatureView.width, 180);
    self.precipitationView = precipitationView;
    [self.guidesView addSubview:precipitationView];
    
    AreaView *areaView = [[AreaView alloc] initWithFrame:CGRectMake(kMargin, CGRectGetMaxY(precipitationView.frame) + kMargin, foundedView.width - 35, foundedView.height)];
    self.areaView = areaView;
    [self.guidesView addSubview:areaView];
    
    CityPopView *cityPopView = [[CityPopView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(areaView.frame) + kMargin, areaView.y, foundedView.width + 35, areaView.height)];
    self.cityPopView = cityPopView;
    [self.guidesView addSubview:cityPopView];
    blackX = cityPopView.x;
    
    //////
    GrouthView *grouthView = [[GrouthView alloc] initWithFrame:CGRectMake(kMargin, CGRectGetMaxY(cityPopView.frame) + kMargin, areaView.width, areaView.height)];
    self.grouthView = grouthView;
    [self.guidesView addSubview:grouthView];
    
    DensityView *densityView = [[DensityView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(grouthView.frame) + kMargin, grouthView.y, cityPopView.width, cityPopView.height)];
    self.densityView = densityView;
    [self.guidesView addSubview:densityView];

    
    PopulationView *bigView = [PopulationView populationView];
    bigView.frame = CGRectMake(2 * kMargin - screenWidth, CGRectGetMaxY(densityView.frame) + kMargin, screenWidth - 2 * kMargin, screenWidth - 2 * kMargin);
    self.bigView = bigView;
    [self.guidesView addSubview:bigView];
    
    TotalPopView *lastView = [[TotalPopView alloc] initWithFrame:CGRectMake(screenWidth, CGRectGetMaxY(bigView.frame) + kMargin, bigView.width, 180)];
    self.lastView = lastView;
    [self.guidesView addSubview:lastView];
   
    self.guidesView.contentSize = CGSizeMake(screenWidth, CGRectGetMaxY(lastView.frame) + kMargin);
    self.guidesView.bounces = YES;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    if (offsetY < -98) {
        self.areaView.x = kMargin - (-98 - offsetY);
        self.cityPopView.x = blackX + (-98 - offsetY);
    }
    
    if (offsetY <= -64) {
        self.foundedView.x = kMargin;
        self.elevationView.x = orangeX;
    }
    if (offsetY > -64) {
        self.foundedView.x = - (offsetY + 64) + kMargin;
        self.elevationView.x = orangeX + (offsetY + 64);
     
    }
    if (offsetY < 30) {
        self.grouthView.x = kMargin - (30 - offsetY);
        self.densityView.x = blackX + (30 - offsetY);
    }
//    if (offsetY > 10) {
//        self.grouthView.x = - CGRectGetWidth(self.grouthView.frame) - kMargin + (offsetY + 64) *5;
//        self.densityView.x = [UIScreen mainScreen].bounds.size.width - (offsetY + 64) *6.6;
//    }
    if (offsetY > 65) {
        self.temperatureView.x = kMargin - (offsetY - 65) * 3;
    }
    if (offsetY <= 65) {
        self.temperatureView.x = kMargin;
    }
    if (offsetY > 174) {
        self.precipitationView.x = kMargin + (offsetY - 174) * 1.3;
    }
    if (offsetY > 30 && offsetY <= 212) {
        self.bigView.x = 2 * kMargin - [UIScreen mainScreen].bounds.size.width + (offsetY - 30) * 2;
    }
    if (offsetY > 212 && offsetY <= 678) {
        self.bigView.x = kMargin;
    }
    if (offsetY > 678) {
        self.bigView.x = kMargin + (offsetY - 678);
    }
    if (offsetY <= 174) {
        self.precipitationView.x = kMargin;
    }
    if (offsetY > 366) {
        self.areaView.x = kMargin - (offsetY - 366);
        self.cityPopView.x = blackX + (offsetY - 366);
    }
    if (offsetY <= 366 && offsetY >= -98) {
        self.areaView.x = kMargin;
        self.cityPopView.x = blackX;
    }
    if (offsetY > 393) {
        self.lastView.x = [UIScreen mainScreen].bounds.size.width - (offsetY - 393) * 3;
    }
    if (offsetY > 496) {
        self.grouthView.x = kMargin - (offsetY - 496) * 0.2;
        self.densityView.x = blackX + (offsetY - 496) * 0.2;

    }
//    if (offsetY > 606) {
//        self.grouthView.x = kMargin - (offsetY - 606) * 0.2;
//        self.densityView.x = blackX + (offsetY - 606) * 0.2;
//    }
    if (offsetY <= 496 && offsetY > 30) {
        self.grouthView.x = kMargin;
        self.densityView.x = blackX;
    }
    if (offsetY > 514) {
        self.lastView.x = kMargin;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
