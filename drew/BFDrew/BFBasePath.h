//
//  BFPath.h
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface  BFBasePath: NSObject

@property (nonatomic ,strong) UIColor *color;
@property (nonatomic ,strong) UIBezierPath *bezierPath;
@property (nonatomic ,assign) CGFloat width;

+ (instancetype)pathWith:(CGPathRef)path color:(UIColor*)color;
@end
