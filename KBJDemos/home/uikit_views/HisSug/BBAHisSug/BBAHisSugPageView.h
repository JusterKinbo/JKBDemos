//
//  BBAHisSugPageView.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisSugTagViewContainer.h"

@class BBASuggestDataItem;

@interface BBAHisSugPageView : UIScrollView

@property(nonatomic,copy) NSMutableArray <BBASuggestDataItem *> * hisData;
@property(nonatomic,copy) NSMutableArray <BBASuggestDataItem *> * sugData;

//外部显示时设置用
- (void)realoadHisData:(NSArray <BBASuggestDataItem *> *) hisData
           SugData:(NSArray <BBASuggestDataItem *> *) sugData;
- (void)showForPirvateMode;

- (void)adjustContents;
- (void)hideHisSugContents;
- (void)showHisSugContents;
- (void)deleteAllHis;

- (NSUInteger)indexOfHisItem:(BBASuggestDataItem * ) item;
- (NSUInteger)indexOfSugItem:(BBASuggestDataItem * ) item;

- (CGRect)adjustHisSugViewFrameForKeyboardHeight:(CGFloat)height;

@end


