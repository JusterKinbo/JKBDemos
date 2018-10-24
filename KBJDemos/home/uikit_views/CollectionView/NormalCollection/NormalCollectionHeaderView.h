//
//  NormalCollectionHeaderView.h
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>


#define Height_NormalCollectionHeaderView 40
#define Identifier_NormalCollectionHeaderView @"Identifier_NormalCollectionHeaderView"

#import "NormalCollectionHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN



@interface NormalCollectionHeaderView : UICollectionReusableView


@property (nonatomic,strong) NormalCollectionHeaderModel * model;


- (void)setupUI;
@end

NS_ASSUME_NONNULL_END
