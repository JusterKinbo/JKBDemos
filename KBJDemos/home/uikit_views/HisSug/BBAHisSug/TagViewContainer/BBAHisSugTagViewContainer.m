//
//  BBAHisSugTagViewContainer.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisSugTagViewContainer.h"
#import "BBASuggestDataItem.h"
#import "BBAHisTagViewFactory.h"

@implementation BBAHisSugTagViewContainer

- (instancetype)init
{
        self = [super init];
        if(self)
        {
            [self generateViews];
        }
        return self;
}


- (void)generateViews
{
    _headerView = [self headView];
    [self addSubview:_headerView];
    _contentView = [self contView];
    [self addSubview:_contentView];
}

- (UIView *)headView
{
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeight)];
    return v;
}
- (UIView *)contView
{
    return [[UIView alloc]init];
}


- (void) resetContentViewWithBBASuggestDataItems:(NSArray *)listData
{
    //see derevied class
}

- (void)adjustFrame
{
    CGPoint p = self.frame.origin;
    CGFloat height = _headerView.frame.size.height+_contentView.frame.size.height;
    self.frame = CGRectMake(p.x, p.y, kScreenWidth, height);
}

- (void)hideContentView
{
    _contentView.hidden = YES;
}


- (void)showContentView
{
    _contentView.hidden = NO;
}

- (void)adjustFrameBySuperView
{
    [self adjustFrameByYAxis:23];
}
- (void)adjustFrameBySiblingView:(UIView *)sibling
{
    [self adjustFrameByYAxis:(sibling.frame.origin.y+sibling.frame.size.height)+35];
}
- (void)adjustFrameByYAxis:(int)yAxis
{
    CGFloat height = _headerView.frame.size.height+_contentView.frame.size.height;
    self.frame = CGRectMake(0, yAxis, kScreenWidth, height);
}

@end
