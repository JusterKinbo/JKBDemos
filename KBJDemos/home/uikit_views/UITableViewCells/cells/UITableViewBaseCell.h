//
//  UITableViewBaseCell.h
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 在开发过程中，进行UITableviewCell布局时遇到  类似冲突，看了下代码并没有添加这个约束，而且页面布局也正常，在iOS8和iOS9上都没有这个冲突，只有iOS10上才有。想了下，看到44想到可能是自动布局的过程中cell自动计算高度和默认高度冲突，网上找了很多解决办法，只有下面这种方法解决了问题。 Debugger给出哪条解决建议，就提升哪个约束的优先级，例如：
    [userButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.mas_equalTo(18).priorityHigh();
    }];
 */

@class UITableViewModelBaseCell;
@interface UITableViewBaseCell : UITableViewCell

- (void)setModelItem:(UITableViewModelBaseCell *)modal;
- (void)updateUI;
- (void)doSelection;
@end
