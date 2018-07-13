//
//  BBAHisSugTagViewProtocol.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BBASuggestDataItem;

/**
 tagview 协议，实现此协议的必须是view
 */
@protocol BBAHisSugTagViewProtocol <NSObject>


@required
- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item;
- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item
                          longPressEnabled:(BOOL)longPressEnabled;
- (instancetype)initWithBBASuggestDataItem:(BBASuggestDataItem *)item
                                  fontSize:(int)size
                          longPressEnabled:(BOOL)longPressEnabled;

@required
#pragma --mark 单击导航词条
- (void)clicked;

@optional
#pragma --mark 长按显示删除btn，点击删除
- (void)longPressed;
- (void)hideDeleteBtn;
- (void)showDeleteBtn;
- (void)deleteBtnPressed;
@end
