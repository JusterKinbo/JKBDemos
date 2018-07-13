//
//  BBAAppCommonInfo.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/31.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAAppCommonInfo.h"

@implementation BBAAppCommonInfo

+ (BOOL)isCurrentTabSpeedVideo
{
    return YES;
}
+ (BOOL)isCurrentHome
{
    return YES;
}
+ (NSString *)pasteboardString
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSString *pasteboardString = nil;
    
        pasteboardString = pasteboard.string;
        //去掉开头的\n \t 空格
        while ([pasteboardString length] > 1 && ([[pasteboardString substringToIndex:1] isEqualToString:@"\n"]
                   || [[pasteboardString substringToIndex:1] isEqualToString:@"\t"]
                   || [[pasteboardString substringToIndex:1] isEqualToString:@" "]))
            {
                pasteboardString = [pasteboardString substringFromIndex:1];
            }
    
        pasteboardString = [pasteboardString stringByReplacingOccurrencesOfString:@"\n"
                                                                       withString:@" "];
    return pasteboardString;
}


@end
