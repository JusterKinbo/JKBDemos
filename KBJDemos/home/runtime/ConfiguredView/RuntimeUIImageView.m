//
//  RuntimeUIImageView.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeUIImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation RuntimeUIImageView



- (void)setImage_url:(NSString *)image_url
{
    [self sd_setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"pengyuyan02"]];
//    self.image = [UIImage imageNamed:@"pengyuyan02"];
}

@end
