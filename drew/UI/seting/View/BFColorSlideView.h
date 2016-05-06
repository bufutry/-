//
//  BFColorSlideView.h
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFColorSlideView;

@protocol BFColorSlideViewDelegat <NSObject>

- (void)colorSlider:(BFColorSlideView*)slider didChanageColor:(UIColor*)color;

@end

@interface BFColorSlideView : UIView
@property (nonatomic ,weak) id<BFColorSlideViewDelegat> delegat;
@end
