//
//  TrasitionedToViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 prsent 呈现的vc没有nav属性
 A push B
 {
    A push B
    延迟 popVC
 }
 结果pop的是最顶层的（原因是nav是栈~）
 */
@interface TrasitionedToViewController : UIViewController

@end
