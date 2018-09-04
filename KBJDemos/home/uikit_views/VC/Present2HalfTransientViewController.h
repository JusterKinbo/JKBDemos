//
//  Present2HalfTransientViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 半透明弹出另一个vc
 需要presented vc在prenset函数出设置modalPresentationStyle属性，设置透明色
    设置后presented vc的view背景色不在接受改变，但是子view可以随意
 present vc设置definesPresentationContext属性为yes，使自己成为present root vc
 无需考虑此vc是否为被present过的vc
 
 替代方案:底部VC的view截图给presentedVC，然后动效presentedVC其他view，不建议
 */
@interface Present2HalfTransientViewController : UIViewController

@end
