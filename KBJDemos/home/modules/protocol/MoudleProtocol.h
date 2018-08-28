//
//  MoudleProtocol.h
//  KBJDemos
//
//  Created by Juster on 2018/8/17.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 + - 方法可以同名
 + 必须走类方法 - 必须走实例方法，这点与runtime是相应的
 */
@protocol MoudleProtocol <NSObject>

+ (void)getNumber;
- (void)getNumber;

@end
