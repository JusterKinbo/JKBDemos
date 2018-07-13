//
//  TransitionContainerViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/7/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionHeadViewController.h"
#import "TransitionBottomViewController.h"

@interface TransitionContainerViewController : UIViewController


@property (nonatomic,strong) TransitionHeadViewController * headerVC;
@property (nonatomic,strong) TransitionBottomViewController * bottomVC;

@end
