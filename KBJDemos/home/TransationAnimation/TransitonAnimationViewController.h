//
//  ViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitonAnimationViewController : UIViewController


@end

/**
 superview 必须先加入才能添加约束
 
 一般将数值类型的约束用mas_equalTo，而相对于某个控件，或者某个控件的某个约束，我会使用equalTo
 
 动画要想启动animated必须传入yes
 转场动画:http://www.xiaoyaoli.com/?p=1271
    * nav --- 转场包括current-》next current-》back
    * present
    * 交互式:向左侧滑动
 
 以下针对prsent，push应该类似的
 present的先执行
    1.toView的view did load
        猜测toView是原来view,但是背景是透明的，动画结束后会自动添加，同时toView子view位置仍是相对于toView
    2.转场动画
    3.view did appear :此时vc.view 的superview是UITransitionView(这是一个私有view)，它的view是window
 
 present转场动画的原理容器：view最后里面存在的东西都会显示，根据需要控制，一般情况都是删除所有view只添加toView(toView是必须的)
    ***toView必须最后添加到context.containerView里面否则不显示
    ***不要考虑进行转场前保留toView.superView，present过程中toView的superView不存在的
 转场的容器view默认是透明的，可以修改透明度--最后容器view会自动删除
 如果toView使用了autolayout结束后需要设置autotranslatemasking = YES;
 

 针对于被presentVC如果是由多个VC组成的，具体例子是multiVC
    multiVC:
    ContainerVC.view 包含HeaderVC + bottomVC
    动画的时候需要使用bottomVC.view，需要记录bottomVC.view.frame 为 bottomVCVF 以后用
                                    动画完成后containerVC.view 再次add bottomVC.view
                                            设置bottomVC.view.frame=保留的bottomVCVF
                                            添加containerVC.view
                                                context.containerView必须只添加它
 */
