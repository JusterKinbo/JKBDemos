//
//  MarcosViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/7/3.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "MarcosViewController.h"

@interface MarcosViewController ()

@end

@implementation MarcosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * label = [[UILabel alloc]init];
    self.title = @"Marcos";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(0);
    }];
    label.text = @"请看头文件的注解";
    MarcosTestLog
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
