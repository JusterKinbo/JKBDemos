//
//  CoverdVCAViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/10/25.
//  Copyright © 2018 Juster. All rights reserved.
//

#import "CoverdVCAViewController.h"

@interface CoverdVCAViewController ()

@end

@implementation CoverdVCAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.view.frame = CGRectMake(0, 64+24, ScreenWith, ScreenHeight-200-24);
    
    UILabel * a = [[UILabel alloc]init];
    a.text = @"A";
    [self.view addSubview:a];
    [a mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
   
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear CoverdVCAViewController");
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear CoverdVCAViewController");
}

@end
