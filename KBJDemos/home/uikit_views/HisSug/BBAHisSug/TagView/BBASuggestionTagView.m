//
//  BBASuggestionTagView.m
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBASuggestionTagView.h"
#import "BBAHisSugEventsHandler.h"

@implementation BBASuggestionTagView
{
    NSTimeInterval _lastTime;
    NSTimeInterval _interval;
}

- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item
{
    self = [self initWithBBASuggestDataItem:item longPressEnabled:NO];
    _lastTime = [NSDate date].timeIntervalSince1970;
    _interval = 0.5f;
    return self;
}

- (void)clicked
{
    NSTimeInterval currentTimeInterval = [NSDate date].timeIntervalSince1970;
    if(currentTimeInterval - _lastTime < _interval) return;
    _lastTime = currentTimeInterval;
    [[BBAHisSugEventsHandler sharedBBAHisSugEventsHandler] clickEventWithSuggestDataItem:self.item];
}

@end
