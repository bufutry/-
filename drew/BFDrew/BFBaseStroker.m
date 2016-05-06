//
//  BFPath.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFBaseStroker.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation BFBaseStroker
+ (instancetype)pathWithPath:(CGPathRef)path color:(UIColor*)color
{
    BFBaseStroker *bfpath = [[BFBaseStroker alloc] initWithPath:path color:color width:3.0];
    return bfpath;
}
- (instancetype)initWithPath:(CGPathRef)path color:(UIColor*)color width:(CGFloat)width
{
    self = [super init];
    if (self) {
        self.drewPath = CGPathCreateCopy(path);
        self.color = color;
        self.width = width;
        return self;
    }
    return nil;
}

+ (void)drawWithContext:(CGContextRef)context
                  color:(UIColor*)color
                   witd:(CGFloat)witd
                   path:(CGPathRef)path
{
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, witd);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextDrawPath(context, kCGPathStroke);
}


- (void)drawWithContext:(CGContextRef)context
{
    [BFBaseStroker drawWithContext:context color:_color witd:_width path:_drewPath];
}

- (void)dealloc
{
    CGPathRelease(_drewPath);
}
@end
