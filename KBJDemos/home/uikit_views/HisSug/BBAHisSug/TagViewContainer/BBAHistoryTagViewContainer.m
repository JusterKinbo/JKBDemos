//
//  BBAHistoryTagViewContainer.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHistoryTagViewContainer.h"
#import "BBAHisSugPageView.h"
#import "UIImage+Size.h"
#import "BBAHisSugEventsHandler.h"
#import "UIColor+BBAHexColor.h"
#import "BBAHisTagViewFactory.h"
#import "BBAHisSugTagView.h"
#import "BBASuggestDataItem.h"

#define kBtnGap 15 //button间隔
#define kHisMoreGap 5 //历史与搜索历史的间隔
#define kSearchHisLabelWith 60
#define kBtnLargeWidth (18+30)

@interface BBAHistoryTagViewContainer() ///<UIAlertViewDelegate>
@end

@implementation BBAHistoryTagViewContainer
{
    UIButton * _deleteBtn;
    UIButton * _showBtn;
    UIButton * _hideBtn;
    UIButton * _hisBtn;
    BOOL _deleteBtnEnabled;//记录隐藏前deleteBtn状态
}

- (UIView *)headView
{
    CGFloat edgesTopDwon = (kBtnWidth - kBtnImageWidth) /2;
    CGFloat edgesLeftRight = (kBtnLargeWidth - kBtnImageWidth) /2;
    UIEdgeInsets insets = UIEdgeInsetsMake(edgesTopDwon, edgesLeftRight, edgesTopDwon, edgesLeftRight);
    UIEdgeInsets insetsMore = UIEdgeInsetsMake(edgesTopDwon, 5, edgesTopDwon, edgesTopDwon+15+edgesTopDwon-5);
    
    //label width
    NSDictionary *attributesDictionary = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]};
    CGSize  size = [@"搜索历史" sizeWithAttributes:attributesDictionary];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(kScreenMargin, 0, size.width, kHeight)];
    label.text = @"搜索历史";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor bba_colorWithHexString:@"999999"];
    label.font = [UIFont systemFontOfSize:14.f];
    
    
    _hisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hisBtn.frame = CGRectMake(label.frame.origin.x+label.frame.size.width, 0, kBtnWidth+15, kBtnWidth);
    [_hisBtn setImage:[UIImage imageNamed:@"his_sug_more"] forState:UIControlStateNormal];
    [_hisBtn setImage:[UIImage imageNamed:@"his_sug_more"] forState:UIControlStateHighlighted];
    [_hisBtn addTarget:self action:@selector(moreHis) forControlEvents:UIControlEventTouchUpInside];
    _hisBtn.imageEdgeInsets = insetsMore;
    _hisBtn.center = CGPointMake(_hisBtn.center.x, label.center.y);

    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.frame = CGRectMake(kScreenWidth-kBtnLargeWidth+(kBtnLargeWidth-kBtnImageWidth)/2-kScreenMargin, 0, kBtnLargeWidth, kBtnWidth);
    [_deleteBtn setImage:[UIImage imageNamed:@"his_sug_trash"] forState:UIControlStateNormal];
    [_deleteBtn setImage:[UIImage imageNamed:@"his_sug_trash"] forState:UIControlStateHighlighted];
    [_deleteBtn addTarget:self action:@selector(deletePressed) forControlEvents:UIControlEventTouchUpInside];
    _deleteBtn.imageEdgeInsets = insets;
    _deleteBtn.center = CGPointMake(_deleteBtn.center.x, label.center.y);
    
    
    _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _showBtn.frame = CGRectMake(_deleteBtn.frame.origin.x-kBtnLargeWidth, 0, kBtnLargeWidth, kBtnWidth);
    [_showBtn setImage:[UIImage imageNamed:@"his_sug_show"] forState:UIControlStateNormal];
     [_showBtn setImage:[UIImage imageNamed:@"his_sug_show"] forState:UIControlStateHighlighted];
    [_showBtn addTarget:self action:@selector(showHisSug) forControlEvents:UIControlEventTouchUpInside];
    _showBtn.imageEdgeInsets = insets;
    _showBtn.center = CGPointMake(_showBtn.center.x, label.center.y);
    
    _hideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hideBtn.frame = CGRectMake(_deleteBtn.frame.origin.x-kBtnLargeWidth, 0, kBtnLargeWidth, kBtnWidth);
    [_hideBtn setImage:[UIImage imageNamed:@"his_sug_hide"]  forState:UIControlStateNormal];
    [_hideBtn setImage:[UIImage imageNamed:@"his_sug_hide"]  forState:UIControlStateHighlighted];
    [_hideBtn addTarget:self action:@selector(hideHisSug) forControlEvents:UIControlEventTouchUpInside];
    _hideBtn.hidden = YES;
    _hideBtn.imageEdgeInsets = insets;
    _hideBtn.center = CGPointMake(_hideBtn.center.x, label.center.y);
    
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor bba_colorWithHexString:@"eeeeee"];
    lineView.frame = CGRectMake(_deleteBtn.frame.origin.x,0,1,kHeight);
    
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeight)];
    
    [v addSubview:lineView];
    [v addSubview:_hisBtn];
    [v addSubview:label];
    [v addSubview:_deleteBtn];
    [v addSubview:_showBtn];
    [v addSubview:_hideBtn];
    
    return v;
}

- (void)deletePressed
{
    NSLog(@"deletePressed");
}


- (void)deleteAllPressed
{
    _deleteBtn.enabled = NO;
    BBAHisSugPageView * page = (BBAHisSugPageView *)[self superview];
    [page deleteAllHis];
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler] deleteAllSuggestDataItems];
}

- (void)showHisSug
{
    //点击显示
    _showBtn.hidden = YES;
    _hideBtn.hidden = NO;
    _deleteBtnEnabled = _deleteBtn.enabled;//保存之前的状态--考虑到状态切换，不能单纯true/false
    _deleteBtn.enabled=false;
    BBAHisSugPageView * page = (BBAHisSugPageView *)[self superview];
    [page hideHisSugContents];
}

- (void)hideHisSug
{
    //点击隐藏
    _hideBtn.hidden = YES;
    _showBtn.hidden = NO;
    _deleteBtn.enabled = _deleteBtnEnabled;//恢复之前的状态
//    if([self.listData count] >0)_deleteBtn.enabled=true;
    BBAHisSugPageView * page = (BBAHisSugPageView *)[self superview];
    [page showHisSugContents];
}

- (void)moreHis
{
    NSLog(@"moreHis");
}

- (void)setHistoryViewDeletedEnable:(BBAHisSugTagView *)view
{
    for (BBAHisSugTagView * v in self.contentView.subviews)
    {
        if (v == view) {[v showDeleteBtn];}
        else { [v hideDeleteBtn];}
    }
}

- (void)setDeleteBtnDisabled
{
    _deleteBtn.enabled = false;
}

- (void) resetContentViewWithBBASuggestDataItems:(NSArray *)listData
{
    BBAHisTagViewFactory * tagViewFactory = [BBAHisTagViewFactory sharedBBAHisTagViewFactory];
    [tagViewFactory resetHisUsedCount];
    int maxLineNumber = 3;//以最大的作为初步编写，后面考虑设计模式，具体什么模式忘记了，和流程相关的
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
        BBAHisSugTagView * tagView = [tagViewFactory produceHistoryTagViewWithBBASuggestDataItem:item];
        CGSize size = tagView.frame.size;
        tagHeight = size.height;
        if(line < maxLineNumber)
        {
            if (kScreenWidth - width - kScreenMargin> size.width)
            {
                tagView.frame = CGRectMake(width, line * (tagHeight+kTageViewVertialMargin) + kTageViewVertialMargin, size.width, size.height);
                width += kTagViewMargin + size.width;
                [self.contentView addSubview:tagView];
            }else
            {
                line ++; if(line == maxLineNumber)break;
                [self.contentView addSubview:tagView];
                width = kScreenMargin;
                tagView.frame = CGRectMake(width, line * (tagHeight+kTageViewVertialMargin) + kTageViewVertialMargin, size.width, size.height);
                width += kTagViewMargin + size.width;
            }
            NSLog(@"********======= item value is: %@  ==> frame is :%@",item.value,NSStringFromCGRect(tagView.frame));
        }else
        {
            break;
        }
        
    }
    self.contentView.frame = CGRectMake(0, kContentMargin+kHeight, kScreenWidth, (line == maxLineNumber?line:line+1)*(tagHeight + kTageViewVertialMargin));
    _deleteBtn.enabled = [listData count]>0?true:false;
}


//针对热点区域
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if(self.hidden || self.alpha < 0.1)//重写避免与其他view冲突
    {
        return [super hitTest:point withEvent:event];
    }
    
    // 将point转化成为Button坐标系上的点
    CGPoint hisPoint = [self convertPoint:point toView:_hisBtn];
    if ([_hisBtn pointInside:hisPoint withEvent:event]) {
        NSLog(@"test hot hitTest hisPoint");
        return _hisBtn;
    }

    if(!_showBtn.hidden)
    {
        CGPoint showPoint = [self convertPoint:point toView:_showBtn];
        if ([_showBtn pointInside:showPoint withEvent:event]) {
            NSLog(@"test hot hitTest showPoint");
            return _showBtn;
        }
    }

    if(!_hideBtn.hidden)
    {
        CGPoint hidePoint = [self convertPoint:point toView:_hideBtn];
        if ([_hideBtn pointInside:hidePoint withEvent:event]) {
            NSLog(@"test hot hitTest hidePoint");
            return _hideBtn;
        }
    }


    CGPoint deletePoint = [self convertPoint:point toView:_deleteBtn];
    if ([_deleteBtn pointInside:deletePoint withEvent:event]) {
        NSLog(@"test hot hitTest deletePoint");
        return _deleteBtn;
    }

    return [super hitTest:point withEvent:event];
}




@end
