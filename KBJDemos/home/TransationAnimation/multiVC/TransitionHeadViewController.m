//
//  TransitionHeadViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/7/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "TransitionHeadViewController.h"

@interface TransitionHeadViewController ()

@end

@implementation TransitionHeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor grayColor];
    view.frame = CGRectMake(100, 0, 100, 100);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
