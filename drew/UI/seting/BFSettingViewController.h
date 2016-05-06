//
//  BFSettingViewController.h
//  drew
//
//  Created by 杨绍鑫 on 16/5/6.
//  Copyright © 2016年 y. All rights reserved.
//

#import "BFBaseViewController.h"

@class BFSettingViewController;
@protocol BFSettingViewControllerDelegat <NSObject>

- (void)settingControllr:(BFSettingViewController*)controll colorDidChange:(UIColor*)color;

@end

@interface BFSettingViewController : BFBaseViewController
@property (nonatomic ,weak) id<BFSettingViewControllerDelegat> delegat;
@end
