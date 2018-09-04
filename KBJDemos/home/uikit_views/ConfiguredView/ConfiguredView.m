//
//  ConfiguredView.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "ConfiguredView.h"
#import "ConfigredViewMarcos.h"
#import "UIColor+BBAHexColor.h"

@implementation ConfiguredView

- (instancetype)initWithCongfiguredDictionary:(NSDictionary *)dict
{
    ConfiguredView * view = [[ConfiguredView alloc]init];
    NSDictionary * containerDict = [dict objectForKey:ContainerView ];
    if ([containerDict objectForKey:BackgroundColor]) {
        view.backgroundColor = [UIColor bba_colorWithHexString:[containerDict objectForKey:BackgroundColor]];
    }
    if([containerDict objectForKey:Frame])
    {
        view.frame = CGRectFromString([containerDict objectForKey:Frame]);
    }
    if([dict objectForKey:ImageViews])
    {
        NSArray * imgs = [dict objectForKey:ImageViews];
        for(NSDictionary * dict in imgs)
        {
            UIImageView * img = [[UIImageView alloc]init];
            if([dict objectForKey:ImageURL])
            {
                img.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dict objectForKey:ImageURL]]]];
            }
            if([dict objectForKey:Frame])
            {
                img.frame = CGRectFromString([dict objectForKey:Frame]);
            }
            [view addSubview:img];
        }
    }
    
    if([dict objectForKey:Buttons])
    {
        NSArray * btns = [dict objectForKey:Buttons];
        for(NSDictionary * dict in btns)
        {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            if([dict objectForKey:Title])
            {
                [btn setTitleColor:[UIColor blackColor] forState:normal];
                [btn setTitle:[dict objectForKey:Title] forState:UIControlStateNormal];
            }
            if([dict objectForKey:Frame])
            {
                btn.frame = CGRectFromString([dict objectForKey:Frame]);
            }
            [view addSubview:btn];
            btn.tag = [btn.titleLabel.text hash];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    return view;
}

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"btn tag is %ld",btn.tag);
}

@end
