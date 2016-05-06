//
//  BFPath.h
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface  BFBaseStroker: NSObject

@property (nonatomic ,strong) UIColor *color;
@property (nonatomic ,assign) CGPathRef drewPath;
@property (nonatomic ,assign) CGFloat width;

+ (instancetype)pathWithPath:(CGPathRef)path color:(UIColor*)color;
- (instancetype)initWithPath:(CGPathRef)path color:(UIColor*)color width:(CGFloat)width;

+ (void)drawWithContext:(CGContextRef)context
           color:(UIColor*)color
            witd:(CGFloat)witd
            path:(CGPathRef)path;

- (void)drawWithContext:(CGContextRef)context;

@end
