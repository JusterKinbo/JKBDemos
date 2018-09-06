//
//  UIView+RuntimeConfigured.h
//  KBJDemos
//
//  Created by Juster on 2018/9/6.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RuntimeConfigured)

- (void)setFrame_string:(NSString *)frame_string;

@property (nonatomic,copy)NSString * corner_string;
@property (nonatomic,copy) NSString *bgcolor_hex_string;
@property (nonatomic,copy) NSDictionary *coner_config;

@end
