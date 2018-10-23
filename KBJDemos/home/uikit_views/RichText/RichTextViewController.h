//
//  RichTextViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/7/13.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 顺道记录下textfiled
 
 * 可以判断键盘输入此时的内容背景是灰色的还是已确定（非灰色），根据的状态是textfield代理，shouldChange里面的range的length是否为0
 * 根据蛋疼的需求做的经验，nnd
 
 * 显示隐藏、通知、userInfo
 * 内容dataFomatter
    NSAttributedString、Delegate methods
 * Overlay Views
    left view、mode /right view mode/clearMode
 * 替代系统键盘
    inputView
    inputAccessoryView
 
 */
@interface RichTextViewController : UIViewController

@end
