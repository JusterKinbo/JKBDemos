//
//  CustomPushAnimation.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "CustomPushAnimation.h"

@implementation CustomPushAnimation
    
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 3.0;
}
    
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //添加toView到上下文
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    //自定义动画
    toViewController.view.transform = CGAffineTransformMakeTranslation(320, 568);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-320, -568);
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
