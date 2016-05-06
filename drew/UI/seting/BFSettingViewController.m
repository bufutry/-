//
//  BFSettingViewController.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFSettingViewController.h"
#import "BFColorSlideView.h"

@interface BFSettingViewController()<BFColorSlideViewDelegat>
@property (nonatomic ,weak) UIView *containView;
@end

@implementation BFSettingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    BFColorSlideView *colorSlider = [[BFColorSlideView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180)];
    colorSlider.delegat = self;
    [self.view addSubview:colorSlider];
    
    UIView *containView = [[UIView alloc] initWithFrame:CGRectMake(60, colorSlider.MaxY+60, self.view.width-120, 60)];
    [self.view addSubview:containView];
    _containView = containView;
    containView.layer.cornerRadius = 5;
    containView.clipsToBounds = YES;
    
    self.title = @"设置";
}

#pragma makr - delegat
- (void)colorSlider:(BFColorSlideView *)slider didChanageColor:(UIColor *)color
{
    _containView.backgroundColor = color;
    if ([self.delegat respondsToSelector:@selector(settingControllr:colorDidChange:)]) {
        [self.delegat settingControllr:self colorDidChange:color];
    }
}
@end
