//
//  PureButtonTableViewCell.h
//  KBJDemos
//
//  Created by Juster on 2018/7/26.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewBaseCell.h"

/**
 单纯的放入一个大button，覆盖整个cell，目的是测试touchup事件与scroll滚动是否冲突
 */
@interface PureButtonTableViewCell : UITableViewBaseCell


@property (nonatomic,assign) CGFloat cellHeight;

@end
