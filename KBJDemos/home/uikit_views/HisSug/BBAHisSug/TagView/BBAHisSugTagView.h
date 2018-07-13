//
//  BBAHisSugTagView.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBAHisSugTagViewProtocol.h"

@class BBASuggestDataItem;

@interface BBAHisSugTagView : UIView <BBAHisSugTagViewProtocol>

@property(nonatomic,strong) BBASuggestDataItem * _Nonnull item;

- (instancetype _Nonnull )initWithBBASuggestDataItem:(BBASuggestDataItem *_Nonnull)item;
- (instancetype _Nonnull )initWithBBASuggestDataItem:(BBASuggestDataItem *_Nonnull)item
                                    longPressEnabled:(BOOL)longPressEnabled;
- (instancetype _Nonnull )initWithBBASuggestDataItem:(BBASuggestDataItem *_Nonnull)item
                                            fontSize:(int)size
                                    longPressEnabled:(BOOL)longPressEnabled;

- (void)resetFrameWithItem:(BBASuggestDataItem *) item;

- (void)clicked;
- (void)longPressed;
- (void)hideDeleteBtn;
- (void)showDeleteBtn;
- (void)deleteBtnPressed;


@end
