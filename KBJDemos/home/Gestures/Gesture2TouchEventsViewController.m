//
//  Gesture2TouchEventsViewController.m
//  KBJDemos
//
//  Created by Juster on 2019/4/9.
//  Copyright © 2019 Juster. All rights reserved.
//

#import "Gesture2TouchEventsViewController.h"
#import "TapGesture2ndTouchEventView.h"

@interface Gesture2TouchEventsViewController ()

@end

@implementation Gesture2TouchEventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TapGesture2ndTouchEventView * view = [[TapGesture2ndTouchEventView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.tag = 20;
    
    TapGesture2ndTouchEventView * view1 = [[TapGesture2ndTouchEventView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    view1.frame = CGRectMake(25, 25, 50, 50);
    view1.tag = 21;
    [view addSubview:view1];
    
    [self.view addSubview:view];
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
