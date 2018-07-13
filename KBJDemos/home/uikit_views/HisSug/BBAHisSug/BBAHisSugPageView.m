//
//  BBAHisSugPageView.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisSugPageView.h"

#import "BBAHisSugEventsHandler.h"
#import "BBAHistoryTagViewContainer.h"
#import "BBASuggestionTagViewContainer.h"
#import "BBASuggestDataItem.h"
#import "UIColor+BBAHexColor.h"
#import "BBAAppCommonInfo.h"
#import "BBAPrivateHissugTagViewContainer.h"

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)
#define kLoginMoreHisWidth 126
#define kPasteboardImgWidth 12
#define kPasteboadrdImgHeight 13
#define kPasteboardHeight 38
#define kFontSize 14


@implementation BBAHisSugPageView
{
    BBAHistoryTagViewContainer * _his;
    BBASuggestionTagViewContainer * _sug;
    BBAPrivateHissugTagViewContainer * _privateTagViewContainer;
    UILabel * _loginForMoreHis;
    UIView * _singleLine;//顶部横线1像素，与pageview同生命周期
    UIView * _pasteboard;
    BBASuggestDataItem * _pasteboardItem;
    NSTimeInterval  _lastTime ;
    NSTimeInterval _interval;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if(self)
    {
        _singleLine = [[UIView alloc]initWithFrame:CGRectMake(0, 2-SINGLE_LINE_ADJUST_OFFSET, kScreenWidth, SINGLE_LINE_WIDTH)];
        _singleLine.backgroundColor = UIColor.grayColor;
        _his = [[BBAHistoryTagViewContainer alloc] init];
        _sug = [[BBASuggestionTagViewContainer alloc] init];
        _privateTagViewContainer = [[BBAPrivateHissugTagViewContainer alloc]init];
        _pasteboard = [self pasteboard];
         _lastTime = [NSDate date].timeIntervalSince1970;
        _interval = 0.5f;
        
        [self addSubview:_his];
        [self addSubview:_sug];
        [self addSubview:_pasteboard];
        [self addSubview:_privateTagViewContainer];
        
        [self addTapGesture];
        
    }
    return self;
}

- (UIView *)pasteboard
{
    if(_pasteboard)return _pasteboard;
   _pasteboard = [[UIView alloc]initWithFrame:CGRectMake(kScreenMargin, 20, kScreenWidth-kScreenMargin*2, kPasteboardHeight)];
    UIImageView * imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"his_sug_pasteboard"]];
    imgV.frame = CGRectMake(10, (kPasteboardHeight-kPasteboardImgWidth)/2, kPasteboardImgWidth, kPasteboadrdImgHeight);
    imgV.center = CGPointMake(imgV.center.x, _pasteboard.frame.size.height/2);
    UILabel * label = [[UILabel alloc]initWithFrame: CGRectMake(imgV.frame.origin.x+imgV.frame.size.width+5, 20, 200, 30)];
    label.center = CGPointMake(label.center.x, imgV.center.y);
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [_pasteboard addSubview:imgV];
    [_pasteboard addSubview:label];
    _pasteboard.layer.cornerRadius = 3;
    _pasteboard.layer.backgroundColor = [UIColor bba_colorWithHexString:@"EEEEEE"].CGColor;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPasteboard)];
    [_pasteboard addGestureRecognizer:tap];
    _pasteboard.hidden = YES;
    return _pasteboard;
}

- (void)pasteboardUpdateItem:(BBASuggestDataItem *)item
{
    NSString * text = item.value;
    UILabel * label = _pasteboard.subviews[1];
    _pasteboardItem = item;
    NSDictionary *attributesDictionary = @{NSFontAttributeName:[UIFont systemFontOfSize:kFontSize],NSKernAttributeName:@1.0f};
    CGFloat maxWidth = kScreenWidth-2*kScreenMargin-10-10-5-kPasteboardImgWidth;
    CGRect  rect = [text boundingRectWithSize:CGSizeMake(maxWidth, kPasteboardHeight) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
    CGRect frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, ceil(rect.size.width), label.frame.size.height);
    label.text = text;
    label.font = [UIFont systemFontOfSize:kFontSize];
    label.textAlignment = NSTextAlignmentLeft;
    label.frame = frame;
    CGFloat pasteboadWidth = 10+kPasteboardImgWidth+5+frame.size.width+10;
    pasteboadWidth = pasteboadWidth>(kScreenWidth - 2*kScreenMargin)?(kScreenWidth - 2*kScreenMargin):pasteboadWidth;
    _pasteboard.frame = CGRectMake(kScreenMargin, 20,pasteboadWidth, kPasteboardHeight);
}

- (void)realoadHisData:(NSArray<BBASuggestDataItem *> *)hisData SugData:(NSArray<BBASuggestDataItem *> *)sugData
{
    _privateTagViewContainer.hidden = YES;//隐藏私有模式
   
    _hisData = [hisData mutableCopy];
    _sugData = [sugData mutableCopy];
    self.hidden = YES;//消除剪切板闪消失问题
//    if ([BBAUserSettings sharedInstance].bInPrivateMode) return;
    [self reloadPasteboardWithHisData:_hisData];
    if(![self isUserLogin] && [_hisData count]<1)
    {
        [self showLoginForMoreHis];
        self.hidden = NO;
        return;
    }
    _loginForMoreHis.hidden = YES;

    [self resetContentsWithHisData:_hisData SugData:_sugData];
    self.hidden = NO;
}

/**
 根据类型可能会修改参数，所以传入的是mutable类型

 @param hisData history数据
 */
- (void)reloadPasteboardWithHisData:(NSMutableArray *)hisData
{
    BBASuggestDataItem * first = hisData.firstObject;
    _pasteboard.hidden = YES;
    if([first.cellClassName isEqualToString:@"EBBASuggestPasteboradCellClassName"])
    {
        _pasteboard.hidden = NO;
        [self pasteboardUpdateItem:first];
        [_hisData removeObjectAtIndex:0];
    }else
    {
        _pasteboardItem = nil;
    }
}

- (void)resetContentsWithHisData:(NSArray<BBASuggestDataItem *> *)hisData SugData:(NSArray<BBASuggestDataItem *> *)sugData
{
    if([hisData count]<=0)//登录没数据直接返回--可以显示剪切板内容
    {
        _his.hidden = YES;
        _sug.hidden = YES;
        self.contentSize = CGSizeMake(kScreenWidth,_pasteboard.hidden?0: _pasteboard.frame.origin.y+_pasteboard.frame.size.height);
        return;
    }
  
    _his.hidden = NO;
    if(_his.contentView.hidden)//此时隐藏所有内容
    {
        if(_pasteboardItem)
        {
             [_his adjustFrameByYAxis:30+_pasteboard.frame.origin.y+_pasteboard.frame.size.height];
            [_sug adjustFrameBySiblingView:_his];
        }
//        _pasteboard.hidden = YES;//此时剪切板隐藏，说明点击了hide，隐藏剪切板
        _sug.hidden = YES;
//        [_his adjustFrameBySuperView];//此时取得是历史数据，导致UI问题，需要在调整以下
        [self resetHissugCotentPostionWithHisData:hisData SugData:sugData];//保证关闭历史下内容存在
        [_his setDeleteBtnDisabled];
        return;
    }else
    {
        _sug.hidden = NO;
    }
    
    [self resetHissugCotentPostionWithHisData:hisData SugData:sugData];
    self.contentSize = CGSizeMake(kScreenWidth, _sug.frame.origin.y+_sug.frame.size.height+5);
}

- (void)resetHissugCotentPostionWithHisData:(NSArray<BBASuggestDataItem *> *)hisData SugData:(NSArray<BBASuggestDataItem *> *)sugData
{
    [_his resetContentViewWithBBASuggestDataItems:hisData];
    if(_pasteboard.hidden)
    {
        [_his adjustFrameBySuperView];
    }else
    {
        [_his adjustFrameByYAxis:30+_pasteboard.frame.origin.y+_pasteboard.frame.size.height];
    }
    if([sugData count]<1)
    {
        _sug.hidden = YES;
        self.contentSize = CGSizeMake(kScreenWidth, _his.frame.origin.y+_his.frame.size.height+5);
        return;
    }
    [_sug resetContentViewWithBBASuggestDataItems:sugData];
    [_sug adjustFrameBySiblingView:_his];
}

- (void)resetLoginForMoreHis
{
    if(!_pasteboard.hidden)
    {
        _loginForMoreHis.frame = CGRectMake((kScreenWidth-kLoginMoreHisWidth)/2,21+_pasteboard.frame.origin.y+_pasteboard.frame.size.height, kLoginMoreHisWidth,15);
    }else
    {
        _loginForMoreHis.frame = CGRectMake((kScreenWidth-kLoginMoreHisWidth)/2,21, kLoginMoreHisWidth,15);
    }
}

- (void)showForPirvateMode
{
    //隐藏his sug
    _loginForMoreHis.hidden = YES;
    _pasteboard.hidden = YES;
    _his.hidden = YES;
    _sug.hidden = YES;
    //private view container
    _privateTagViewContainer.hidden = NO;
    [_privateTagViewContainer adjustFrameBySuperView];
}

- (BOOL)isUserLogin
{
    return YES;
}

- (void)showLoginForMoreHis
{
        [self clearContents];
        if (_loginForMoreHis)//优化避免重复创建
        {
            [self resetLoginForMoreHis];
            _loginForMoreHis.hidden = NO;
            return;
        }
        _loginForMoreHis = [[UILabel alloc]init];
        NSDictionary*attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIFont systemFontOfSize:14.0],NSFontAttributeName,nil];
        NSMutableAttributedString* AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"登录查看历史" attributes:attributeDict];
        [_loginForMoreHis setAttributedText:AttributedStr];
        _loginForMoreHis.textAlignment = NSTextAlignmentCenter;
        _loginForMoreHis.frame = CGRectMake((kScreenWidth-kLoginMoreHisWidth)/2,21, kLoginMoreHisWidth,15);
        UITapGestureRecognizer * tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(loginForMoreHistory)];
        [_loginForMoreHis addGestureRecognizer:tap];
        _loginForMoreHis.userInteractionEnabled = YES;
        [self resetLoginForMoreHis];
        [self addSubview:_loginForMoreHis];
}

- (void)loginForMoreHistory
{
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler] loginForMorehistory];
}


- (void)adjustContents
{
    [self resetContentsWithHisData:_hisData SugData:_sugData];
}

- (void)hideHisSugContents
{
    [_his hideContentView];
    _sug.hidden = YES;
}

- (void)showHisSugContents
{
    [_his showContentView];
    if([_sugData count]<1)//保证显示点击显示按钮时sug有数据
    {
        _sug.hidden = YES;
        return;
    }
    _sug.hidden = NO;
}

- (void)deleteAllHis
{
    _pasteboard.hidden = YES;//首先隐藏掉剪切板内容
    //本地删除所有历史数据（本地+服务器）
    [self clearContents];
    //考虑内容+数据的安排+需要考虑数据的接入，先这样吧，开始接入数据？
}

- (void)clearContents
{
    _hisData = [@[] mutableCopy];
    _sugData = [@[] mutableCopy];
    [self resetContentsWithHisData:_hisData SugData:_sugData];
}
#pragma --mark 添加点击空白处取消删除状态手势
- (void)addTapGesture
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBlankSpaceCancelDeleteState)];
    [self addGestureRecognizer:tap];
    UISwipeGestureRecognizer * swipUp= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipRecognizer:)];
    swipUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipUp];
}

- (void)clickBlankSpaceCancelDeleteState
{
   NSLog(@"clickBlankSpaceCancelDeleteState");
}

- (void)swipRecognizer:(id)sender
{
    NSLog(@"swipRecognizer");
}

#pragma --mark 获取item位置
- (NSUInteger)indexOfHisItem:(BBASuggestDataItem *)item
{
    return [_hisData indexOfObject:item];
}

- (NSUInteger)indexOfSugItem:(BBASuggestDataItem *)item
{
    return [_sugData indexOfObject:item];
}


#pragma --mark pasteboard点击事件
- (void)tapPasteboard
{
    NSTimeInterval currentTimeInterval = [NSDate date].timeIntervalSince1970;
    if(currentTimeInterval - _lastTime < _interval) return;
    _lastTime = currentTimeInterval;
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler]clickEventWithSuggestDataItem:_pasteboardItem];
}

#pragma --mark keyboard
- (CGRect)adjustHisSugViewFrameForKeyboardHeight:(CGFloat)height
{
    CGSize s = [self superview].bounds.size;
    CGPoint p = [self superview].bounds.origin;
    CGFloat h = s.height - height;
    self.frame = CGRectMake(p.x, p.y, s.width, h);
    return self.frame;
}
@end
