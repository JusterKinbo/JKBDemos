//
//  ConverdVCBViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/10/25.
//  Copyright © 2018 Juster. All rights reserved.
//

#import "ConverdVCBViewController.h"

@interface ConverdVCBViewController ()

@end

@implementation ConverdVCBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.view.frame = CGRectMake(0, 64+24, ScreenWith, ScreenHeight-200-24);
    
    UILabel * a = [[UILabel alloc]init];
    a.text = @"B";
    [self.view addSubview:a];
    [a mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear ConverdVCBViewController");
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear ConverdVCBViewController");
}
@end
