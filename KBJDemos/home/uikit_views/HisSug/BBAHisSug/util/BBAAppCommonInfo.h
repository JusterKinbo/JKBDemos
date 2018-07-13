//
//  BBAAppCommonInfo.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/31.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAAppCommonInfo : NSObject

+ (BOOL)isCurrentTabSpeedVideo;
+ (BOOL)isCurrentHome;

+ (NSString *)pasteboardString;

@end
