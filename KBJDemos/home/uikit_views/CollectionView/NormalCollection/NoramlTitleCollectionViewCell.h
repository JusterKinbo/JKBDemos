//
//  NoramlTitleCollectionViewCell.h
//  KBJDemos
//
//  Created by Juster on 2018/10/24.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Height_NormalColltionViewCell 80
#define Identifier_NoramlTitleCollectionViewCell @"Identifier_NoramlTitleCollectionViewCell"

#import "NormalColltionViewCellModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface NoramlTitleCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIButton * btnDelete;

@property (nonatomic,strong) NormalColltionViewCellModel * model;



- (void)setupUI;
@end

NS_ASSUME_NONNULL_END
