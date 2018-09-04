//
//  PresentedHalfTransientViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "PresentedHalfTransientViewController.h"
#import "Presented2HalfTransientViewController.h"

@interface PresentedHalfTransientViewController ()

@end

@implementation PresentedHalfTransientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];--外部设置导致内部设置失效
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 200, 100, 30);
    [btn setTitle:@"prenset vc2" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(modelPresent:) forControlEvents:UIControlEventTouchUpInside];
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)modelPresent:(id)sender
{
    Presented2HalfTransientViewController * presentedVC = [[Presented2HalfTransientViewController alloc]init];
    presentedVC.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    presentedVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.definesPresentationContext = YES;
    [self presentViewController:presentedVC animated:YES completion:^{
        
    }];
}



@end
