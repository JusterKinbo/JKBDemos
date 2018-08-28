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
 
 clipToBounds/maskToBounds区别
 clipToBounds--uiviw 子view超出内容截断
 maskToBounds--超出layer内容截断--比上面更猛（这个操作view内部，上面截断view外部）
 
 **********************************
 estimate 导致删除动画效果非常不理想问题
 原因是estimate是一个预估值，这个值越接近平均值效果越理想
 所以针对普通cell和直达cell，当这个值不匹配时会导致删除效果问题很大
 解决方案：heightForRow 针对不同类型cell返回固定高度
 */

@interface UITableViewCustomCellsController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//sug ad ck 针对vc的值
@property (nonatomic,assign) NSInteger touchMoveNumber;
@property (nonatomic,assign) CGFloat touchMoveTotalTime;

@property (nonatomic,assign) CGFloat cellPressTime;

@end

