//
//  UITableViewWithTouchesEvent.h
//  KBJDemos
//
//  Created by Juster on 2018/7/19.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchTableViewDelegate;

/**
 集成UITableView重写touches才可以响应touch事件，原因在于事件响应链
 */
@interface UITableViewWithTouchesEvent : UITableView

@property (nonatomic,strong) id<TouchTableViewDelegate> touchDelegate;

@end
