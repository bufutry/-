//
//  BFDrewView.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFDrawView.h"
#import <CoreGraphics/CoreGraphics.h>
#import "BFBaseStroker.h"

@interface BFDrawView()

@property (nonatomic ,assign) CGMutablePathRef drawPath;
@property (nonatomic ,strong) NSMutableArray *pathArrary;

@property (nonatomic ,assign) BOOL isClose;
@end

@implementation BFDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.currentWitd = 3;
        self.currentColor = [UIColor redColor];
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
        [BFBaseStroker drawWithContext:conte color:_currentColor witd:_currentWitd path:_drawPath];
    }
}
- (void)bf_draw:(CGContextRef)conte
{
    for (BFBaseStroker *path in _pathArrary) {
        [path drawWithContext:conte];
    }
}

#pragma makr - 
- (void)undo
{
    if (_pathArrary.count>0) {
        [_pathArrary removeLastObject];
        [self setNeedsDisplay];
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
    BFBaseStroker *storker;
    if ([self.dateSource respondsToSelector:@selector(drawView: path:)]) {
        storker = [self.dateSource drawView:self path:_drawPath];
    }
    else
    {
        storker = [[BFBaseStroker alloc] initWithPath:_drawPath color:_currentColor width:_currentWitd];
    }
   [self.pathArrary addObject:storker];
    CGPathRelease(_drawPath);
    _isClose = YES;
    [self setNeedsDisplay];
}
@end
