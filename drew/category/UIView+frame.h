//
//  UIView+frame.h
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign ,readonly) CGFloat MaxX;
@property (nonatomic, assign ,readonly) CGFloat MaxY;
@property (nonatomic, assign ,readonly) CGFloat MinX;
@property (nonatomic, assign ,readonly) CGFloat MinY;

- (void)removeAllSubView;

@end
