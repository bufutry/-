//
//  BFColorSlideView.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFColorSlideView.h"

@interface BFColorSlideView()

@property (nonatomic ,weak) UISlider *redSlider;
@property (nonatomic ,weak) UISlider *greenSlider;
@property (nonatomic ,weak) UISlider *blueSlider;

@end

@implementation BFColorSlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self bf_initUi];
        return self;
    }
    return nil;
}

- (void)bf_initUi
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGSize sliderSize = CGSizeMake(size.width-80, 30);
    
    UISlider *redSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 30, sliderSize.width, sliderSize.height)];
    [self addSubview:redSlider];
    [redSlider addTarget:self action:@selector(bf_didSlide:) forControlEvents:UIControlEventValueChanged];
    self.redSlider = redSlider;
    UILabel *redLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 40, 30)];
    [self addSubview:redLabel];
    redLabel.textAlignment = NSTextAlignmentRight;
    redLabel.textColor = [UIColor redColor];
    redLabel.text = @"R";
    
    UISlider *greenSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(redSlider.frame)+10, sliderSize.width, sliderSize.height)];
    [self addSubview:greenSlider];
    [greenSlider addTarget:self action:@selector(bf_didSlide:) forControlEvents:UIControlEventValueChanged];
    self.greenSlider = greenSlider;
    UILabel *greLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, greenSlider.frame.origin.y, 40, 30)];
    [self addSubview:greLabel];
    greLabel.text = @"G";
    greLabel.textAlignment = NSTextAlignmentRight;
    greLabel.textColor = [UIColor greenColor];
    
    
    UISlider *blueSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(greenSlider.frame)+10, sliderSize.width, sliderSize.height)];
    [blueSlider addTarget:self action:@selector(bf_didSlide:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:blueSlider];
    self.blueSlider = blueSlider;
    UILabel *bluLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, blueSlider.frame.origin.y, 40, 30)];
    [self addSubview:bluLabel];
    bluLabel.text = @"B";
    bluLabel.textAlignment = NSTextAlignmentRight;
    bluLabel.textColor = [UIColor blueColor];
}

- (void)bf_didSlide:(UISlider*)slider
{
    UIColor *chanageColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1.0];
    if ([self.delegat respondsToSelector:@selector(colorSlider:didChanageColor:)]) {
        [self.delegat colorSlider:self didChanageColor:chanageColor];
    }
}
@end
