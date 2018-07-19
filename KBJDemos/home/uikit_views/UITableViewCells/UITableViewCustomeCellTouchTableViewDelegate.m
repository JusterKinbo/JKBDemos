//
//  UITableViewCustomeCellTouchTableViewDelegate.m
//  KBJDemos
//
//  Created by Juster on 2018/7/19.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "UITableViewCustomeCellTouchTableViewDelegate.h"


@implementation UITableViewCustomeCellTouchTableViewDelegate
- (void)tableView:(UITableView *)tableView
     touchesBegan:(NSSet *)touches
        withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:tableView];
    NSLog(@"touchesBegan x: %f === y: %f ",touchPoint.x,touchPoint.y);
}

- (void)tableView:(UITableView *)tableView
 touchesCancelled:(NSSet *)touches
        withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:tableView];
    NSLog(@"touchesCancelled x: %f === y: %f ",touchPoint.x,touchPoint.y);
}

- (void)tableView:(UITableView *)tableView
     touchesEnded:(NSSet *)touches
        withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:tableView];
    NSLog(@"touchesEnded x: %f === y: %f ",touchPoint.x,touchPoint.y);
}

- (void)tableView:(UITableView *)tableView
     touchesMoved:(NSSet *)touches
     withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:tableView];
    NSLog(@"touchesMoved x: %f === y: %f ",touchPoint.x,touchPoint.y);
}
@end
