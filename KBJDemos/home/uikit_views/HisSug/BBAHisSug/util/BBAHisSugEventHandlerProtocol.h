//
//  BBAHisSugTagViewEventHandlerProtocol.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/25.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBASuggestDataItem;

@protocol BBAHisSugEventHandlerProtocol <NSObject>

@required
- (void)clickEventWithHistoryDataItem:(BBASuggestDataItem *)item;
- (void)clickEventWithSuggestDataItem:(BBASuggestDataItem *)item;
- (void)deleteEventWithSuggestDataItem:(BBASuggestDataItem *)item;
- (void)deleteAllSuggestDataItems;
- (void)showMoreHistory;
- (void)loginForMorehistory;
- (void)hideSuggestTVFooterView;
- (void)openHissugPageView;
@end
