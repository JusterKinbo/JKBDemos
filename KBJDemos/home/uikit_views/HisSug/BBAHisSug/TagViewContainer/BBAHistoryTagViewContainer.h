//
//  BBAHistoryTagViewContainer.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "BBAHisSugTagViewContainer.h"
@class BBAHisSugTagView;

@interface BBAHistoryTagViewContainer : BBAHisSugTagViewContainer

- (void)setHistoryViewDeletedEnable:(BBAHisSugTagView *)view;
- (void)setDeleteBtnDisabled;
@end
