//
//  TransitionContainerViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/7/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "TransitionContainerViewController.h"

@interface TransitionContainerViewController ()

@end

@implementation TransitionContainerViewController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _headerVC = [[TransitionHeadViewController alloc]init];
        _bottomVC = [[TransitionBottomViewController alloc]init];
        _headerVC.view.frame = CGRectMake(0, 0, ScreenWith, 100);
        _bottomVC.view.frame = CGRectMake(0, 100, ScreenWith, ScreenHeight-100);
        [self.view addSubview:_headerVC.view];
        [self.view addSubview:_bottomVC.view];
    }
    return self;
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"multiVC转场后的动画";//present是没有title的
}

- (void)viewDidAppear:(BOOL)animated
{
    UIButton * dismiss = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismiss setTitle:@"dismiss back" forState:UIControlStateNormal];
    [dismiss addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dismiss];
    [dismiss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
