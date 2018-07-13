//
//  BBAHisSugTagViewContainer.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBAHisSugTagViewContainerProtocol.h"
#import "BBAHisSugTagViewProtocol.h"
//#import "BBAHisSugTagView.h"
@class BBASuggestDataItem;
@class BBAHisTagViewFactory;

#define kBtnWidth 37
#define kBtnImageWidth 16
#define kScreenMargin 17 //屏幕左侧空余
#define kHeight 16 //header view 高度
#define kTagViewMargin 10
#define kTageViewVertialMargin 10
#define kContentMargin 6
#define kScreenWidth (UIScreen.mainScreen.bounds.size.width)


@interface BBAHisSugTagViewContainer : UIView <BBAHisSugTagViewContainerProtocol>


@property(nonatomic,strong) UIView * headerView;
@property(nonatomic,strong) UIView * contentView;

- (void)hideContentView;
- (void)showContentView;

- (void) resetContentViewWithBBASuggestDataItems:(NSArray *)listData;

- (void)adjustFrameByYAxis:(int)yAxis;
- (void)adjustFrameBySuperView;
- (void)adjustFrameBySiblingView:(UIView *_Nonnull)sibling;

@end
