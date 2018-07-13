//
//  BBAPrivateHissugTagViewContainer.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/6/29.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAPrivateHissugTagViewContainer.h"
#import "BBAHisSugPageView.h"
#import "UIImage+Size.h"
#import "BBAHisSugEventsHandler.h"
#import "UIColor+BBAHexColor.h"
#import "BBAHisTagViewFactory.h"
#import "BBAHisSugTagView.h"


#define kBtnGap 15 //button间隔
#define kHisMoreGap 5 //历史与搜索历史的间隔
#define kSearchHisLabelWith 60
#define kBtnLargeWidth (18+30)

@interface BBAPrivateHissugTagViewContainer() 
@end

@implementation BBAPrivateHissugTagViewContainer
{
    UIButton * _deleteBtn;
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
    _deleteBtn.enabled = NO;
    _deleteBtn.imageEdgeInsets = insets;
    _deleteBtn.center = CGPointMake(_deleteBtn.center.x, label.center.y);
    
    
    _hideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _hideBtn.frame = CGRectMake(_deleteBtn.frame.origin.x-kBtnLargeWidth, 0, kBtnLargeWidth, kBtnWidth);
    [_hideBtn setImage:[UIImage imageNamed:@"his_sug_hide"]  forState:UIControlStateNormal];
    [_hideBtn setImage:[UIImage imageNamed:@"his_sug_hide"]  forState:UIControlStateHighlighted];
    [_hideBtn addTarget:self action:@selector(hideHisSug) forControlEvents:UIControlEventTouchUpInside];
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
    [v addSubview:_hideBtn];
    
    return v;
}


- (void)hideHisSug
{
    //发通知告知外界，更新界面，textdidchanged通知；存储值|上传网
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler] openHissugPageView];
}

- (void)moreHis
{
    BBAHisSugPageView * page = (BBAHisSugPageView *)[self superview];
    page.hidden = YES;
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler]showMoreHistory];
}


- (void) resetContentViewWithBBASuggestDataItems:(NSArray *)listData
{
   //do nothing in private mode
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

