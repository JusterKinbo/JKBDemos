//
//  BBASuggestDataItem.h
//  KBJDemos
//
//  Created by Juster on 2018/7/2.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBASuggestDataItem : NSObject

@property(nonatomic,copy)NSString * value;
@property(nonatomic,copy)NSString * cellClassName;

- (instancetype)initWithValue:(NSString *)value;

@end
