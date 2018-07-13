//
//  TransitionBottomViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/7/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "TransitionBottomViewController.h"

@interface TransitionBottomViewController ()

@end

@implementation TransitionBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor greenColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
