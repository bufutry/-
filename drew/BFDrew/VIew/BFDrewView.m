//
//  BFDrewView.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFDrewView.h"
#import <CoreGraphics/CoreGraphics.h>
#import "BFBasePath.h"

@interface BFDrewView()

@property (nonatomic ,assign) CGMutablePathRef drawPath;
@property (nonatomic ,strong) NSMutableArray *pathArrary;

@property (nonatomic ,assign) BOOL isClose;
@end

@implementation BFDrewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        return self;
    }
    return nil;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef conte = UIGraphicsGetCurrentContext();

    if (_isClose==YES) {
        [self bf_draw:conte];
    }
    else
    {
        [self bf_draw:conte];
        CGContextAddPath(conte, _drawPath);
        CGContextSetStrokeColorWithColor(conte, [UIColor redColor].CGColor);
         CGContextSetLineWidth(conte, 3);
        CGContextDrawPath(conte, kCGPathStroke);
    }
}
- (void)bf_draw:(CGContextRef)conte
{
    for (BFBasePath *path in _pathArrary) {
        CGContextAddPath(conte, path.bezierPath.CGPath);
        CGContextSetStrokeColorWithColor(conte, [UIColor redColor].CGColor);
        CGContextSetLineWidth(conte, path.width);
        [path.color set];
        CGContextDrawPath(conte, kCGPathStroke);
        NSLog(@"%ld",_pathArrary.count);
    }
}
#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.drawPath = CGPathCreateMutable();
    _isClose = NO;
    CGPathMoveToPoint(_drawPath, NULL, point.x, point.y);
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPathAddLineToPoint(_drawPath, NULL, point.x, point.y);
    [self setNeedsDisplay];
   
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_pathArrary==nil)
    {
        self.pathArrary = [NSMutableArray array];
    }
    BFBasePath *path = [BFBasePath pathWith:_drawPath color:[UIColor redColor]];
   [self.pathArrary addObject:path];
    CGPathRelease(_drawPath);
    _isClose = YES;
    [self setNeedsDisplay];
}
@end
