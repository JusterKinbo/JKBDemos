//
//  RuntimeButton.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeButton.h"
#import "UIColor+BBAHexColor.h"

@implementation RuntimeButton


- (void)setTitle_normal:(NSString *)title_normal
{
    [self setTitle:title_normal forState:UIControlStateNormal];
}

- (void)setTitle_color_normal:(NSString *)title_color_normal
{
    [self setTitleColor:[UIColor bba_colorWithHexString:title_color_normal] forState:UIControlStateNormal];
}


@end
