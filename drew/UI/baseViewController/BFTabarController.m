//
//  BFTabarController.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFTabarController.h"
#import "BFHomePageViewController.h"
#import "BFSettingViewController.h"

@interface BFTabarController()<BFSettingViewControllerDelegat>

@property (nonatomic ,strong) BFHomePageViewController *homePageViewController;
@property (nonatomic ,strong) BFSettingViewController *settingViewController;

@end

@implementation BFTabarController

- (void)viewDidLoad
{
    [super viewDidLoad];
     self.homePageViewController = [[BFHomePageViewController alloc] init];
    [self addChildViewController:_homePageViewController];
    
    self.settingViewController = [[BFSettingViewController alloc] init];
    self.settingViewController.delegat = self;
    [self addChildViewController:_settingViewController];
}
#pragma mark
- (void)settingControllr:(BFSettingViewController *)controll colorDidChange:(UIColor *)color
{
    [_homePageViewController reloadColor:color width:3.0];
}
@end
