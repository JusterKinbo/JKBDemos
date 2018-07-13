//
//  BBAHisSugTagView.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisSugTagView.h"
#import "BBAHisSugPageView.h"
#import "BBAHisSugTagViewContainer.h"
#import "BBAHisSugEventsHandler.h"
#import "UIColor+BBAHexColor.h"
#import "BBASuggestDataItem.h"
#import "BBAHistoryTagViewContainer.h"

#define kGapWidth 10 //label 左右空隙
#define kGapVertical 10 //label 上下空隙
#define kDeleteImageWidth 10 // 删除按钮大小
#define kMaxWidth (UIScreen.mainScreen.bounds.size.width)
#define kMaxCharacterCount 8 //最大8个字的宽度
#define kFontSize 14 //字体大小
#define kTagViewHeight 38 //图片宽高

#define kBorderColor [UIColor bba_colorWithHexString:@"EEEEEE"].CGColor
#define kClearLayerColor  [UIColor clearColor].CGColor
#define kLayerColor [UIColor bba_colorWithHexString:@"EEEEEE"].CGColor

@implementation BBAHisSugTagView
{
    UILabel * _label;
    UIImageView * _imgView;
    NSTimeInterval _interval;
    NSTimeInterval _lastTime;
    UIView * _imgViewContainer;
    BOOL _longPressEnabled;
}



- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item
{
    self = [self initWithBBASuggestDataItem:item  longPressEnabled:YES];
    return self;
}

- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item longPressEnabled:(BOOL)longPressEnabled
{
    self = [self initWithBBASuggestDataItem:item fontSize:kFontSize longPressEnabled:longPressEnabled];
    return self;
}

- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item fontSize:(int)size longPressEnabled:(BOOL)longPressEnabled
{
    self = [super init];
    if(self)
    {
        _lastTime = [NSDate date].timeIntervalSince1970;
        _interval = 0.5f;
        _longPressEnabled = longPressEnabled;
        _item = item;
        _label = [self labelWithTitle:item.value];
//        _imgView = [self imageViewWithlabelFrame:_label.frame];
        _imgViewContainer = [self imageViewContainerViewWithlabelFrame:_label.frame];
        _imgView = [self imageViewWithContainerFrame:_imgViewContainer.frame];
        
        //subviews
        [self addSubview:_label];
        [_imgViewContainer addSubview:_imgView];
        [self addSubview:_imgViewContainer];
        
        //border style 放在layer前面，layer需要view的frame
        [self layerBorderStyle];
        
        //gestures
        [self addGestures];
        
    }
    return self;
}

- (UIView *)imageViewContainerViewWithlabelFrame:(CGRect)labelFrame
{
    CGFloat width = 74.0/3;
    CGFloat endLocation = (24.0+6)/74.0;
    UIView * v = [[UIView alloc]initWithFrame:CGRectMake(labelFrame.size.width-width-3,(labelFrame.size.height-width)/2,width,width)];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:1.0 alpha:0.0].CGColor, (__bridge id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor];
    gradientLayer.locations = @[@0.0,  [NSNumber numberWithFloat:endLocation]];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = v.bounds;
    v.hidden = YES;
    v.userInteractionEnabled = YES;
    [v.layer addSublayer:gradientLayer];
    return v;
}

- (void)resetFrameWithItem:(BBASuggestDataItem *)item
{
    _item = item;
    //label
    NSString * showTitle ;
    NSUInteger length = [item.value length];
    if(length>kMaxCharacterCount)
    {
        NSString * tmp = [item.value substringWithRange:NSMakeRange(0, kMaxCharacterCount)];
        NSMutableString * mutTmp= [NSMutableString stringWithFormat:@"%@...",tmp];
        showTitle = [mutTmp copy];
    }else
    {
        showTitle = item.value;
    }
    _label.frame = [self titleFrame:showTitle];
    _label.text = showTitle;
    //image
    CGFloat width = 74.0/3;
    _imgViewContainer.frame = CGRectMake(_label.frame.size.width-width-3,(_label.frame.size.height-width)/2,width,width);
    [self hideDeleteBtn];
    self.frame = _label.frame;
}

-(void)layerBorderStyle
{
    self.layer.cornerRadius = 3.f;
    self.layer.borderColor = UIColor.grayColor.CGColor;
    self.layer.backgroundColor = kLayerColor;
    self.frame = _label.frame;
}

- (void)addGestures
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicked)];
    [self addGestureRecognizer:tapGesture];
    if(!_longPressEnabled)return;
    
    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressed)];
     [self addGestureRecognizer:longPressGesture];
    
    UITapGestureRecognizer * tapGesture_delete = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(deleteBtnPressed)];
     [_imgViewContainer addGestureRecognizer:tapGesture_delete];
}

- (UILabel *)labelWithTitle:(NSString *)title
{
    NSString * showTitle ;
    NSUInteger length = [title length];
    if(length>kMaxCharacterCount)
    {
        NSString * tmp = [title substringWithRange:NSMakeRange(0, kMaxCharacterCount)];
        NSMutableString * mutTmp= [NSMutableString stringWithFormat:@"%@...",tmp];
        showTitle = [mutTmp copy];
    }else
    {
        showTitle = title;
    }
    UILabel * label = [[UILabel alloc]init];
    label.frame = [self titleFrame:showTitle];
    label.text = showTitle;
    label.font = [UIFont systemFontOfSize:kFontSize];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (CGRect)titleFrame:(NSString *)title
{
    NSDictionary *attributesDictionary = @{NSFontAttributeName:[UIFont systemFontOfSize:kFontSize]};
    CGSize  size = [title sizeWithAttributes:attributesDictionary];
    CGRect frame = CGRectMake(0, 0, ceil(size.width)+2*kGapWidth, kTagViewHeight);
    return frame;
}

- (UIImageView *)imageViewWithContainerFrame:(CGRect)containerFrame
{
    UIImageView * imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"his_sug_delete"]];
    imageView.frame = CGRectMake(containerFrame.size.width-3-kDeleteImageWidth, (containerFrame.size.height-kDeleteImageWidth)/2, kDeleteImageWidth, kDeleteImageWidth);
    imageView.userInteractionEnabled = YES;
    return imageView;
}

- (void)clicked
{
    NSTimeInterval currentTimeInterval = [NSDate date].timeIntervalSince1970;
    if(currentTimeInterval - _lastTime < _interval) return;
    _lastTime = currentTimeInterval;
    NSLog(@"click 告知外部根据此词条进行搜索");
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler] clickEventWithHistoryDataItem:_item];
}

- (void)longPressed
{
    BBAHistoryTagViewContainer * container = (BBAHistoryTagViewContainer *)[[self superview] superview];
    [container setHistoryViewDeletedEnable:self];
}
- (void)showDeleteBtn
{
    self.layer.backgroundColor = kClearLayerColor;
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = kBorderColor;
    _imgViewContainer.hidden = NO;
}
- (void)hideDeleteBtn
{
    if(_imgView.hidden)return;//长按只能针对于一个tagview显示，加上此句提升性能
    _imgViewContainer.hidden = YES;
    self.layer.backgroundColor = kLayerColor;
    self.layer.borderWidth = 0.f;
}

- (void)deleteBtnPressed
{
    NSLog(@"deleteBtnPressed 告知外部数据需要被删除");
    BBAHisSugTagViewContainer * container = (BBAHisSugTagViewContainer *)[[self superview] superview];
    BBAHisSugPageView * page = (BBAHisSugPageView *)[container superview];
    [self removeFromSuperview];
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler] deleteEventWithSuggestDataItem:_item];
    [page.hisData removeObject:self.item];
    [page adjustContents];
}




@end
