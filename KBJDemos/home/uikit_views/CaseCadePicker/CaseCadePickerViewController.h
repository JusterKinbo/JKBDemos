//
//  CaseCadePickerViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/9/17.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 考虑引入协议，通知外部变化
 注：做业务时用到引用导致调试半天找不到原因，尽可能不要传递引用传递值类型
    非要传递的时候，记住数组、字典的内容是引用内容，不要在栽跟头了。。
 */
@interface CaseCadePickerViewController : UIViewController

@property (nonatomic,copy) NSMutableArray<NSArray *> * picker_datas;
@property (nonatomic,copy) NSArray * datas;
@property (nonatomic,copy) NSArray * selectedRows;

@end
