//
//  BFPath.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFBasePath.h"

@implementation BFBasePath
+ (instancetype)pathWith:(CGPathRef)path color:(UIColor*)color
{
    BFBasePath *bfpath = [BFBasePath new];
    bfpath.bezierPath = [UIBezierPath bezierPathWithCGPath:path];
    bfpath.color = color;
    bfpath.width = 3;
    return bfpath;
}
@end
