//
//  BBAHisSugEventsHandler.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/25.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisSugEventsHandler.h"
#import "BBAHisSugPageView.h"
#import "HisSugViewController.h"

//#import "BBAAccountFastLoginViewController.h"
//
@implementation BBAHisSugEventsHandler


static BBAHisSugEventsHandler * _instance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

+ (instancetype)sharedBBAHisSugEventsHandler
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[BBAHisSugEventsHandler alloc]init];
        }
    });
    return _instance;
}

- (id)copy
{
    return _instance;
}

- (id)mutableCopy
{
    return _instance;
}


- (void)clickEventWithHistoryDataItem:(BBASuggestDataItem *)item
{
    [self navToHisItem:item];
}

- (void)clickEventWithSuggestDataItem:(BBASuggestDataItem *)item
{
    [self navToSugItem:item];
}


- (void)deleteEventWithSuggestDataItem:(BBASuggestDataItem *)item//删除只有在静态时才有看，所以只有一个
{
    [self deleteSugWithItem:item];
}

- (void)deleteAllSuggestDataItems
{
    [self deleteAll];
}

#pragma --mark delete all

- (void) deleteAll
{
    // 清除历史
}

- (void)popResultView:(NSString *)aHintText
{
    
}


#pragma --mark delete with item




- (void)deleteSugWithItem:(BBASuggestDataItem *)item
{
    
}

// 删除云端历史记录(登录状态下)
- (void)deleteSyncHistory:(BBASuggestDataItem*)tItem
{
    
}

#pragma --mark clicked
/**
 @param item view绑定的sugdata
 */
- (void)navToHisItem: (BBASuggestDataItem *)item
{
   
}

- (void)textfieldResignFirstResponder
{
   
}

- (void)goSuggestURL:(BBASuggestDataItem *)aSuggestDataItem
{
    
}

#pragma -mark sug click

- (void)navToSugItem: (BBASuggestDataItem *)item
{
}


#pragma -mark morehistory
- (void)showMoreHistory
{
    NSLog(@"showMoreHistory");
}


#pragma -mark loginForMorehistory
- (void)loginForMorehistory
{

}


- (void)hideSuggestTVFooterView
{
   
}

- (void)openHissugPageView
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"HisSugViewControolerUpdateUI" object:nil];
}
@end
