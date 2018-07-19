//
//  BBADirectBaseTableViewCell.m
//  KBJDemos
//
//  Created by Juster on 2018/7/19.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "BBADirectBaseTableViewCell.h"

@implementation BBADirectBaseTableViewCell

#pragma --mark touch event 重写
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"direct cell == > touchesBegan");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"direct cell == > touchesCancelled");
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"direct cell == > touchesEnded");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
   NSLog(@"direct cell == > touchesMoved");
}

@end
