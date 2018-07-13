//
//  UIColor+BBAHexColor.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/28.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BBAHexColor)

+ (UIColor *)bba_colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)bba_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
