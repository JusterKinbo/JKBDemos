//
//  CoveredVCViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/10/25.
//  Copyright © 2018 Juster. All rights reserved.
//

#import "CoveredVCViewController.h"

@interface CoveredVCViewController ()

@end

@implementation CoveredVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *segmentArr = @[@"A",@"B",@"AB",@"+A",@"+B",@"-A",@"-B"];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:segmentArr];
    //设置frame
    segment.frame = CGRectMake(10, ScreenHeight-125, ScreenWith-20, 30);
    //添加到视图
    [self.view addSubview:segment];
    [segment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    _childA = [[CoverdVCAViewController alloc] init];
    _childB = [[ConverdVCBViewController alloc] init];
    
    [self addChildViewController:_childA];
    [self addChildViewController:_childB];
    
    [self.view addSubview:_childA.view];
    [self.view addSubview:_childB.view];
    
    _childA.view.hidden = YES;
    _childB.view.hidden = YES;
}

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _childB.view.hidden = YES; _childA.view.hidden = NO;
        _childB.view.tag = 1;_childA.view.tag = 0;
    }else if (sender.selectedSegmentIndex == 1){
       _childB.view.hidden = NO; _childA.view.hidden = YES;
        _childB.view.tag = 0;_childA.view.tag = 1;
    }else if(sender.selectedSegmentIndex == 2){
       _childB.view.hidden = NO; _childA.view.hidden = NO;
        _childB.view.tag = 1;_childA.view.tag = 1;
    }else if(sender.selectedSegmentIndex == 3){
        if(_childA.view.tag == 0)
        {
            _childA.view.tag = 1;
            [self.view addSubview:_childA.view];
        }
        
    }else if(sender.selectedSegmentIndex == 4){
        if(_childB.view.tag == 0)
        {
            _childB.view.tag = 1;
            [self.view addSubview:_childB.view];
        }
    }else if(sender.selectedSegmentIndex == 5){
        if(_childA.view.tag == 1)
        {
            _childA.view.tag = 0;
            [_childA.view removeFromSuperview];
        }
    }else if(sender.selectedSegmentIndex == 6){
        if(_childB.view.tag == 1)
        {
            _childB.view.tag = 0;
            [_childB.view removeFromSuperview];
        }
    }
}


@end
