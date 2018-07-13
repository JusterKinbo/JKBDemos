//
//  BBAHisSugTagViewContainerProtocol.h
//  BoxCore
//
//  Created by Jia,Chunhui on 2018/5/23.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBAHisSugTagViewProtocol.h"

@protocol BBAHisSugTagViewContainerProtocol <NSObject>


@required
- (void)hideContentView;
- (void)showContentView;

- (void)adjustFrameByYAxis:(int)yAxis;
- (void)adjustFrameBySuperView;
- (void)adjustFrameBySiblingView:(UIView *)sibling;

@end
