//
//  ViewController.m
//  drew
//
//  Created by 杨绍鑫 on 16/5/5.
//  Copyright © 2016年 y. All rights reserved.
//

#import "ViewController.h"

#import "BFDrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    [self.view addSubview:[[BFDrawView alloc] initWithFrame:self.view.frame]];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
