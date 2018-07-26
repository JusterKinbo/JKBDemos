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
 
 
 *** autolayout / masonry uitableviewcell 布局 --针对iOS10布局错乱问题
 tableview.rowheight 设置为automaticDemision
 estimatedHeight 设置为最大才可以
 
 涉及到cell更新，里面需要使用mas_update
 
 重点重点重点~重要的事情说三遍
 使用autolayout自适应之后，不能够进行再通过frame约束布局了~，frame自定义布局的宽高收到heightForRow的影响，如果重写AL就失效了~~
 */

@interface UITableViewCustomCellsController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//sug ad ck 针对vc的值
@property (nonatomic,assign) NSInteger touchMoveNumber;
@property (nonatomic,assign) CGFloat touchMoveTotalTime;

@end

