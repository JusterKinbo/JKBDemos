//
//  TrasitionedToViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "TrasitionedToViewController.h"

@interface TrasitionedToViewController ()

@end

@implementation TrasitionedToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"转场后的动画";
    UIButton * dismiss = [UIButton buttonWithType:UIButtonTypeSystem];
    [dismiss setTitle:@"dismiss back" forState:UIControlStateNormal];
    [dismiss addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:dismiss];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [dismiss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    
    NSLog(@"view did load");
}

- (void)viewDidAppear:(BOOL)animated
{
    UIView* v = self.view.superview;
    if([v isMemberOfClass:[UIView class]])
    {
        NSLog(@"presented VC.view superview is window");
    }
     NSLog(@"view did appear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
