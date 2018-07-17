//
//  CustomPresentAnimation.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "CustomPresentAnimation.h"

@implementation CustomPresentAnimation
    
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.3;
}
    
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * toView = toViewController.view;//取出to view的root view
    UIView * fromView = fromViewController.view;//取出搜索框的位置
    UIView * toViewSuperView = toView.superview;
    
    CGRect searchBoxFrame = CGRectMake(10, 100,ScreenWith - 20, 30);
    CGRect toViewFrame = CGRectMake(0,100+30, ScreenWith,  ScreenHeight - 130);
    
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
        make.top.equalTo(td).offset(100);
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
    if(self.animationType == AnimationTypePresent)
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
//            [toViewSuperView addSubview:toView];
            [self removeSubviewForView:transitionContext.containerView];
            [[transitionContext containerView] addSubview:toView];//添加to view--必须的，如果不添加就不会显示
            toView.translatesAutoresizingMaskIntoConstraints = YES;//如果之前使用autolayotu需要加上这句话
//            toView.frame = CGRectMake(100, 0, 300, 400);//可以使用frame修改但是不能使用autolayout修改，否则不能添加回去
            toView.frame = CGRectMake(0, 0, ScreenWith, ScreenHeight);

            NSLog(@"custome present transition");
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
    
// 采用屏幕截取的方式
- (void)reservered_animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * toView = toViewController.view;
    UIView * fromView = fromViewController.view;
    if (self.animationType == AnimationTypePresent) {
        //snapshot方法是很高效的截屏
        //First放下面
        UIView * snap = [fromView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap];
        //Third放上面
        UIView * snap2 = [toView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap2];
        snap2.transform = CGAffineTransformMakeTranslation(-320, 0);
        //进行动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            snap2.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //删掉截图
            [snap removeFromSuperview];
            [snap2 removeFromSuperview];
            //添加视图
            [[transitionContext containerView] addSubview:toView];
            //结束Transition
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    } else {
        //First 放下面
        UIView * snap = [toView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap];
        //Third 放上面
        UIView * snap2 = [fromView snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snap2];
        //进行动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            snap2.transform = CGAffineTransformMakeTranslation(-320, 0);
        } completion:^(BOOL finished) {
            //删掉截图
            [snap removeFromSuperview];
            [snap2 removeFromSuperview];
            //添加视图
            [[transitionContext containerView] addSubview:toView];
            //结束Transition
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}
    

    
@end
