//
//  ConfiguredViewViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "ConfiguredViewViewController.h"
#import "ConfiguredView.h"
#import "ConfigredViewMarcos.h"

@interface ConfiguredViewViewController ()

@end

@implementation ConfiguredViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    NSDictionary * configuredDict = @{
                                      ContainerView:@{BackgroundColor:@"#FF0000",Frame:@"{{30,80},{250,250}}"},
                                      ImageViews:@[@{ImageURL:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2515044163,2570565162&fm=27&gp=0.jpg",Frame:@"{{10,10},{100,100}}"},
                                                   @{ImageURL:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536064671189&di=8e054983ed0ceb32d73acdb83bc25502&imgtype=0&src=http%3A%2F%2Fimg2.cache.netease.com%2Fent%2F2015%2F3%2F24%2F2015032417212918e47.jpg",Frame:@"{{120,10},{50,50}}"}],
                                      Buttons:@[@{Title:@"btn1",Frame:@"{{10,120},{100,30}}"},@{Title:@"btn2",Frame:@"{{120,120},{100,30}}"}]
                                      };
    ConfiguredView * cfView = [[ConfiguredView alloc]initWithCongfiguredDictionary:configuredDict];
    [self.view addSubview:cfView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
