//
//  CustomeTableViewViewController.h
//  KBJDemos
//
//  Created by Juster on 2018/9/19.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UITableview 只有在编辑态，editingStyleForRowAtIndexPath才生效，否则只对删除生效
 
 导航右侧按钮：
    toolbar底层实现是stackview
    rightItems也是stackview
    二者均基于约束实现
 
 设置导航右侧间距
    可实现方案：
            添加一个容器v，用作右侧唯一的一个item
            容器v里面添任何你想加入的元素与类型
            还需要考虑到事件传递，需要重写容器的事件
 
 */
@interface CustomeTableViewViewController : UIViewController

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray<NSMutableArray *> *sectionDatas;
@property (nonatomic,strong) NSMutableArray *sectionTitles;
@property (nonatomic,strong) NSMutableArray *hisData;
@property (nonatomic,strong) NSMutableArray *sugData;

@end
