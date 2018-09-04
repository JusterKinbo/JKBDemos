//
//  Present2HalfTransientViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "Present2HalfTransientViewController.h"
#import "PresentedHalfTransientViewController.h"

@interface Present2HalfTransientViewController ()

@end

@implementation Present2HalfTransientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"prenset vc" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(modelPresent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modelPresent:(id)sender
{
    PresentedHalfTransientViewController * presentedVC = [[PresentedHalfTransientViewController alloc]init];
    presentedVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    presentedVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.definesPresentationContext = YES;
    [self presentViewController:presentedVC animated:YES completion:^{
        
    }];
}

@end
