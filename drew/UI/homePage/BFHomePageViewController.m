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
}
- (void)reloadColor:(UIColor*)color width:(CGFloat)width
{
    _brawView.currentWitd = width;
    _brawView.currentColor = color;
}
@end
