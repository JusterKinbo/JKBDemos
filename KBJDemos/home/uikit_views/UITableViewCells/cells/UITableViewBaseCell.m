//
//  UITableViewBaseCell.m
//  KBJDemos
//
//  Created by Juster on 2018/7/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "UITableViewBaseCell.h"

@implementation UITableViewBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
    }
    return self;
}

- (void)setModelItem:(UITableViewModelBaseCell *)modal
{
        //子类实现
}
- (void)updateUI
{
    //子类实现
}

- (void)doSelection
{
    //子类实现
}
@end
