//
//  HighLinkRichText.m
//  KBJDemos
//
//  Created by Juster on 2018/7/13.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "HighLinkRichText.h"


@interface HighLinkRichText()
{
    NSMutableArray * targetArr ;//内容是字典，range、text、href给外界代理回调
}

@end

@implementation HighLinkRichText

static NSString * _dict_start = @"start";
static NSString * _dict_length = @"length";
static NSString * _dict_click_text = @"clickText";
static NSString * _dict_match_text = @"matchText";

- (instancetype) initWithText:(NSString *)text
{
    self=[self initWithFrame:CGRectZero text:text];
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame text:(NSString*)text
{
    self = [super initWithFrame:frame];
    if(self)
    {
        targetArr = [[NSMutableArray alloc]init];
        //欢迎使用探探, 在使用过程中有疑问请< a href=”tantanapp://feedback”>反馈</ a>
        
        self.attributedText = [self handleText:text];
        self.editable = NO;
        self.selectable = NO;
        [self addTapGesture];
    }
    
    return self;
}

// 处理text，根据<a></a>格式提取点击文字+range(修正后的range)
- (NSAttributedString *) handleText:(NSString*)text
{
    NSString *a_regex = @"<\\s*a[^<>]*?>\\s*(.*?)\\s*</\\s*a>";//正则+分组
    NSError * err = nil;
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:a_regex options:NSRegularExpressionCaseInsensitive error:&err];
    if(err){ return  [[NSMutableAttributedString alloc]initWithString:text];}
    NSArray * matches = [regex matchesInString:text options:NSMatchingReportProgress range:NSMakeRange(0, text.length)];
    NSMutableString * textStr = [[NSMutableString alloc]init];
    long start = 0;
    for (NSTextCheckingResult * ckr in matches)
    {
        NSRange matchRange = [ckr range];//全部
        NSRange clickRange = [ckr rangeAtIndex:1];//分组
        NSString * clickText = [text substringWithRange:clickRange];
        NSString * matchText = [text substringWithRange:matchRange];
        [textStr appendString:[text substringWithRange:NSMakeRange(start, matchRange.location-start)]];
        
        NSDictionary * dict = @{
                                _dict_start:@(textStr.length),
                                _dict_length:@(clickRange.length),
                                _dict_click_text:clickText,
                                _dict_match_text:matchText
                                };
        [textStr appendString:clickText];
        
        start = matchRange.location+matchRange.length;
        
        [targetArr addObject:dict];
        
    }
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc]initWithString:textStr];
    for (NSDictionary * dict in targetArr) {
        long start = ((NSNumber *)dict[_dict_start]).longValue ;
        long length = ((NSNumber *)dict[_dict_length]).longValue;
        NSRange range = NSMakeRange(start,length);
        
        NSDictionary * attrDic = @{
                                   NSUnderlineStyleAttributeName:@1,
                                   NSUnderlineColorAttributeName:[UIColor blueColor],
                                   NSForegroundColorAttributeName:[UIColor blueColor]
                                   };
        [attrStr addAttributes:attrDic range:range];
    }
    return attrStr;
}

/*
 处理点击
 方案1 attribute link text自带的delegate不灵敏
 方案2 考虑手势，但是手势后长按又不好使，会有选中效果，这也不是我需要的(需要设置textview的selectable、editable)
 感觉这就和label一样了但是，不一样，label缺少需要的某些函数比如closePosition/endDocument，原因在于lable没有实现uiinputtext协议
 range计算是否需要响应
 */
- (void) addTapGesture
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedTextView:)];
    [self addGestureRecognizer:tap];
}

// 通过手势获取点击的文字+range
- (void)tappedTextView:(UITapGestureRecognizer *)tapGesture {
    if (tapGesture.state != UIGestureRecognizerStateEnded) {
        return;
    }
    
    UITextView *textView = (UITextView *)tapGesture.view;
    CGPoint tapLocation = [tapGesture locationInView:textView];
    UITextPosition *textPosition = [textView closestPositionToPoint:tapLocation];
    
    NSInteger offset = [self offsetFromPosition:textPosition toPosition:self.endOfDocument];
    offset = self.attributedText.length - offset;
    //    NSLog(@"%ld",offset);
    
    for (NSDictionary * dict in targetArr) {
        long start = ((NSNumber *)dict[_dict_start]).longValue ;
        long length = ((NSNumber *)dict[_dict_length]).longValue;
        NSRange range = NSMakeRange(start,length);
        NSString * text =  dict[_dict_click_text];
        NSString * href = dict[_dict_match_text];
        if(NSLocationInRange(offset, range))
        {
            if(self.highLinkdelegate && [self.highLinkdelegate respondsToSelector:@selector(clickOnText: href:)])
            {
                [self.highLinkdelegate clickOnText:text href:href];
            }
            break;
        }
    }
    
    //    针对link的情况--由于点击效果选择弃用
    //    NSDictionary *attributes = [textView textStylingAtPosition:textPosition inDirection:UITextStorageDirectionForward];
    //    NSLog(@"2");
    //    NSString *s = attributes[NSLinkAttributeName];
    //    if([s isEqualToString:@"http://www.jianshu.com/users/37f2920f6848"])
    //    {
    //        NSLog(@"equals");
    //    }
    
    
}

@end
