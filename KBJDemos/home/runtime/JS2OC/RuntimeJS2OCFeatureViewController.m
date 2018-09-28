//
//  RuntimeJS2OCFeatureViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/9/28.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeJS2OCFeatureViewController.h"

@interface RuntimeJS2OCFeatureViewController ()

@end

@implementation RuntimeJS2OCFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * l  = [[UILabel alloc]init];
    l.text = @"jspatch自己定义了一个解析器解析js\n通过自定解析与OC方法进行调用\n给oc添加方法本质是写了一个map，然后在方法转发的时候根据map取内容\n同时借助于JSValue + callWithArguments实现";
    l.numberOfLines = 0;
    [l sizeToFit];
    l.frame = CGRectMake(30, 100, ScreenWith-60, l.frame.size.height);
    [self.view addSubview:l];
    
}



@end
