//
//  RuntimeLabel.h
//  KBJDemos
//
//  Created by Juster on 2018/9/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 iOS中默认的UILabel中的文字在竖直方向上只能居中对齐，从UILabel开启分类，实现了居上对齐，居中对齐，居下对齐。
 */
typedef NS_ENUM(NSInteger, VerticalAlignment)
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
};



/**
 attribute string 参考：https://www.jianshu.com/p/30505a7a98c7
 */
@interface RuntimeLabel : UILabel

@property (nonatomic,assign) VerticalAlignment verticalAlignment;

@property (nonatomic,copy) NSString *stringverticalAlignment_string;
@property (nonatomic,copy) NSString *alignment_string;
@property (nonatomic,copy) NSString *font_color_string;
@property (nonatomic,copy) NSString *font_size_string;
@property (nonatomic,copy) NSString *line_breakmode_string;

/**
 以...结尾
 */
@property (nonatomic,copy) NSString *text_single_line_string;
/**
 依赖frame宽高，不支持attribute字体（因为支持最大多少行）
 多行文本自动折行，默认...结尾/中间对齐
 支持设置最多多少行、字体大小、颜色、超过多少行截断方式
 */
@property (nonatomic,copy) NSDictionary *text_multi_line_config_dict;

/**
 外界可配置
    字符从哪个到哪个
    字体颜色、大小
    下划线（+样式）、中间线（+样式）
    添加图片
 */
@property (nonatomic,copy) NSDictionary *attribute_font_config_dict;


@end
