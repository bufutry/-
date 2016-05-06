//
//  BFRubber.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFRubber.h"

@implementation BFRubber
+ (instancetype)pathWith:(CGPathRef)path width:(CGFloat)with
{
    BFRubber *rubber = [[BFRubber alloc] initWithPath:path color:[UIColor whiteColor] width:with];
    return rubber;
}
#pragma mark
- (void)setColor:(UIColor *)color
{
    self.color = [UIColor whiteColor];
}

@end
