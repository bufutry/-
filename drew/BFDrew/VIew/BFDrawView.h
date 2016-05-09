//
//  BFDrewView.h
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFBaseStroker,BFDrawView;


@protocol BFDrawViewDateSource <NSObject>

- (BFBaseStroker*)drawView:(BFDrawView*)view path:(CGPathRef)path;

@end

@interface BFDrawView : UIView

@property (nonatomic ,strong) UIColor *currentColor;
@property (nonatomic ,assign) CGFloat currentWitd;

@property (nonatomic ,weak) id<BFDrawViewDateSource>dateSource;

- (void)undo;
- (void)removeAll;
@end