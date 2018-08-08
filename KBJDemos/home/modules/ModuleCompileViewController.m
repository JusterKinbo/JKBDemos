//
//  ModuleCompileViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/8/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "ModuleCompileViewController.h"
#import "FileAChildViewController.h"

@interface ModuleCompileViewController ()

@end

@implementation ModuleCompileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"module compiles stage";
    FileAChildViewController * AChildVC = [[FileAChildViewController alloc]init];
    AChildVC.view.frame = CGRectMake(0,100, 300, 100);
    AChildVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:AChildVC];
    [self.view addSubview: AChildVC.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
