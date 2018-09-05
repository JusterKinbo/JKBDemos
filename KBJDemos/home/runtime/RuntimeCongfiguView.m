//
//  RuntimeCongfiguView.m
//  KBJDemos
//
//  Created by Juster on 2018/9/4.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "RuntimeCongfiguView.h"
#import <objc/message.h>
#import "RuntimeCongfigureViewMarcos.h"

@implementation RuntimeCongfiguView


- (instancetype)initWithCongfiguredDictionary:(NSDictionary *)dict
{
    
    RuntimeCongfiguView * view = [[RuntimeCongfiguView alloc]init];
    [self parseConfigDictionary:dict toView:view];
//        NSArray * viewArr = [dict objectForKey:d_key];
//        for(NSDictionary * viewDict in viewArr)
//        {
//            UIView * subView = [[cls alloc]init];
//            for(NSString * v_key in viewDict.allKeys)
//            {
//                NSString *setterName = v_key;
//                NSString *firstLetter = [NSString stringWithFormat:@"%c", [setterName characterAtIndex:0]];
//                setterName = [setterName substringFromIndex:1];
//                setterName = [NSString stringWithFormat:@"%@%@", firstLetter.uppercaseString, setterName];
//                setterName = [NSString stringWithFormat:@"set%@:", setterName];
//                SEL setter = NSSelectorFromString(setterName);
//                if ([subView respondsToSelector:setter]) {
//                    ((void (*)(id, SEL, id))objc_msgSend)(subView, setter,  [viewDict objectForKey:v_key]);
//                }
//            }
//            [view addSubview:subView];
//        }
    
    
    return view;
}

- (void)parseConfigDictionary:(NSDictionary *) dict toView:(UIView *)view
{
    for(NSString * d_key in dict.allKeys)
    {
        Class cls = NSClassFromString(d_key);
        id obj = [dict objectForKey:d_key];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSArray * viewArr = (NSArray *)obj;//[dict objectForKey:d_key];
            for(NSDictionary * viewDict in viewArr)
            {
                UIView * subView = [[cls alloc]init];
                if([viewDict objectForKey:CHILDREN])
                {
                    [self parseConfigDictionary:[viewDict objectForKey:CHILDREN] toView:subView];
                }
                for(NSString * v_key in viewDict.allKeys)
                {
                    if([v_key isEqualToString:CHILDREN]) continue;
                    NSString *setterName = v_key;
                    NSString *firstLetter = [NSString stringWithFormat:@"%c", [setterName characterAtIndex:0]];
                    setterName = [setterName substringFromIndex:1];
                    setterName = [NSString stringWithFormat:@"%@%@", firstLetter.uppercaseString, setterName];
                    setterName = [NSString stringWithFormat:@"set%@:", setterName];
                    SEL setter = NSSelectorFromString(setterName);
                    if ([subView respondsToSelector:setter]) {
                        ((void (*)(id, SEL, id))objc_msgSend)(subView, setter,  [viewDict objectForKey:v_key]);
                    }
                }
                [view addSubview:subView];
            }
        }else//字典--只有一个类
        {
            UIView * subView = [[cls alloc]init];
            NSDictionary * viewDict = (NSDictionary * )obj;
            if([viewDict objectForKey:CHILDREN])
            {
                [self parseConfigDictionary:[viewDict objectForKey:CHILDREN] toView:subView];
            }
            for(NSString * v_key in viewDict.allKeys)
            {
                if([v_key isEqualToString:CHILDREN]) continue;
                NSString *setterName = v_key;
                NSString *firstLetter = [NSString stringWithFormat:@"%c", [setterName characterAtIndex:0]];
                setterName = [setterName substringFromIndex:1];
                setterName = [NSString stringWithFormat:@"%@%@", firstLetter.uppercaseString, setterName];
                setterName = [NSString stringWithFormat:@"set%@:", setterName];
                SEL setter = NSSelectorFromString(setterName);
                if ([subView respondsToSelector:setter]) {
                    ((void (*)(id, SEL, id))objc_msgSend)(subView, setter,  [viewDict objectForKey:v_key]);
                }
            }
            [view addSubview:subView];
        }
    }
}


- (void)btnClick:(UIButton *)btn
{
    NSLog(@"btn tag is %ld",btn.tag);
}
@end
