//
//  FileAChildViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/8/7.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "FileAChildViewController.h"

@interface FileAChildViewController ()
{
    FileAChildLabel * _label;
}
@end



@implementation FileAChildViewController

@synthesize label = _label;

- (void)viewDidLoad {
    [super viewDidLoad];
    _label = [[FileAChildLabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    _label.text = @"测试继承属性";
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
