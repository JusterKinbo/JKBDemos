//
//  CustomMultiVCAnimation.m
//  KBJDemos
//
//  Created by Juster on 2018/7/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "CustomMultiVCAnimation.h"
#import "TransitionContainerViewController.h"
#import "TransitionBottomViewController.h"
#import "TransitionHeadViewController.h"

@implementation CustomMultiVCAnimation


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * toView=nil; //toView判断是否为present，如果是为bottomVC.view
    UIView * toViewWholeView=nil;//containerVC.view
    CGRect toViewFrame;//记录bottomVC.view frame--动画结束后用
     NSLog(@"custome multi present transition");
    if([toViewController isMemberOfClass:[TransitionContainerViewController class]])
    {
        TransitionContainerViewController * container = (TransitionContainerViewController *)toViewController;
        toView = container.bottomVC.view;
        toViewWholeView = toViewController.view;
        toViewFrame = toView.frame;
    }else
    {
       toView = toViewController.view;
    }
    
    UITextField * td = [[UITextField alloc]init];
    td.borderStyle = UITextBorderStyleLine;
    
    UIImageView * logo = [[UIImageView alloc]init];
    logo.image = [UIImage imageNamed:@"baidu"];
    
    UILabel * placehoder = [[UILabel alloc]init];
    placehoder.text = @"百度一下";
    
    UIImageView * camera = [[UIImageView alloc]init];
    camera.image = [UIImage imageNamed:@"camera"];
    
    UIView * verticalLine = [[UIView alloc]init];
    verticalLine.backgroundColor = [UIColor grayColor];
    
    UILabel * cancel =  [[UILabel alloc]init];
    cancel.text = @"取消";
    
    [transitionContext.containerView addSubview: td];
    [transitionContext.containerView addSubview: logo];
    [transitionContext.containerView addSubview: placehoder];
    [transitionContext.containerView  addSubview: verticalLine];
    [transitionContext.containerView  addSubview: camera];
    [transitionContext.containerView  addSubview: cancel];
    [transitionContext.containerView addSubview: toView];
    [toView mas_makeConstraints:^(MASConstraintMaker *make) {//相对于父view container
        make.top.equalTo(td).offset(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    
    [td mas_makeConstraints:^(MASConstraintMaker *make) {//相对于父view container
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(150);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {//相对于td
        make.left.equalTo(td).mas_offset(10);
        make.centerY.equalTo(td);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [placehoder mas_makeConstraints:^(MASConstraintMaker *make) {//相对于td
        make.left.equalTo(td).mas_offset(10);
        make.centerY.equalTo(td);
    }];
    
    [camera mas_makeConstraints:^(MASConstraintMaker *make) {//相对于td--右侧(使用-10)
        make.right.equalTo(td).mas_offset(-10);
        make.centerY.equalTo(td);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {//相对于td
        make.right.equalTo(td).mas_offset(-10);
        make.centerY.equalTo(td);
    }];
    
    [verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {//相对于cancel
        make.right.equalTo(cancel.mas_left).mas_offset(-3);
        make.centerY.equalTo(cancel);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(20);
    }];
    [transitionContext.containerView  layoutIfNeeded];//必须
    if(self.animationType == MultiAnimationTypePresent)
    {
        logo.alpha = 0;
        cancel.alpha = 0;
        verticalLine.alpha = 0;
        
        [UIView animateWithDuration:1 animations:^{
            logo.alpha = 1;
            cancel.alpha = 1;
            verticalLine.alpha = 1;
            camera.alpha = 0;
            [td mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(80);
            }];
            [placehoder mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(td).mas_offset(10+20+3);
            }];
            
            [transitionContext.containerView  layoutIfNeeded];//必须
        } completion:^(BOOL finished) {//完成转场
            [self removeSubviewForView:transitionContext.containerView];
            if(toViewWholeView)
            {
                toViewWholeView.translatesAutoresizingMaskIntoConstraints = YES;
                toView.translatesAutoresizingMaskIntoConstraints = YES;
                toView.frame = toViewFrame;
                [toViewWholeView addSubview:toView];//containerView需要再次添加bottomVC.view
                [[transitionContext containerView] addSubview:toViewWholeView];//这个地方必须是容器view
            }else
            {
                toView.translatesAutoresizingMaskIntoConstraints = YES;
                 [[transitionContext containerView] addSubview:toView];
                toView.frame = CGRectMake(0, 0, ScreenWith, ScreenHeight);
            }

            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
        logo.alpha = 1;
        cancel.alpha = 1;
        verticalLine.alpha = 1;
        camera.alpha = 0;
        [toView removeFromSuperview];//消失toview
        //先调布局
        [td mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(80);
        }];
        [placehoder mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(td).mas_offset(10+20+3);
        }];
        [transitionContext.containerView  layoutIfNeeded];//必须
        [UIView animateWithDuration:1 animations:^{
            logo.alpha = 0;
            cancel.alpha = 0;
            verticalLine.alpha = 0;
            camera.alpha = 1;
            [td mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(150);
            }];
            [placehoder mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(td).mas_offset(10);
            }];
            [transitionContext.containerView  layoutIfNeeded];//必须
        } completion:^(BOOL finished) {//完成转场
            [self removeSubviewForView:transitionContext.containerView];
            toView.translatesAutoresizingMaskIntoConstraints = YES;//如果之前使用autolayotu需要加上这句话
            toView.frame = CGRectMake(0, 0, ScreenWith, ScreenHeight);
            [[transitionContext containerView] addSubview:toView];//添加to view
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
#pragma clang diagnostic pop
}

- (void)removeSubviewForView:(UIView*)view
{
    for(UIView * v in view.subviews)
    {
        [v removeFromSuperview];
    }
}

@end
