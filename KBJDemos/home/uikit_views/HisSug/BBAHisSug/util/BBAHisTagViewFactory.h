//
//  BBAHisTagViewFactory.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/25.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BBAHisSugTagView;
@class BBASuggestDataItem;

__attribute__((objc_subclassing_restricted))//防止被子类化，也可防止被子类重写
@interface BBAHisTagViewFactory : NSObject

+ (instancetype)sharedBBAHisTagViewFactory;

- (BBAHisSugTagView *)produceHistoryTagViewWithBBASuggestDataItem:(BBASuggestDataItem *)item;
- (BBAHisSugTagView *)produceSuggestionTagViewWithBBASuggestDataItem:(BBASuggestDataItem *)item;

- (void)resetHisUsedCount;
- (void)resetSugUsedCount;
@end
