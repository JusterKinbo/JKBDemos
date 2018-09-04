//
//  Presented2HalfTransientViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Presented2HalfTransientViewController.h"

@interface Presented2HalfTransientViewController ()

@end

@implementation Presented2HalfTransientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 300, 100, 30);
    [btn setTitle:@"prenset vc3" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

@end
