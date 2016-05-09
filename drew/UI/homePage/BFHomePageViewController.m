//
//  BFHomePageViewController.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFHomePageViewController.h"
#import "BFDrawView.h"
#import "BFBaseStroker.h"

@interface BFHomePageViewController()
@property (nonatomic ,weak) BFDrawView *brawView;
@end

@implementation BFHomePageViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"画布";
    BFDrawView *brawView = [[BFDrawView alloc] initWithFrame:self.view.frame];
    self.brawView = brawView;
    [self.view addSubview:brawView];
    
    UIButton *buttont = [UIButton buttonWithType:UIButtonTypeCustom];
    buttont.frame = CGRectMake(10, 30, 60, 30);
    buttont.backgroundColor = [UIColor redColor];
    [self.view addSubview:buttont];
    [buttont setTitle:@"清屏" forState:UIControlStateNormal];
    [buttont addTarget:self action:@selector(clean) forControlEvents:UIControlEventTouchUpInside];
}
- (void)reloadColor:(UIColor*)color width:(CGFloat)width
{
    _brawView.currentWitd = width;
    _brawView.currentColor = color;
}

- (void)clean
{
    [_brawView removeAll];
}
@end
