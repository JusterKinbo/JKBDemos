//
//  UIView+RuntimeConfigured.m
//  KBJDemos
//
//  Created by Juster on 2018/9/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "UIView+RuntimeConfigured.h"
#import "UIColor+BBAHexColor.h"

@implementation UIView (RuntimeConfigured)

- (void)setFrame_string:(NSString *)frame_string
{
    self.frame = CGRectFromString(frame_string);
}

- (void)setBgcolor_hex_string:(NSString *)bgcolor_hex_string
{
    self.backgroundColor = [UIColor bba_colorWithHexString:bgcolor_hex_string];
}

/**
要求在设置前有有效的frame,因此需要dispatch到下一个循环
 */
- (void)setCorner_string:(NSString *)corner_string
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[corner_string floatValue]];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = self.bounds;
        maskLayer.path = bezierPath.CGPath;
        self.layer.mask = maskLayer;
    });
}

- (void)setConer_config:(NSDictionary *)coner_config
{
    NSString * cornerRadius = [coner_config objectForKey:@"cornerRadius"];
    NSString * cornerColor = [coner_config objectForKey:@"cornerColor"];
    NSString * lineWidth = [coner_config objectForKey:@"lineWidth"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[cornerRadius floatValue]];
        
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = self.bounds;
        maskLayer.path = bezierPath.CGPath;
        //有边框颜色才需要配置，无则不考虑
        if(lineWidth)
        {
            CAShapeLayer *borderLayer = [CAShapeLayer layer];
            borderLayer.lineWidth = [lineWidth floatValue];
            borderLayer.strokeColor = [UIColor bba_colorWithHexString:cornerColor].CGColor;
            borderLayer.fillColor = [UIColor clearColor].CGColor;
            borderLayer.path = bezierPath.CGPath;
            [self.layer insertSublayer:borderLayer atIndex:0];
        }
        self.layer.mask = maskLayer;
    });
}

@end
