//
//  ViewController.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "TransitonAnimationViewController.h"
#import "CustomPushAnimation.h"
#import "CustomPopAnimation.h"
#import "CustomPresentAnimation.h"
#import "TrasitionedToViewController.h"
#import "TransitionContainerViewController.h"
#import "CustomMultiVCAnimation.h"

@interface TransitonAnimationViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>//导航动画，模态动画
{
    CustomPushAnimation * _customPush;
    CustomPopAnimation * _customPop;
    CustomPresentAnimation * _presentAni;
    CustomMultiVCAnimation * _presentMultiVC;
}

@end

@implementation TransitonAnimationViewController

- (instancetype)init
    {
        self = [super init];
        if(self)
        {
            _customPush = [[CustomPushAnimation alloc]init];
            _customPop = [[CustomPopAnimation alloc]init];
            _presentAni = [[CustomPresentAnimation alloc]init];
            _presentMultiVC = [[CustomMultiVCAnimation alloc]init];
        }
        return self;
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Trasition Animation";
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * modalTransition = [UIButton buttonWithType:UIButtonTypeSystem];
    [modalTransition setTitle:@"modal 转场动画" forState: UIControlStateNormal];
    [modalTransition addTarget:self action:@selector(modalAnis) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * navTransition = [UIButton buttonWithType:UIButtonTypeSystem];
    [navTransition setTitle:@"nav 转场动画" forState:UIControlStateNormal];
    [navTransition addTarget:self action:@selector(navAnis) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * presentMultiVCTransition = [UIButton buttonWithType:UIButtonTypeSystem];
    [presentMultiVCTransition setTitle:@"present muti VC 转场动画" forState:UIControlStateNormal];
    [presentMultiVCTransition addTarget:self action:@selector(navMultiVCAnis) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:modalTransition];
    [self.view addSubview:navTransition];
    [self.view addSubview:presentMultiVCTransition];
    
    [modalTransition mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0).mas_offset(-5);
    }];
    
    [navTransition mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(modalTransition.mas_bottom).mas_offset(5);
        make.centerX.equalTo(modalTransition.mas_centerX);
    }];
    
    [presentMultiVCTransition mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navTransition.mas_bottom).mas_offset(5);
        make.centerX.equalTo(modalTransition.mas_centerX);
    }];
    
    //转场动画
    self.navigationController.delegate = self;
}
    
- (void)modalAnis
{
    TrasitionedToViewController * vc = [[TrasitionedToViewController alloc]init];
    vc.transitioningDelegate = self;//设置转场代理
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}
    

- (void)navAnis
{
    TrasitionedToViewController * vc = [[TrasitionedToViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)navMultiVCAnis
{
    TransitionContainerViewController * vc = [[TransitionContainerViewController alloc]init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:^{//必须设为yes
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
#pragma --mark 导航动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) { 
        return _customPush;
    }else if (operation == UINavigationControllerOperationPop) {
        if(fromVC == self) return nil;//自身到home root 不动画
        return _customPop;
    }else{ //none
        return nil;
    }
}

#pragma --mark 模态动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    if([presented isMemberOfClass:[TransitionContainerViewController class]])
    {
        _presentMultiVC.animationType = MultiAnimationTypePresent;
        return _presentMultiVC;
    }else
    {
        _presentAni.animationType = AnimationTypePresent;
        return _presentAni;
    }
    
}
    
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    if([dismissed isMemberOfClass:[TransitionContainerViewController class]])
    {
        _presentMultiVC.animationType = MultiAnimationTypeDismiss;
        return _presentMultiVC;
    }else
    {
        _presentAni.animationType = AnimationTypeDismiss;
        return _presentAni;
    }
}


@end
