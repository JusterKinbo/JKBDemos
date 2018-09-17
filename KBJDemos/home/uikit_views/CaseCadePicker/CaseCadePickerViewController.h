//
//  CaseCadePickerViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/9/17.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseCadePickerViewController : UIViewController

@property (nonatomic,copy) NSMutableArray<NSArray *> * picker_datas;
@property (nonatomic,copy) NSArray * datas;
@property (nonatomic,copy) NSArray * selectedRows;

@end
