//
//  UITableViewCustomCellsController.h
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UITableView 滚动动画
 系统自带
 [_tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    --针对添加删除：[_tableView insertRowsAtIndexPaths:@[scrollIndexPath] withRowAnimation:UITableViewRowAnimationTop];
 [_tableView setContentOffset:CGPointMake(0, 200) animated:YES];
 根据property -- https://www.jianshu.com/p/4f4d1ba5268c
 
 
 boxapp里面cell地下的seperator有可能显示不出来，调用super view的updateui方法就好了
 猜测是layoutIfNeed导致layoutsubview调用了，需要使用父view的layoutSubviews方法
 */

@interface UITableViewCustomCellsController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@end
