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
                [self configSubView:subView withDictionary:viewDict];
                [view addSubview:subView];
            }
        }else//字典--只有一个类
        {
            UIView * subView = [[cls alloc]init];
            NSDictionary * viewDict = (NSDictionary * )obj;
            [self configSubView:subView withDictionary:viewDict];
            [view addSubview:subView];
        }
    }
}

- (void)configSubView:(UIView *)subView withDictionary:(NSDictionary *)viewDict
{
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
}

#pragma --mark 水平、垂直布局
- (instancetype)initWithLayoutArray:(NSArray *)layoutConfigArr
{
    RuntimeCongfiguView * view = [[RuntimeCongfiguView alloc]init];
    [self parseLayoutConfig:layoutConfigArr toView:view];
    return view;
}
- (void)parseLayoutConfig:(NSArray *)layoutArr toView:(UIView *)view
{
    CGRect rect = CGRectZero;
    for(NSDictionary * viewDict in layoutArr)
    {
        if([viewDict objectForKey:LAYOUT_STYLE])
        {
            if([[viewDict objectForKey:LAYOUT_STYLE] isEqualToString:HORIZONTAL_LAYOUT])
            {
                rect = [self parseLayoutDict:viewDict toView:view horizontal:YES relativeToRect:rect];
            }
            else
            {
                rect = [self parseLayoutDict:viewDict toView:view horizontal:NO relativeToRect:rect];
            }
        }else //一个view
        {
            Class cls = NSClassFromString([viewDict objectForKey:VIEW_CLASS]);
            UIView * subView = [[cls alloc]init];
            NSMutableArray * attrs = [viewDict.allKeys mutableCopy];
            if([viewDict objectForKey:CHILDREN])
            {
                //处理子view--需要考虑layout
                [self parseLayoutConfig:[viewDict objectForKey:CHILDREN] toView:subView];
            }
            NSMutableDictionary * attrDict = [viewDict mutableCopy];
            if(![viewDict objectForKey:FRAME])
            {
                CGPoint point = CGPointFromString([viewDict objectForKey:LAYOUT_MARGIN]);
                CGSize size = CGSizeFromString([viewDict objectForKey:LAYOUT_SIZE]);
                rect = CGRectMake(point.x, point.y, size.width, size.height);
                [attrDict setObject:NSStringFromCGRect(rect) forKey:FRAME];
                attrs = [attrDict.allKeys mutableCopy];
                [attrs removeObject:LAYOUT_MARGIN];
                [attrs removeObject:LAYOUT_SIZE];
            }
            [attrs removeObject:VIEW_CLASS];
            [attrs removeObject:CHILDREN];
            [self parseViewAttrs:attrs withConfigDict:attrDict toView:subView];
            [view addSubview:subView];
        }
    }
}

- (CGRect)parseLayoutDict:(NSDictionary *)layoutDict toView:(UIView *)view horizontal:(BOOL)horizontal relativeToRect:(CGRect)relativeRect
{
    //处理布局view
    CGRect rect = CGRectZero;
    NSMutableArray * layout_view_attrs = [layoutDict.allKeys mutableCopy];
    UIView * layout_view = [[UIView alloc]init];

    [layout_view_attrs removeObject:LAYOUT_STYLE];
    [layout_view_attrs removeObject:LAYOUT_SUB_VIEWS];
    rect = [self parseLayoutViewDict:layoutDict toLayoutView:layout_view relativeToRect:relativeRect horizontal:horizontal];
    //处理layout子view
    CGRect subview_rect = CGRectZero;
    NSArray * layout_subviews = [layoutDict objectForKey:LAYOUT_SUB_VIEWS];
    for(NSDictionary * layout_subview_dict in layout_subviews)
    {
        if([layout_subview_dict objectForKey:LAYOUT_STYLE])//水平、垂直子布局
        {
             if([[layout_subview_dict objectForKey:LAYOUT_STYLE] isEqualToString:HORIZONTAL_LAYOUT])
             {
                 subview_rect = [self parseLayoutDict:layout_subview_dict toView:layout_view horizontal:YES relativeToRect:subview_rect];
             }else
             {
                 subview_rect = [self parseLayoutDict:layout_subview_dict toView:layout_view horizontal:NO relativeToRect:subview_rect];
             }
        }else
        {
            Class cls = NSClassFromString([layout_subview_dict objectForKey:VIEW_CLASS]);
            UIView * layout_subView = [[cls alloc]init];
            NSMutableArray * keys = [layout_subview_dict.allKeys mutableCopy];
            [keys removeObject:VIEW_CLASS];
            if([layout_subview_dict objectForKey:CHILDREN])
            {
                //处理子view
                [self parseLayoutConfig:[layout_subview_dict objectForKey:CHILDREN] toView:layout_subView];
                [keys removeObject:CHILDREN];
            }
            //需要考虑子view的layout
            subview_rect = [self parseLayoutViewDict:layout_subview_dict toLayoutView:layout_subView relativeToRect:subview_rect horizontal:horizontal];
            [layout_view addSubview:layout_subView];
        }
    }
    
    [view addSubview:layout_view];
    return rect;
}

- (CGRect)parseLayoutViewDict:(NSDictionary *)viewDict toLayoutView:(UIView *)layout_view relativeToRect:(CGRect)relativeRect horizontal:(BOOL)horizontal
{
    CGRect rect = CGRectZero;
    NSMutableArray * attrs = nil;
    NSMutableDictionary * attrDict = [viewDict mutableCopy];
    if([viewDict objectForKey:FRAME])
    {
        rect = CGRectFromString([viewDict objectForKey:FRAME]);
        attrs = [viewDict.allKeys mutableCopy];
    }else //解析margen与size构造frame
    {
        CGPoint point = CGPointFromString([viewDict objectForKey:LAYOUT_MARGIN]);
        CGSize size = CGSizeFromString([viewDict objectForKey:LAYOUT_SIZE]);
        if(horizontal)
        {
            rect = CGRectMake(relativeRect.origin.x+relativeRect.size.width+point.x, point.y, size.width, size.height);
        }else
        {
            rect = CGRectMake(point.x, relativeRect.origin.y+relativeRect.size.height+point.y, size.width, size.height);
        }
        [attrDict setObject:NSStringFromCGRect(rect) forKey:FRAME];
        attrs = [attrDict.allKeys mutableCopy];
        [attrs removeObject:LAYOUT_MARGIN];
        [attrs removeObject:LAYOUT_SIZE];
    }
    [self parseViewAttrs:attrs withConfigDict:attrDict toView:layout_view];
    return rect;
}

#pragma --mark 新版解析
- (instancetype)initWithCongfiguredArray:(NSArray *)configArr
{
    
    RuntimeCongfiguView * view = [[RuntimeCongfiguView alloc]init];
    [self parseConfigArray:configArr toView:view];
    return view;
}

- (void)parseConfigArray:(NSArray *) configArr toView:(UIView *)view
{
    for(NSDictionary * viewDict in configArr)
    {
        Class cls = NSClassFromString([viewDict objectForKey:VIEW_CLASS]);
        UIView * subView = [[cls alloc]init];
        NSMutableArray * keys = [viewDict.allKeys mutableCopy];
        [keys removeObject:VIEW_CLASS];
        if([viewDict objectForKey:CHILDREN])
        {
           //处理子view
            [self parseConfigArray:[viewDict objectForKey:CHILDREN] toView:subView];
            [keys removeObject:CHILDREN];
        }
        [self parseViewAttrs:keys withConfigDict:viewDict toView:subView];
        [view addSubview:subView];
    }
}

- (void)parseViewAttrs:(NSArray *)viewAttrs withConfigDict:(NSDictionary *)viewDict toView:(UIView *)view
{
    for(NSString * v_key in viewAttrs)
    {
        NSString *setterName = v_key;
        NSString *firstLetter = [NSString stringWithFormat:@"%c", [setterName characterAtIndex:0]];
        setterName = [setterName substringFromIndex:1];
        setterName = [NSString stringWithFormat:@"%@%@", firstLetter.uppercaseString, setterName];
        setterName = [NSString stringWithFormat:@"set%@:", setterName];
        SEL setter = NSSelectorFromString(setterName);
        if ([view respondsToSelector:setter]) {
            ((void (*)(id, SEL, id))objc_msgSend)(view, setter,  [viewDict objectForKey:v_key]);
        }
    }
}

@end
