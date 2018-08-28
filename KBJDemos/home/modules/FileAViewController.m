//
//  FileAViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/8/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "FileAViewController.h"
#import "MouduleProtocolIMP.h"

@interface FileAViewController ()

@end

@implementation FileAViewController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        NSLog(@"A init");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MouduleProtocolIMP * imp = [[MouduleProtocolIMP alloc]init];
    [imp getNumber];
    [MouduleProtocolIMP getNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重写label的get方法
- (FilaALabel *)label
{
    NSLog(@"file a 获取 label");
    if (_label)
    {
        return _label;
    }
    return [[FilaALabel alloc]init];
}

@end
