//
//  BBASuggestionTagViewContainer.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBASuggestionTagViewContainer.h"
#import "UIColor+BBAHexColor.h"
#import "BBAHisTagViewFactory.h"
#import "BBAHisSugTagView.h"
#import "BBASuggestDataItem.h"

@implementation BBASuggestionTagViewContainer


- (UIView *)headView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenMargin, 0, 80, kHeight)];
    label.text = @"猜你想搜";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor bba_colorWithHexString:@"999999"];
    label.font = [UIFont systemFontOfSize:14.f];
    
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeight)];
    [v addSubview:label];
    
    return v;
}

- (void) resetContentViewWithBBASuggestDataItems:(NSArray *)listData
{
    BBAHisTagViewFactory * tagViewFactory = [BBAHisTagViewFactory sharedBBAHisTagViewFactory];
    [tagViewFactory resetSugUsedCount];
    int maxLineNumber = 2;
    int line = 0;
    int width = kScreenMargin;
    int tagHeight = 0;
    NSArray * views = self.contentView.subviews;
    for(UIView * view in views)
    {
        [view removeFromSuperview];
    }
    for (BBASuggestDataItem * item in listData)
    {
        if (item.value.length < 1) continue;//必须有文字才行
        BBAHisSugTagView * tagView = [tagViewFactory produceSuggestionTagViewWithBBASuggestDataItem:item];
        CGSize size = tagView.frame.size;
        tagHeight = size.height;
        if(line < maxLineNumber)
        {
            if (kScreenWidth - width - kScreenMargin> size.width)
            {
                tagView.frame = CGRectMake(width, line * (tagHeight+kTageViewVertialMargin) + kTageViewVertialMargin, size.width, size.height);
                width += kTagViewMargin + size.width;
            }else
            {
                line ++; if(line == maxLineNumber)break;
                width = kScreenMargin;
                tagView.frame = CGRectMake(width, line * (tagHeight+kTageViewVertialMargin) + kTageViewVertialMargin, size.width, size.height);
                width += kTagViewMargin + size.width;
            }
            [self.contentView addSubview:tagView];
            
        }else
        {
            break;
        }
        
    }
    self.contentView.frame = CGRectMake(0, kContentMargin+kHeight, kScreenWidth, (line == maxLineNumber?line:line+1)*(tagHeight + kTageViewVertialMargin));
}

@end
