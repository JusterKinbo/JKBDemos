//
//  RuntimeUIImageView.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeUIImageView.h"

@implementation RuntimeUIImageView



- (void)setFrame_string:(NSString *)frame_string
{
    self.frame = CGRectFromString(frame_string);
}

- (void)setImage_url:(NSString *)image_url
{
//    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image_url]]];
    self.image = [UIImage imageNamed:@"games"];
}

@end
