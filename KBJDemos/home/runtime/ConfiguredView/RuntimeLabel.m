//
//  RuntimeLabel.m
//  KBJDemos
//
//  Created by Juster on 2018/9/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeLabel.h"
#import "UIColor+BBAHexColor.h"
#import "RuntimeCongfigureViewMarcos.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RuntimeLabel

- (void)setStringverticalAlignment_string:(NSString *)stringverticalAlignment_string
{
    if([stringverticalAlignment_string isEqualToString:LABEL_VERTICAL_ALIGNMENT_MIDDLE])
    {
        [self setVerticalAlignment:VerticalAlignmentMiddle];
    }else if([stringverticalAlignment_string isEqualToString:LABEL_VERTICAL_ALIGNMENT_TOP])
    {
        [self setVerticalAlignment:VerticalAlignmentTop];
    }else if([stringverticalAlignment_string isEqualToString:LABEL_VERTICAL_ALIGNMENT_BOTTOM])
    {
        [self setVerticalAlignment:VerticalAlignmentBottom];
    }else
    {
        [self setVerticalAlignment:VerticalAlignmentMiddle];
    }
        
}

- (void)setAlignment_string:(NSString *)alignment_string
{
    if([alignment_string isEqualToString:LABEL_ALIGENMENT_CENTER])
    {
         [self setTextAlignment:NSTextAlignmentCenter];
    }
    else if([alignment_string isEqualToString:LABEL_ALIGENMENT_LEFT])
    {
        [self setTextAlignment:NSTextAlignmentLeft];
    }else if([alignment_string isEqualToString:LABEL_ALIGENMENT_RIGHT])
    {
        [self setTextAlignment:NSTextAlignmentRight];
    }else
    {
        [self setTextAlignment:NSTextAlignmentCenter];
    }
}

- (void)setFont_color_string:(NSString *)font_color_string
{
     [self setTextColor:[UIColor bba_colorWithHexString:font_color_string]];
}

- (void)setFont_size_string:(NSString *)font_size_string
{
    [self setFont:[UIFont systemFontOfSize:[font_size_string floatValue]]];
}

- (void)setLine_breakmode_string:(NSString *)line_breakmode_string
{
    if([line_breakmode_string isEqualToString: LABEL_LINE_BREAKMODE_TRUNCATE_TAIL])
    {
         [self setLineBreakMode:NSLineBreakByTruncatingTail];
    }
    else if([line_breakmode_string isEqualToString: LABEL_LINE_BREAKMODE_WROD_WRAP])
    {
        [self setLineBreakMode:NSLineBreakByWordWrapping];
    }else if([line_breakmode_string isEqualToString: LABEL_LINE_BREAKMODE_CHAR_WRAP])
    {
        [self setLineBreakMode:NSLineBreakByCharWrapping];
    }else if([line_breakmode_string isEqualToString: LABEL_LINE_BREAKMODE_TRUNCATE_HEAD])
    {
        [self setLineBreakMode:NSLineBreakByTruncatingHead];
    }
    else if([line_breakmode_string isEqualToString: LABEL_LINE_BREAKMODE_TRUNCATE_MIDDLE])
    {
        [self setLineBreakMode:NSLineBreakByTruncatingMiddle];
    }else
    {
        [self setLineBreakMode:NSLineBreakByTruncatingTail];
    }
    
}

- (void)setText_single_line_string:(NSString *)text_single_line_string
{
    [self setText:text_single_line_string];
    self.numberOfLines = 1;
    self.lineBreakMode = NSLineBreakByTruncatingTail;
}
/*
 多行文本自动折行，默认...结尾
 支持设置最多多少行、字体大小、颜色、超过多少行截断方式
 */
- (void)setText_multi_line_config_dict:(NSDictionary *)text_multi_line_config_dict
{
    NSString * text = [text_multi_line_config_dict objectForKey:LABEL_MULTI_LINE_TEXT];
    if(text)[self setText:text];
    NSString * maxLineNumber = [text_multi_line_config_dict objectForKey:LABEL_MAX_LINENUMBER];
    if(![maxLineNumber isEqualToString:@"1"])
    {
        NSInteger max = [maxLineNumber integerValue];
//        NSDictionary *attributesDictionary = @{NSFontAttributeName:self.font};
//        CGRect  rect = [self.text boundingRectWithSize:self.bounds.size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
//        CGFloat lineHeight = self.font.lineHeight;
//        if((rect.size.height / lineHeight)>max)
//        {
//            self.numberOfLines = max;
//        }else
//        {
//            self.numberOfLines = 0;
//        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             NSDictionary *attributesDictionary = @{NSFontAttributeName:self.font};
             CGRect  rect = [self.text boundingRectWithSize:self.bounds.size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
            CGFloat lineHeight = self.font.lineHeight;
            if((rect.size.height / lineHeight)>max)
            {
                self.numberOfLines = max;
            }else
            {
                self.numberOfLines = 0;
            }
        });
    }
    NSString * lineBreakMode = [text_multi_line_config_dict objectForKey:LABEL_LINE_BREAKMODE];
    [self setLine_breakmode_string:lineBreakMode];
    NSString * alignment = [text_multi_line_config_dict objectForKey:LABEL_ALIGENMENT];
    [self setAlignment_string:alignment];
    NSString * fontSize = [text_multi_line_config_dict objectForKey:LABEL_FONT_SIZE];
    if(fontSize){[self setFont_size_string:fontSize];}
    NSString * fontColor = [text_multi_line_config_dict objectForKey:LABEL_FONT_COLOR];
    if(fontColor){[self setFont_color_string:fontColor];}
}

#pragma --mark 垂直布局
@synthesize verticalAlignment = verticalAlignment_;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddle;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}


#pragma --mark 富文本
- (void)setAttribute_font_config_dict:(NSDictionary *)attribute_font_config_dict
{
    //优先级高于外部，同时需要先设置text，因此延后设置
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.text];
        NSArray * subTextArr = [attribute_font_config_dict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_SUBTEXT];
        if(subTextArr)
        {
            for(NSDictionary * textDict in subTextArr)
            {
                NSMutableDictionary * attrDict = [[NSMutableDictionary alloc]init];
                NSString * textColor = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_COLOR];
                if(textDict){[attrDict setValue:[UIColor bba_colorWithHexString:textColor] forKey:NSForegroundColorAttributeName];}
                NSString * textFontSize = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_FONT_SIZE];
                if(textFontSize){[attrDict setValue:[UIFont systemFontOfSize:[textFontSize floatValue]] forKey:NSFontAttributeName];}
                NSString * underLineColor = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_UNDERLINE_COLOR];
                if(underLineColor){[attrDict setValue:[UIColor bba_colorWithHexString:underLineColor] forKey:NSUnderlineColorAttributeName];}
                NSString * underLineStyle = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_UNDERLINE_STYLE];
                if(underLineStyle){[self parseLineStyle:underLineStyle toAttrDict:attrDict forKey:NSUnderlineStyleAttributeName];}
                NSString * strikeThroughColor = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STRKETHROUGH_COLOR];
                if(strikeThroughColor){[attrDict setValue:[UIColor bba_colorWithHexString:strikeThroughColor] forKey:NSStrikethroughColorAttributeName];}
                NSString * strikeThroughStyle = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STRKETHROUGH_STYLE];
                if(strikeThroughStyle){[self parseLineStyle:strikeThroughStyle toAttrDict:attrDict forKey:NSStrikethroughStyleAttributeName];}
                NSString * range = [textDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_TEXT_RANGE];
                [attrStr addAttributes:attrDict range:NSRangeFromString(range)];
            }
        }
        NSArray * attachArr = [attribute_font_config_dict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT];
        if(attachArr)
        {            
            for(NSDictionary * attachDict in attachArr)
            {
                NSTextAttachment *attach = [[NSTextAttachment alloc] init];
                NSURL * url = [NSURL URLWithString:[attachDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_IMAGE_URL]];
//                attach.image =[UIImage imageNamed:@"games"];
                attach.image = [UIImage imageWithData:[NSData
                                                       dataWithContentsOfURL:[NSURL URLWithString:[attachDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_IMAGE_URL]]]];
                attach.bounds = CGRectFromString([attachDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_IMAGE_BOUNDS]);
                NSAttributedString *attachStr = [NSAttributedString attributedStringWithAttachment:attach];
                //                [attrStr appendAttributedString:attachStr];
                NSString * index = [attachDict objectForKey:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_ATTACHMENT_INDEX];
                [attrStr insertAttributedString:attachStr atIndex:[index integerValue]];
            }
        }
        self.attributedText = attrStr;
    });
}

- (void)parseLineStyle:(NSString *)lineStyle toAttrDict:(NSMutableDictionary *)attrDict forKey:(NSAttributedStringKey)attriKey
{
    if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_SINGLE])
    {
        [attrDict setValue:@(NSUnderlineStyleSingle) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_THICK])
    {
        [attrDict setValue:@(NSUnderlineStyleThick) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DOUBLE])
    {
        [attrDict setValue:@(NSUnderlineStyleDouble) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_SOLID])
    {
        [attrDict setValue:@(NSUnderlinePatternSolid) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DOT])
    {
        [attrDict setValue:@(NSUnderlinePatternDot) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DASH])
    {
        [attrDict setValue:@(NSUnderlinePatternDash) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DASH_DOT])
    {
        [attrDict setValue:@(NSUnderlinePatternDashDot) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_DASH_DOT_DOT])
    {
        [attrDict setValue:@(NSUnderlinePatternDashDotDot) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_BY_WORD])
    {
        [attrDict setValue:@(NSUnderlineByWord) forKey:attriKey];
    }else if([lineStyle isEqualToString:LABEL_ATTRIBUTE_FONT_CONFIG_DICT_STYLE_NONE])
    {
        [attrDict setValue:@(NSUnderlineStyleNone) forKey:attriKey];
    }else
    {
        [attrDict setValue:@(NSUnderlineStyleSingle) forKey:attriKey];
    }
}


@end
