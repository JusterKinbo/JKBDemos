//
//  BBASuggestDataItem.m
//  KBJDemos
//
//  Created by Juster on 2018/7/2.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "BBASuggestDataItem.h"

@implementation BBASuggestDataItem

- (instancetype)initWithValue:(NSString *)value
{
    self = [super init];
    if(self)
    {
        _value = value;//因为是nstring类型可以直接相等
    }
    return self;
}

@end
